---
id: qnv1u6ogwr157nsw36il5lv
title: Edge view
desc: ""
updated: 2024-12-15T22:35
created: 2024-10-27T15:36
---
| Name                                               | Storage |
| -------------------------------------------------- | ------- |
| EntQRTBudgetUniverseExperimentSchema               | Schema  |
| EntQRTSignalLossEncodingPeriodSchema               | Schema  |
| EntBQRTSchedulingRequestPattern                    | Pattern |
| EntFullBQRTUserRequestSchema                       | Schema  |
| EntCSBQRTAdSelectionEntitySchema                   | Schema  |
| EntBQRTAdvancedExperimentRequestSchema             | Schema  |
| EntBQRTBatchSchema                                 | Schema  |
| EntBQRTVersionRequestSchema                        | Schema  |
| EntBQRTAdvancedExperimentSchema                    | Schema  |
| EntAsCsBqrtScheduledNotificationSentRecordSchema   | Schema  |
| EntAdMetricsBqrtMdeSchema                          | Schema  |
| EntBQRTResourceCostSchema                          | Schema  |
| EntCSBQRTTrafficEstimatorBatchSnashotSchema        | Schema  |
| EntCSBQRTTrafficEstimatorCalculationResultSchema   | Schema  |
| EntCSBQRTSchedulingBatchStatusSchema               | Schema  |
| EntInternalLiftConversionStudyDhidMappingSchema    | Schema  |
| EntCSBQRTSchedulerEstimationRequestCandidateSchema | Schema  |
| EntCSBQRTSchedulerEstimationRequestSchema          | Schema  |
| fb_asbqrt_experiment_id_assignment_2               | Schema  |
| fb_cs_bqrt_clusters                                | Schema  |
| fb_cs_qrt_clusters                                 | Schema  |
| fb_csbqrt_assignment_ad_selection_entity_laser     | Schema  |
| fb_csbqrt_experiment_id_assignment                 | Schema  |
| EntQAdsClusterLaserSchema                          | Schema  |
| EntBQRTScheduleExperimentSnapshotSchema            | Schema  |
| EntBQRTScheduleBatchSnapshotSchema                 | Schema  |
| EntBQRTScheduleSchema                              | Schema  |
| EntBQRTScheduleChangeSchema                        | Schema  |
| EntQRTScheduledExperimentSchema                    | Schema  |

<div class="mermaid">
  classDiagram
    class EntQRTBudgetUniverseExperimentSchema{
        + properties of the whole experiment
        + batch id, time, etc
        + conects to the rest via the batch;
        + edge to the adv experiments via an edge trough the bqrt_abqrt_experiment_map
    }
    EntBQRTBudetUniverseExperimentSchema --&gt; EntBQRTBatchSchema

    class EntBQRTSchedulingRequestPattern
    class EntFullBQRTUserRequestSchema
    class EntCSBQRTAdSelectionEntitySchema
    class EntBQRTAdvancedExperimentRequestSchema
    class EntBQRTBatchSchema{
        + properties about the batch- is terminal, index, actual start time, planned time's, etc...
        + shallow batch!!!
    }
    class EntBQRTVersionRequestSchema
    class EntBQRTAdvancedExperimentSchema{
        + properties of the experiment, set at creation time
        + link to 0or1 to entqscheduledexperimentid
    }
    class EntAsCsBqrtScheduledNotificationSentRecordSchema
    class EntAdMetricsBqrtMdeSchema
    class EntBQRTResourceCostSchema
    class EntCSBQRTTrafficEstimatorBatchSnapshotSchema
    class EntCSBQRTTrafficEstimatorCalculationResultSchema
    class EntCSBQRTSchedulingBatchStatusSchema
    class EntInternalLiftConversionStudyDhidMappingSchema
    class EntCSBQRTSchedulerEstimationRequestCandidateSchema
    class EntCSBQRTSchedulerEstimationRequestSchema
    class fb_asbqrt_experiment_id_assignment_2
    class fb_cs_bqrt_clusters
    class fb_cs_qrt_clusters
    class fb_csbqrt_assignment_ad_selection_entity_laser
    class fb_csbqrt_experiment_id_assignment
    class EntQAdsClusterLaserSchema
    class EntBQRTScheduleExperimentSnapshotSchema
    class EntBQRTScheduleBatchSnapshotSchema
    class EntBQRTScheduleSchema
    class EntBQRTScheduleChangeSchema
    EntQRTBudgetUniverseExperimentSchema--&gt;EntQRTSignalLossEncodingPeriodSchema
</div>

