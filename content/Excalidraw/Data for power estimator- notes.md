---
excalidraw-plugin: parsed
tags:
  - excalidraw
---
Needed data to add:
conversion events, exposed users, days, t_evolve, segments, days
from https://fburl.com/code/qn9we3rt

### get number of exposed users (?)[]

we can use 
```
 AS (
        SELECT
            *
        FROM <INPUT:training_data_bipartite>
        INNER JOIN (
            SELECT
                unit_id campaign_group_id,
                cluster_id
            FROM <INPUT:clustering_result_table>
        )
            USING (campaign_group_id)
    ),
```

to get number of exposed users.

### Get number of conversions, impressons (?)

we can see all (impressions, conversions, clicks, non-billable) from 
https://fburl.com/code/b8tq7xml
but again need to join by the campaign group id...



==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data
## Text Elements
Data sources for 
users, impressions, conversions

 ^e7cink4x

most exist in the clustering tables
 ^87id8eAE

%%
## Drawing
```compressed-json
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

2zeOEUZsUQCxSAA=
```
%%