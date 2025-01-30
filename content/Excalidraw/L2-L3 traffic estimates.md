---
excalidraw-plugin: parsed
tags:
  - excalidraw
created: 2024-09-04T11:06
updated: 2024-10-06T17:01
---
l2/l3 based traffic estimates
[D55243761](https://www.internalfb.com/diff/D55243761)
# L2-L3 traffic estimates
see start here.
mprevious 

https://docs.google.com/document/d/1jJ7H6BRyhIV0Zm5H8-Ff9uuBlJTlO4BexYAVT5I51Dc/edit

plan:


https://docs.google.com/document/d/1jJ7H6BRyhIV0Zm5H8-Ff9uuBlJTlO4BexYAVT5I51Dc/edit

**

1. Implemengt AdUnits Grouping by L2/L3
    

- We can use hourly pipeline [bqrt_traffic_adunit_subset_fast table]
    
- Need to produce 2 tables one for L2s and 1 for L3s
    
- Because experimentToSegmentCount is only logged for new assignments, we will need to carry it over in the pipelines (join with previous logs if not logged)
    
- Aggregate properties across L2/L3
    

  
2. Join with logged (in step 1) experiment to segment map 
    

- Table : csbqrt_experiment_id_assignment
    
- Column: experiment_to_segment_count 
    

  

3. Implement estimations
    

- We can change estimations for standalone estimators as the use-case used by scheduler is confusing for users
    

- It is worth doing only if we decide that we are not rolling out scheduler further
    



**

==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


## Drawing
```compressed-json
N4IgLgngDgpiBcIYA8DGBDANgSwCYCd0B3EAGhADcZ8BnbAewDsEAmcm+gV31TkQAswYKDXgB6MQHNsYfpwBGAOlT0AtmIBeNCtlQbs6RmPry6uA4wC0KDDgLFLUTJ2lH8MTDHQ0YNMWHRJMRZFAFZFAEYyJE9VGEYwGgQAbQBdcnQoKABlALA+UEl8PGzsDT5GTkxMch0YIgAhdFQAayKuRlwAYXpMenwEEABiADMx8ZAAX0mgA
```
%%
