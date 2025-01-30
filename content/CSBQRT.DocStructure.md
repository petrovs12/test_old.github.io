---
id: 7ht4xxyokd79colj3n4lwyf
title: DocStructure
desc: ""
updated: 2024-12-15T22:35
created: 2024-10-17T11:22
---
```mermaid
graph TB
    VisionDoc[Vision Document]
    VisionDoc --> OverallVision[Overall Vision]
    VisionDoc --> Roadmap[High-Level Roadmap]
    VisionDoc --> ConcreteProjects["Concrete Projects (Low quality)"]

    ConcreteProjects --> FeasibilityStudy[Feasibility Study]
    ConcreteProjects --> SystemMigrationTimeline[System Migration Timeline]

    SystemMigrationTimeline -->|Depends on| FeasibilityStudy

    SystemMigrationTimeline --> ProjectDoc1[Concrete Project 1]
    SystemMigrationTimeline --> ProjectDoc2[Concrete Project 2]
    SystemMigrationTimeline --> ProjectDoc3[Concrete Project 3]
```

