---
id: lcbi86uatbzz4t0rd9sdcyu
title: Tables
desc: ''
updated: 1732726863572
created: 1732723924200
---


The purpose of this document would be to give the most common tables used in the CS-BQRT estimations, .their common uses their alternatives and sometimes their history we're going to go through a work example which would show us how we could possibly extend the current estimator while reusing some pieces of it.


# Overall structure of the CSBQRT estimator

We use is an (likely imperfect) replica of the production assignment, algorithm implemented in SQL.
Here we will see the estimator as a series of SQL queries that try to assign adunits to experiments.
The assumption of the all units exist in a static equilibrium with respect to the traffic requests which represent the experiments. This assumption seems reasonable, but also there there are reasons to attempt to check it again. We will not be looking into the but we will not that it is assumption is blroken. It would require significant redesign of the current estimation procedure.

# Case Study

We will attempt to create a new SQL query, which will estimate the number of funding needs to be assigned in an experiment that is not currwe will show how to use the current existing curious tables and how to modify them in order to this goal. We will discuss trade of so along the way. of so along the way.


# Tables

| Table Name                                                       | Frequency | Role in the Query                                                                         |
|------------------------------------------------------------------|-----------|-------------------------------------------------------------------------------------------|
| `cdb.qrt_budget.csbqrt_entities`                                 | 1         | Contains entities related to experiments in `manual_selection` CTE                        |
| `cdb.qrt_budget.csbqrt_scheduler_estimation_requests`            | 1         | Contains estimation requests in `request` CTE                                             |
| `cdb.qrt_budget.bqrt_schedule_adv_exp_request`                   | Multiple  | Contains experiment scheduling requests in `allocated_experiments` CTE                    |
| `cdb.qrt_budget.bqrt_schedule_batch`                             | 1         | Provides batch information in `experiment_batch_index` CTE                                |
| `cdb.qrt_budget.abqrt_experiments`                               | Multiple  | Holds experiment data in `allocated_experiments` and `candidates` CTEs                    |
| `xdb.ads_ranking_experiment.qrt_scheduled_experiments`           | Multiple  | Contains scheduled experiment details in `allocated_experiments` and `candidates` CTEs    |
| `cdb.qrt_budget.csbqrt_scheduler_estimation_request_candidates`  | 1         | Lists candidate experiments for estimation in `candidates` CTE                            |
| `bqrt_traffic_measurable_adunits_fast`                           | 1         | Provides ad unit data in the `Adunits` section                                            |
| `bqrt_traffic_measurable_adunits_fast` (aliased as `units`)      | Multiple  | Used for matching rules to align ad units with experiments                                |
| `experiments` (constructed via `VALUES`)                         | 1         | Defines hypothetical experiments for simplified estimation                                |

# Full Estimation query (as of 26.11.2024)

You can find this if you go to a dataswarm od.

# CSPQRT Estimation Theory

The basic structure of the CSPQRT estimation theory is relatively simple. It involves several key steps to estimate and simulate the assignment of advertising units to experiments.

## Data Collection for Experiments

First, we **find and collect the data** required for the experiments. The relevant data includes:

- Basic information about the experiments
- Selection criteria (e.g., custom flags)
- Optimization goals
- Ad-binding types
- Priorities based on our priority system

Original query:
https://fburl.com/daiquery/1awzj3ax
```
WITH manual_selection AS (
    SELECT
        csbqrt_exp_id,
        ARRAY_AGG(entity_id) FILTER(
            WHERE
                entity_type = 0
        ) AS manual_pixel_ids,
        ARRAY_AGG(entity_id) FILTER(
            WHERE
                entity_type = 1
        ) AS manual_app_ids,
        ARRAY_AGG(entity_id) FILTER(
            WHERE
                entity_type = 2
        ) AS manual_account_ids
    FROM cdb.qrt_budget.csbqrt_entities
    WHERE
        csbqrt_exp_id != -1
    GROUP BY
        csbqrt_exp_id
)
-- ,,s
-- experiments AS (

    SELECT
        batch_fbid,
        experiment_id,
        first_batch_priority,
        batch_index,
        CAST(TRY(JSON_PARSE(buying_types)) AS ARRAY<INT>) buying_types,
        CAST(TRY(JSON_PARSE(optimization_goals)) AS ARRAY<INT>) optimization_goals,
        CAST(TRY(JSON_PARSE(conversion_types)) AS ARRAY<INT>) conversion_types,
        CAST(TRY(JSON_PARSE(custom_flags)) AS ARRAY<INT>) custom_flags,
        segments,
        manual_pixel_ids,
        manual_app_ids,
        manual_account_ids,
        experiments.is_allocated AS is_allocated,
        scheduler_request_id
    FROM (
        WITH request AS (
            SELECT
                request_id,
                batch_fbid,
                current_state,
                cycles_running,
                CAST(TRY(JSON_PARSE(priorities_to_include)) AS ARRAY(INTEGER)) priorities_to_include
            FROM cdb.qrt_budget.csbqrt_scheduler_estimation_requests
            WHERE
                request_id = (
                    SELECT
                        MAX(request_id)
                    FROM cdb.qrt_budget.csbqrt_scheduler_estimation_requests
                )
        ),

        allocated_experiments AS (
            WITH experiment_batch_index AS (
                SELECT
                    batch_fbid,
                    adv_exp_id,
                    ROW_NUMBER() OVER (
                        PARTITION BY
                            adv_exp_id
                        ORDER BY
                            start_index
                    ) AS batch_index

                FROM cdb.qrt_budget.bqrt_schedule_adv_exp_request request
                JOIN cdb.qrt_budget.bqrt_schedule_batch batch
                    ON request.batch_fbid = batch.fbid
            )
            SELECT
                requests.batch_fbid batch_fbid,
                experiment_id,
                first_batch_priority,
                batch_index - 1 AS batch_index,
                buying_types,
                optimization_goals,
                conversion_types,
                custom_flags,
                segments,
                scheduled_exp.priority priority,
                request.request_id AS scheduler_request_id
            FROM cdb.qrt_budget.bqrt_schedule_adv_exp_request requests
            JOIN cdb.qrt_budget.abqrt_experiments experiments
                ON requests.adv_exp_id = experiments.experiment_id
            JOIN experiment_batch_index indx
                ON requests.adv_exp_id = indx.adv_exp_id
                AND requests.batch_fbid = indx.batch_fbid
            JOIN request
                ON request.batch_fbid = requests.batch_fbid
            LEFT JOIN xdb.ads_ranking_experiment.qrt_scheduled_experiments scheduled_exp
                ON scheduled_exp.fbid = experiments.entqscheduled_id
            WHERE
                first_batch_priority IS NOT NULL
                AND (
                    batch_index - 1 > 0 --long continuing
                    OR CONTAINS(request.priorities_to_include, scheduled_exp.priority)
                )
        ),
        candidates AS (
            WITH priorities_start AS (
                SELECT
                    MAX(first_batch_priority) start
                FROM allocated_experiments
                WHERE
                    batch_index = 0 -- current batch
            )
            SELECT
                batch_fbid,
                experiment_id,
                COALESCE(priorities_start.start, 0) + candidate_priority first_batch_priority,
                0 batch_index, -- new requests start in the target batch
                buying_types,
                optimization_goals,
                conversion_types,
                custom_flags,
                segments,
                scheduled_exp.priority priority,
                request.request_id AS scheduler_request_id
            FROM request
            JOIN cdb.qrt_budget.csbqrt_scheduler_estimation_request_candidates candidates
                ON request.request_id = candidates.request_id
            JOIN cdb.qrt_budget.abqrt_experiments experiments
                ON candidates.csbqrt_experiment_id = experiments.experiment_id
            LEFT JOIN xdb.ads_ranking_experiment.qrt_scheduled_experiments scheduled_exp
                ON scheduled_exp.fbid = experiments.entqscheduled_id
            LEFT JOIN priorities_start
                ON 1 = 1
        )
        SELECT
            batch_fbid,
            experiment_id,
            first_batch_priority,
            batch_index,
            buying_types,
            optimization_goals,
            conversion_types,
            custom_flags,
            segments,
            priority,
            scheduler_request_id,
            TRUE AS is_allocated
        FROM allocated_experiments

        UNION ALL

        SELECT
            batch_fbid,
            experiment_id,
            first_batch_priority,
            batch_index,
            buying_types,
            optimization_goals,
            conversion_types,
            custom_flags,
            segments,
            priority,
            scheduler_request_id,
            FALSE AS is_allocated
        FROM candidates

    ) experiments
    LEFT JOIN manual_selection
        ON experiments.experiment_id = manual_selection.csbqrt_exp_id
    ORDER BY
        batch_index DESC,
        first_batch_priority ASC

```

WOW! that's a bunch!
the main complication here is the need to get experiments that are already allocated, as well as ones that are not

## Modification
to simplify and estimate only for couple of hypothetical experiments, we can simplify a lot. Here we create 3 example experiments:

```
    SELECT
        t.experiment_id,
        CAST(TRY(JSON_PARSE(t.buying_types)) AS ARRAY<INT>) AS buying_types,
        CAST(TRY(JSON_PARSE(t.optimization_goals)) AS ARRAY<INT>) AS optimization_goals,
        CAST(TRY(JSON_PARSE(t.conversion_types)) AS ARRAY<INT>) AS conversion_types,
        CAST(TRY(JSON_PARSE(t.custom_flags)) AS ARRAY<INT>) AS custom_flags,
        t.manual_pixel_ids,
        t.manual_app_ids,
        t.manual_account_ids,
        priority as first_batch_priority,
        t.segments
    FROM (
        VALUES
            -- Insert your experiments here with all relevant columns
            (
                1, -- experiment_id
                '[]', -- buying_types as JSON string
                '[]', -- optimization_goals as JSON string
                '[]', -- conversion_types as JSON string
                '[1084]', -- custom_flags as JSON string
                NULL, -- manual_pixel_ids as array
                NULL, -- manual_app_ids as array
                NULL, -- manual_account_ids as array
                1, -- creation_time
                40 -- segments
            ),
            (
                2, -- experiment_id
                '[]', -- buying_types as JSON string
                '[]', -- optimization_goals as JSON string
                '[]', -- conversion_types as JSON string
                '[1084]', -- custom_flags as JSON string
                NULL, -- manual_pixel_ids as array
                NULL, -- manual_app_ids as array
                NULL, -- manual_account_ids as array
                2, -- creation_time
                15 -- segments
            ),
            (
                3, -- experiment_id
                '[]', -- buying_types as JSON string
                '[]', -- optimization_goals as JSON string
                '[]', -- conversion_types as JSON string
                '[1084]', -- custom_flags as JSON string
                NULL, -- manual_pixel_ids as array
                NULL, -- manual_app_ids as array
                NULL, -- manual_account_ids as array
                2, -- creation_time
                30 -- segments
            )
    ) AS t (
        experiment_id,
        buying_types,
        optimization_goals,
        conversion_types,
        custom_flags,
        manual_pixel_ids,
        manual_app_ids,
        manual_account_ids,
        priority,
        segments
    )
```

# Adunits

Adunits are much more straightforward to get:

````

        SELECT
            ad_id,
            ad_buying_type,
            ad_optimization_goal,
            ad_conversion_type,
            custom_bqrt_flag_set,
            pixel_id,
            app_id,
            account_id,
            deterministic_experiment_to_segments
        FROM (
                (
                    SELECT
                        *
                    FROM bqrt_traffic_measurable_adunits_fast
                    WHERE
                        ds = '2024-11-26'
                        AND ts = '2024-11-26+08:00:99'
                        AND shard IN (
                            'shard000',
                            'shard001',
                            'shard002',
                            'shard003',
                            'shard004',
                            'shard005',
                            'shard006',
                            'shard007',
                            'shard008',
                            'shard009',
                            'shard010',
                            'shard011',
                            'shard012',
                            'shard013',
                            'shard014',
                            'shard015',
                            'shard016',
                            'shard017',
                            'shard018',
                            'shard019',
                            'shard020',
                            'shard021',
                            'shard022',
                            'shard023',
                            'shard024'
                        )
                )
            )
```

## Matching Rules

Then, we use **matching rules** (**_emphasis here_**) to align this data with advertising units. The data source for these ad units is our production assignment environment and the extractor.

Note: this ignores the subtielties of __active segments__, which are  a feature, introduced to adapt the estimator to the __sticky assignments__, designed to solve the jumping ads problem:


```
FROM units
JOIN experiments
    ON (
        -- matching rules
            CARDINALITY(experiments.custom_flags) = 0
            OR CARDINALITY(
                ARRAY_INTERSECT(experiments.custom_flags, units.custom_bqrt_flag_set)
            ) > 0
            ---... (repeat similarly for buying types, optimization goals, conversion types, etc.)
    )
```
That's all there is to matching! example self-contained query here:
https://fburl.com/daiquery/tnrvq3xh

## Simulating Assignment of Advertising Units

Using the matching rules and the priority system, we simulate the assignment of advertising units to experiments.

we can see several subqueries here
They a little lengthy, but the point is simple- simulate the 
50 segment/lottery ticket system and how it's interaction with the priority system.

```
  ad_units_with_eligible_experiments AS (
        SELECT
            ad_id,
            scheduler_request_id AS latest_scheduler_request_id,

            ARRAY_AGG(
                experiment_id
                ORDER BY
                    batch_index DESC,
                    first_batch_priority
            ) eligibles,
            ARRAY_AGG(
                segments
                ORDER BY
                    batch_index DESC,
                    first_batch_priority
            ) segments,
            ARRAY_AGG(
                active_segments
                ORDER BY
                    batch_index DESC,
                    first_batch_priority
            ) active_segments,
            ARRAY_AGG(
                is_allocated
                ORDER BY
                    batch_index DESC,
                    first_batch_priority

            ) are_experiments_allocated

        FROM ad_units_with_eligible_experiments_flat
        GROUP BY
            ad_id,
            scheduler_request_id

    )

    ,
    eligible_per_adunit AS (
        SELECT
            experiment_id,
            ARRAY_SUM(
                SLICE(active_segments, 1, ARRAY_POSITION(eligibles, experiment_id))
            ) AS cumsum_received,
            segments[ARRAY_POSITION(eligibles, experiment_id)] AS requested,
            active_segments[ARRAY_POSITION(eligibles, experiment_id)] AS active_segments
        FROM ad_units_with_eligible_experiments
        CROSS JOIN UNNEST(eligibles) AS t (experiment_id)
    ),
    eligible_stats AS (
        SELECT
            experiment_id,
            SUM(
                LEAST(
                    active_segments,
                    CASE
                        WHEN cumsum_received <= (50) THEN requested
                        ELSE GREATEST(requested - (cumsum_received - 50), 0)
                    END
                )
            ) / 50 AS fulfillable_count,
            SUM(requested) / 50 AS eligible_count,
            COUNT(*) AS unique_adunits_requested
        FROM eligible_per_adunit
        GROUP BY
            experiment_id
    ),
```


## Aggregation of Results

Finally, we aggregate the results, partially based on the priority system.

---

## Application Examples

Let's look at how to apply these concepts with different snippets based on what we want to achieve.

### Setting Up the Experiments and Data Sources

In the simple case where we just input some values for an experiment setup and get back some estimation results.

### Getting the Advertising Units

We retrieve the advertising units from our production assignment environment and the extractor.

### Matching Rules

We apply the **matching rules** to match experiments with advertising units.

### Additional Allocation Logic Based on the Priority System

We incorporate additional allocation logic based on our priority system to refine the assignment.

### Intermediate Table for Assigning Ad Units to Experiments (with Percentages)

An intermediate table is created for assigning ad units to experiments, including allocation percentages.

### Aggregations

Finally, we perform aggregations to summarize the results and evaluate performance.

---

By following these steps, we can effectively apply the CSPQRT estimation theory to our projects, ensuring accurate simulations and valuable insights.

# Overview