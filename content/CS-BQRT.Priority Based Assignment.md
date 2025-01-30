---
id: ikw9umy1xepz86y5zhrvi4z
title: Priority Based Assignment
desc: ''
updated: '2024-10-06T17:03'
created: '2024-10-06T17:02'
tags:
  - excalidraw
excalidraw-plugin: parsed
---
```mermaid
flowchart TD
    Start([Start])
    Start --> IterateAdUnits[Iterate over each Ad Unit]

    subgraph Ad_Unit_Assignment
        IterateAdUnits --> DetermineCBO["Determine CBO Status (L2/L3)"]
        DetermineCBO --> FindEligible["Find Eligible Experiments"]
        FindEligible --> OrderByPriority["Order Experiments by Priority"]
        OrderByPriority --> AssignSegments["Assign Segments"]
        
        subgraph Segment_Assignment_Process
            AssignSegments --> InitSegments[Initialize Available Segments = 50]
            InitSegments --> IterateExperiments[Iterate over Ordered Experiments]
            IterateExperiments --> CalculateAssignment["Calculate min(requested, max(50 - cumulative_before))"]
            CalculateAssignment --> UpdateSegments[Update Available Segments]
            UpdateSegments --> IsMoreExp[More Experiments?]
            IsMoreExp -- Yes --> IterateExperiments
            IsMoreExp -- No --> EndAssignment[End Segment Assignment]
        end
    end

    Handle_Long_Running -- (loop over previous batches)--> IterateExperiments
    EndAssignment-- forget expired --> Handle_Long_Running
```


### Detailed View 



```mermaid
flowchart TD
    Start([Start]);
    Start --> IterateAdUnits[Iterate over each Ad  Unit];

    subgraph Ad_Unit_Assignment
        IterateAdUnits --> DetermineLevel["Determine Level (L2 or L3)"];
        DetermineLevel --> IsCBO[Is CBO?]
        IsCBO -- Yes --> Assign_L3[L3: CBO Units]
        IsCBO -- No --> Assign_L2[L2: Non-CBO Units]
        Assign_L3 --> FindEligible["Find Eligible Experiments"]
        Assign_L2 --> FindEligible
        FindEligible --> OrderByPriority[Order Experiments by Priority]
        OrderByPriority --> AssignSegments[Assign Segments]
        subgraph Segment_Assignment_Process
            AssignSegments --> InitSegments[Initialize Available Segments = 50]
            InitSegments --> IterateExperiments[Iterate over Ordered Experiments]
            IterateExperiments --> CalculateAssignment["Calculate min(requested, max(50 - cumulative_before))"]
            CalculateAssignment --> UpdateSegments[Update Available Segments]
            UpdateSegments --> IsMoreExp[More Experiments?]
            IsMoreExp -- Yes --> IterateExperiments
            IsMoreExp -- No --> EndAssignment[End Segment Assignment]
        end
    end

    Ad_Unit_Assignment --> Handle_Long_Running[Handle Long-Running Experiments]

    subgraph Long_Running_Experiments
        Handle_Long_Running --> LookBackConfigs[Look Back at Previous Experiment Configs]
        LookBackConfigs --> FakeAllocation[Fake Allocation Based on Previous Batches]
        FakeAllocation --> IsBatchFinished[Is Past Batch Finished?]
        IsBatchFinished -- Yes --> ReleaseSegments[Release Segments from Invalid Experiments]
        IsBatchFinished -- No --> ContinueAllocation[Continue Allocation]
        ReleaseSegments --> ContinueAllocation
        ContinueAllocation --> AllocationComplete[Allocation Complete]
    end
```


==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


## Drawing
```compressed-json
N4IgLgngDgpiBcIYA8DGBDANgSwCYCd0B3EAGhADcZ8BnbAewDsEAmcm+gV31TkQAswYKDXgB6MQHNsYfpwBGAOlT0AtmIBeNCtlQbs6RmPry6uA4wC0KDDgLFLUTJ2lH8MTDHQ0YNMWHRJMRZFAFZFAEYyJE9VGEYwGgQAbQBdcnQoKABlALA+UEl8PGzsDT5GTkxMch0YIgAhdFQAayKuRlwAYXpMenwEEABiADMx8ZAAX0mgA
```
%%
