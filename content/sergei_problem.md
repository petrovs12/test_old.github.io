---
id: e3e53e25i50m5mpvrc0u0tm
title: Sergei_problem
desc: ""
updated: 2024-12-15T22:35
created: 1732207269520
---
```mermais
graph LR
    subgraph Team Structure
       subgraph pip
        A[Stefan]
        V["Vision Document"]
        end
        B[Sergei]
        subgraph ManagerBehavior
        C[Forrest]
        FL['Feedback Always Late, forgets nuanced discussion, creates many obstacles']
        Q[Hypocrisy About Metrics]
        WT["Wasting time"]
        end
        B -- "Is Team Lead of" --> A
        C -- "Is Manager of" --> B
    end
 C-- "Sides With" --> A
    subgraph SS["Scheduler System"]
        D[Scheduler]
        D -- "Controls" --> E[Traffic Distribution]
        E -- "Worth $20m/week" --> F[Company Revenue]
    end

    subgraph Clusters[" Sergei's Project"]
    %% B -- "Owns" --> G[Sergei's Project]
    Tra["Uses 80% of"]
    %% G -- "Underperforming" --> 
    H[Low adoption ]
    subgraph TrafficLatency
     L[Issue Destroying 20-30% Traffic]

    end
%%    A-->N[Attempt to Make Issue a Team Goal]
    %% N -- "Pushed Back by" --> B
    %% B -- "Said 'Let the Intern Finish It'" --> N
    O["Intern Project"] -- "Not Directly Tackling Issue/concluded without closure" --> L
    %% O -- "Concluded with Issue 0% Closed" --> L
    %% B -- "Pushed Back Hard When Suggested to Address Issue" --> P[Resistance]
    H["Low adoption"]



    end
    %% subgraph "Sergei Aspires"
    B -- "Pushing for" --> I[Promotion]
    %% B -- "Pushes back on" --> J[Proposals to Reduce Traffic]
    %% J -- "Examples" --> K[Scaled Lift & Large Scheduler Changes]
    L -- "Related to" --> Clusters
    L -- "Known by" --> B
    L -- "Known by" --> M[Users]
 
%%    end
    B -- "Previously Doubted Utility of" --> SS
    SS-->Clusters

   

    %% Q -- "Boxes In" --> R[Stefan's Proposals]
    %% Q -- "Not Publicizing" --> S[Significant Metric Movements]

    %% T[Discussion with Forrest]
    %% T -- "Forrest Alleged" --> U["'It sounds like you're upset about your documents needing higher quality than an intern's'"]

     B -- Critical --> V[Vision Document]
     C-- Critical --> V
     V-->SS

    %% V -- "Alleging Lack of Metrics" --> R

    %% W[Nuanced Discussions]
    %% W -- "Forgotten in" --> X[Feedback]

    
    %% B -- "Ignoring Feedback of Team Members" --> Y[In Favor of Own Agenda]

    Z[Team Members]
    Z -- "after his promotion and will trample over anyone" --> B
    A-->TrafficLatency
    classDef critical fill:#f9d5e5, stroke:#e64980, stroke-width:2px
    classDef issue fill:#ffe5d9, stroke:#e85d04, stroke-width:2px
    class B,C critical
    class L,O,AA issue
```