---
id: 31b2p3bmd9u33dij8thg9if
title: Model Migration Timelines
desc: ""
updated: 2024-12-15T22:35
created: 2024-10-17T00:00
---
## Benefits and Impact

- **Increased Throughput**:  
  Our preliminary guestimates indicate that the QRT scheduler can boost overall throughput by approximately 15%. Given the complexity of ad space management, we anticipate even greater improvements as the system continues to mature and optimize.
- **Improved Developer Velocity by System Simplification**:  
  We describe all requirements in a single place as succinct linear program, instead of in 10s of docs. This allows us to:
  1.   Express business and system requirements succinctly and easily see and quantify conflicting business objectives. This way we can ensure that our technical implementations are closely aligned with our strategic goals. Examples issues this will alleviate are recent deadlocks on increasing small experiment limits, better support for scaled lift, and how exactly to aleviate L4 alignment.
  2. Dimensionality Reduction allows us to supports quick in-memory implementations of calculations that are otherwise 2 week or month-long projects (examples- any packing algorithm or any tool that relies on traffic calculations, like 'traffic overlaps', 'how many segments', various 'what if' scenarios tools).
- **Flexibility, Scalability and Future-Proofing**:  
  The system is parametrisable to support business objective adjustments.
  For example , we can adapt to evolving definitions of a "good experiment" by simply adjusting constraints, without requiring significant changes to the system design.
  Similarly, we can flexibly change limits of CSBQRT experiment subtypes, better supporting scaled lift, small experiments.
  Same for the objective function, which can be aligned tightly to whatever topline metric we decide is most important. The constsaint-based abstraction is also easily extensible to onboard Full BQRT slots if desired as well (backend needs to be designed, though). 
  
  - **Dimensionality Reduction synergy with Clustering-related topics**:  
   Dimensionality reduction and clustering are closely related. Clustering is a **compressed description** of an adunits in terms of their co-presence in auctions, and dimensionality reduction - in terms of co-presence in experiment traffic requests. 
   It's likely the latter can enhance a regression model to faster predict assignment latency, an issue that plagues us, reducing useable traffic by 18-30%. 
   It can also help find isolated markets around around custom flags, exploratory clusters, etc.


---

*Note: The outlined benefits are based on our current assumptions and preliminary estimates. Actual impacts may vary based on implementation success and evolving project dynamics.*
**Project Milestones and Estimated Timelines**
*Note: The estimated times are rough approximations intended for high-level planning purposes and may need adjustment based on resource availability and project scope refinements.

| Step | Description                                                                                                                                                                                                                              | Estimated Time (in work days)                             |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| 1    | **Initial Dimensionality Reduction Implementation and Algorithm Impact Study**: <br>Data collection, prototypes of dim reduction and algorithm part ,  validation of dimensionality reduction for the eligibility matrix.                | 15                                                        |
| 1    | **Secondary  Feasibility Study** : Ironing out details, such as handling very small adsets, etc                                                                                                                                          | 6                                                         |
| 2    | **Assignment Backend Modifications**: Redesign and modify the assignment backend to work with dimensionally reduced data, including testing and validation.                                                                              | 15                                                        |
| 3    | **Scheduler Model Implementation**: Extend and robusify the mathematical scheduling model, including handling urgent experiments, deadlines, priority swap, experiment overlap analysis, traffic estimates, and suggested modifications. | 15                                                        |
| 4    | **Interactive Scheduling System Development**: Migration of redesigned scheduler to new algorithm and computational tooling                                                                                                              | 13                                                        |
| 5    | **Scheduling Flow and User Communications Implementation**: Implement the overall scheduling flow, including user communications, escalations, and integration.                                                                          | ~~15~~(handled as part of 'scheduler redesign' projects?) |
| 6    | **Testing, Validation, and Deployment**: Perform system-wide testing, address bugs, refine features, and deploy the new scheduling system.                                                                                               | 10                                                        |

**Total Estimated Time**: **74 work days**

---

**Major Risks**

1. **Dimensionality Reduction Feasibility**: The dimensionality reduction may not preserve essential properties of the data, leading to inadequate model performance. This would necessitate dropping the approach.
   **Mitigation** : Proposed initial 13 work day 'impact' feasibility study. If that goes okay, additional 6 days to iron out out some details, like what to do with very small adsets, etc.

3. **Integration Complexity**: Modifying the assignment backend and integrating with existing systems might be more complex than anticipated, potentially leading to increased development time. 
   **Mitigation** : If initial study goes as expected, develop hand in hand with the 'scheduler redesign' project to plan well.

4. **Stakeholder Alignment on Priority Changes**: Removing or altering the priority system may face resistance from stakeholders.
   **Mitigation**: Provide a lot of consultative features [[CSBQRT.Scheduler.Model#Model -> Interactive Scheduling System]] Discuss with team. 

5. **Testing and Validation Issues**: System-wide testing might reveal critical issues or bugs that require significant time to fix, potentially delaying deployment.
   **Mitigation**: Plan for additional time for testing and validation.

6. **Unresolved Questions about Current System**: For example, what is the accuracy of the current estimator? Is it's fundamental 'adset equilibrium' assumption reasonable? Does the inaccuracy?
   **Mitigation**: Unclear, as it's hard to plan time for such 'understand work' currently as well. For example, a 'custom flag changed' detector was proposed and not prioritised.


---

