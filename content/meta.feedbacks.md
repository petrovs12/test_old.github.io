---
id: 3jvbyxudsuwaepcqdo0nvd4
title: Feedbacks
desc: ''
updated: 1733210083279
created: 1733208878978
---
riccardo vitale nov 13 2024$

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan helped me to resolve some key points around the L4 assignment project design, especially about the implication that this work would have on estimator and potential pitfalls of the current setup. Stefan was very good at spotting issues and took the time to discuss them with me, explaining what could go wrong and what possible workaround options we may have. 
Stefan helped me then to identify the steps to do in order to adapt estimator to the new feature, which I appreciated as it helped me to be quicker at consolidating my design doc to get approval from the rest of the team.
Last but not least, he provided references, queries and notebooks to support his claims, which were very useful for me to know more about how it all works and attach to the doc as references.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Perhaps only advice I can share with him (as well as with the rest of the team) is that sometimes it is assumed that I already have context which I don't have in reality. However, this comes from the habit of interacting with people that have worked in the team for quite some time and, as said, I noticed this pattern with everyone else in the team, too.
Apart from that, I think that Stefan provided what I needed from him and there is nothing to change about how we interacted. 

# paul 22-11-2024
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Improving Systems, Job-Specific Skills
i) Write code that is well-organized --- diffs need to be focused, small and doing one thing (unless it's implementing a 0->1 feature when the diff can be bigger to lay-down the foundations)
ii) Demonstrate strong software engineering skills --- for example, [D62444559](https://www.internalfb.com/intern/diff/D62444559/) (a simple change), had issues raised every 3 lines by different engineers --- 13 revisions submitted for diff-review needed to get the diff to an acceptable quality
iii) Seek out ways to improve the components or systems you work on to facilitate easier development of new features:
a. Clustering automation is a buggy, flaky, mess --- but there's no trickle of improvement BE diffs
b. Scheduler is flaky and frequently needs over-riding or needs baby-sitting e.g. no Shop Ads experiments scheduled in one batch and frequent escalations --- there's no trickle of improvement BE diffs which continuously improve it
iv) Don't just cut-and-paste code with string constants changed, instead try to make code re-useable --- the SLOC metric is not a metric to drive:  [D65023184](https://www.internalfb.com/diff/D65023184)
v) For roadmapping future projects, need to focus more on quantifying where we are, e.g. how good is the existing traffic estimator and scheduler (and aligned with the value provided to our customers), before planning on making changes to the algorithm or major re-writes.  Then the team can fully appreciate the problems at hand, the need and room for improvement, the urgency of the change, and the expected impact (what additional value will be provided to our customers).  Focus on our users_identify_the_different_classes_of_users_identify_what_they_need_to_achieve_workout_what_the_measurements_of_value_are_then_identify_where_we_are_and_then_and_only_then_plan_to_move_forward.


# Viktor 22-11-2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Embracing Ambiguity, Prioritizing
In the last 3 months I collaborated with Stefan on 2 scheduler-related projects. One of them was for onboarding regular and clustered CS experiments to scheduler. Some of the highlights I'd like to point out:
- Deep understanding on the underlying data tables for estimator results,how they are computed and how they can be changed without affecting correctness
    - Stefan is likely the only person in the team who has the historical context of the decisions made and can also apply it in the current world. He has provided on multiple occasions feedback and perspectives which have changed the direction of the discussion in a positive way and has led to better solutions.
- Critical thinking and identifying different solutions based on feedback
    - Together we identified 2 feasible solutions and we had a very healthy discussion on the trade-offs and together we managed to reach a middle group which would work best given our current state.I really enjoyed this and I'm very happy as that's a very positive shift from earlier in the year when deep discussions were a bit more difficult and finding middle ground took more time.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively
Stefan has really good perspectives but I feel sometimes he fails to get traction on his ideas.I've spent a lot of time in technical discussions with him and in multiple occasions he has managed to show me that he has a better approach/solution for a topic. 
My impression is that his communication style - one that requires more time to cover everything -doesn't_work_very_well_in_our_environment,where_the_focus_is_on_short,well_structured_presentations.

I_can_recommend_to_Stefan_to_focus_on_improving_the_his_presentation/communication_skills_which_would_help_him_express_his_ideas_with_more_cohesion_which_would_in_turn_lead_to_getting_more_traction_from_the_others


# ivan shaverin
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Embracing Ambiguity, Improving Systems
Stefan reached out to me for a high-priority BE task from the backlog and I suggested deprecation of raw SQL in our codebase, which was one of the contributing factors to [S439033](https://www.internalfb.com/sevmanager/view/439033) and many other issues related to Budget ABTest data availability in Deltoid. Additionally, inefficient design of this part of the system caused significant Ops Cost for bqrt oncall during 2024.

**Scoping** - done in [light-weight format](https://docs.google.com/document/d/1bUfD37bxWOWx7te35q58Gc4E6NbCngl_-otfYYKIezo/edit?usp=sharing) which is sufficient for the project of this size. It touched all critical call-sights and provided enough details to collaborate with POC for the related areas. Good work on finding the root-cause of the problem and outscoping shadow experiments part due to it's potential future re-implementation.

**Communication** - from what I can tell, Stefan pro-actively communicated the work and involved all needed POCs into discussion: 
- Ivan Shaverin - on end goal, scoping and execution plan
- Pierre Di Lauro - on changes in our scrape tables
- Toan Mai - on raw SQL for shadow CS Budget experiments

**Execution** - good quality of the diffs, all required POC were pulled into review. Even though this project officially was not a part of a roadmap and didn't have a strict deadline, Stefan provided expectation on the execution timeline and delivered the work in reasonable time. Test plan was sufficient.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
It would be even easier for me to track the progress if tasks state in GSD was aligned with real progress on the project.

# shivesh ranjan 28.06.2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan is a brilliant individual with some very smart ideas. Last half we discussed a problem statement around including serving memory into qrt scheduling. Stefan shared some good ideas then but we could not prioritize this work. This half stefan picked up this work stream as a stretch goal and continued pursuing the idea and developing it further. 
He proactively engaged with our partners in Ads RM to scope the problem, understand and capture its impact and then modelled the problem and shared the design and model with respective stakeholders, including myself. He shared the idea and explained the design and shared an implementation of the model in a notebook. The stroke of brilliance in that modelling was to do pair wise comparison and set up constraints on each pair of experiment that used the same model. This has potential to massively simplify the modelling of constraints that otherwise require capturing a complex many to many relationship between experiments and models. 
As next step, Stefan is presently trying to take his proposal and apply it to the abstractions we have created in qrt scheduler. this is not an obvious translation given the abstractions and the way existing constraints and variables are constructed in the scheduler. 
Stefan regularly checks in on his progress, asks relevant questions and sharing his progress. I am keenly looking forward to see his ideas get materialized into a solution that addresses a big gap in our current solution. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]

# Sergei Leonenkov 
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
**Disclaimer:** Please, refer to my feedback during PIP (~1 month old). Additional items since then can be found below. 

**Direction / Roadmapping**
I observed nice involvement from Stefan during BQRT road-mapping in May/June: Stefan was active on Supply topics discussions/brainstorms and contributed heavily to Supply metrics workstream. For example, Stefan worked on metrics calculations for scheduling latency, which helped me to present our work better during CAG <> ABTest roadmapping exercise. 

**Helpful to oncall / teammates**
Stefan was extremely helpful during my oncall, when he helped me to unblock with uncommon user requests:
- force admitting experiments;
- checking estimations quality;
-  etc;
We don't have automation for these requests yet. Stefan unblocked me and improved my oncall's WLB, thank you! 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Overall, I suggest trying to stick to trajectory shown during PIP, it is important to continue improving things towards the same direction even after PIP. 

**Deadlines management:**
As a growth opportunity, I suggest concentrating on a more efficient management of deadline: 
- be clear on deadlines with your colleagues (set them in design documents / corresponding tasks); 
- communicate blockers to XFN/colleagues (if you must change deadlines due to unexpected blocker);
- it is OK to add some extra time buffer to execution plan to account for unknown;
- work with Forrest / myself if you have too much on your plate.
**It will help to:**
- always deliver with accordance with expectations (use cases like, for example, [T188998241](https://www.internalfb.com/intern/tasks/?t=188998241) could be avoided),
- make your colleagues to rely on you more efficiently;


# Paul Ryland 29.06.2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan has improved greatly since last year with consistent growth on a month-by-month basis:
- I really appreciate seeing and reviewing the detailed design docs which Stefan is now producing on a regular basis, for example: https://docs.google.com/document/d/1zRoaRoAzuGjxGDL3YELs0691Az4ItUfVRuRsXPoT7xU/edit#heading=h.bl1nbnrczdar
- Great progress with getting the small cs-bqrt scheduler is finally doing something both sensible and useful!
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan could do much better by:
- always use a template document for technical designs --- the team has a really good one (ask in team chat).  This one doesn't even have a title (and and there's no section for reviewer comments):  https://docs.google.com/document/d/1zRoaRoAzuGjxGDL3YELs0691Az4ItUfVRuRsXPoT7xU/edit#heading=h.bl1nbnrczdar
- try starting designs (particular when the service is going to be used by end users) by identifying the classes of users, identify what they need to do, and then work through what the user journey of those users will be --- this will ensure that what you create is actually a useable and useful service.  The initial designs for the scheduler (and debugger) were not user-centric and it probably caused more harm to users than good --- it was just self-standing isolated technology and not part of a workable user experience/journey.
- diff quality has improved substantially during 2024H1 for example [D58866992](https://www.internalfb.com/diff/D58866992) ended-up really good quality even through a lot of the team had to help you get there with 42 comments, similar stories for [D59031994](https://www.internalfb.com/diff/D59031994) (45 comments), [D54345238](https://www.internalfb.com/diff/D54345238) (21 comments), [D56211293](https://www.internalfb.com/diff/D56211293) (17 comments) --- similar quality issues get repeated


# Shivesh Ranjan

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan is a brilliant individual with some very smart ideas. Last half we discussed a problem statement around including serving memory into qrt scheduling. Stefan shared some good ideas then but we could not prioritize this work. This half stefan picked up this work stream as a stretch goal and continued pursuing the idea and developing it further. 
He proactively engaged with our partners in Ads RM to scope the problem, understand and capture its impact and then modelled the problem and shared the design and model with respective stakeholders, including myself. He shared the idea and explained the design and shared an implementation of the model in a notebook. The stroke of brilliance in that modelling was to do pair wise comparison and set up constraints on each pair of experiment that used the same model. This has potential to massively simplify the modelling of constraints that otherwise require capturing a complex many to many relationship between experiments and models. 
As next step, Stefan is presently trying to take his proposal and apply it to the abstractions we have created in qrt scheduler. this is not an obvious translation given the abstractions and the way existing constraints and variables are constructed in the scheduler. 
Stefan regularly checks in on his progress, asks relevant questions and sharing his progress. I am keenly looking forward to see his ideas get materialized into a solution that addresses a big gap in our current solution. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]

# Sergei Krauze 
28.06.2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively, Prioritizing
- Proactive approach to self-improvement and driving value for the company: Stefan has demonstrated a strong commitment to improving himself and delivering value to the company and others. Despite facing personal challenges, he has shown resilience and determination in addressing areas for improvement highlighted in feedback and pushing on delivering required features.
- Supportive attitude towards users: Stefan is proactive in understanding user needs and ensuring their satisfaction. He prioritizes understanding gaps in features he launches and actively seeks feedback to improve his work, even when it comes on the top of previous commitments.
- Improved quality of design docs: Stefan was proactively working on improving this part, and, i believe, has made a significant improvements in the quality of his technical writing, after a few iterations and being given some good examples.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Prioritizing, Communicating Effectively
- ROI prioritization and focus: Stefan's willingness to support others can lead to overcommitting and difficulty in meeting milestones. He could maintain a focused backlog, avoid taking on additional commitments beyond what has been agreed upon.
- Communication: Due to the remote setup, communication with partners can be challenging for Stefan. To improve this, he could establish regular meetings early on, always proactively communicate and travel on-site when key alignments need to be made, and put more structure in place through written communication such as meeting notes and project documents, to cover for the remote setup. Stefan could benefit from utilizing structured meetings more frequently. By sharing a timeboxed agenda in advance, he can ensure that meetings are more productive and efficient.

# Sergei Leonenkov 
04.06.2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Hi Stefan, Thanks for asking for feedback. As per your request, here are some clarifications: while my feedback, which I left for your PIP, is still relevant, I want to state again that I can see positive trajectory in your behaviours since the beginning of the performance improvement plan, -- just keep improving your communication and impact delivery areas! Good sign is that you have concrete examples, which you can follow to progress, as well as the scope you are participating in is high-impactful, if approached correctly. 

Another additional thing, which wasn't mentioned in the PIP feedback, is similar to my last PSC feedback -- you showed strong commitment to supporting colleagues and helped others to deal with ongoing tasks around clustering pipelines, when they are blocked / failing. This is very appreciated by the team and me personally.

# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]

# Viktor Barzin
03.06.2024

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
I collaborated with Stefan on scheduler-related projects.Stefan has shown great in depth knowledge and understanding regarding the traffic allocation and algorithmic side of the scheduler.He used this knowledge to identify and scope out multiple areas of improvement. He [implemented](https://fb.workplace.com/groups/budgetabtestfyi/permalink/2095344670835374/) some user-facing observability features that improved user experience of scheduling experiments.

Stefan has shown he is receptive to feedback:
- He started taking more ownership of algorithmic side of scheduler and started identifying potential areas for improvement and proactively scoped out a few new projects.
- After receiving feedback and some coaching on design document content structure and readability,Stefan has started putting in more attention to details and making sure his design documents are more easily digestible. He has retrospectively written some design documents to practice and improve in this area.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan has shown good progress recently on previous feedback and going forward here are my recommended areas for improvement and growing further:

- **Minimize short-term hacks/hotfixes and focus on long term impact**-Due to low developer productivity in our system, "proper" solutions take longer to design and implement.I would recommend Stefan focuses more on the long term aspects of his artifacts - focus on how would his projects will be maintained and operated over the long term.I believe we should adhere to the highest engineering standards and pushback on deadlines where possible rather than focus on landing unmaintainable solutions.
- **Think about the reader**-when writing design documents,I would recommend to explicitly define who is the target audience, any prerequisite context.Existing templates are a great start_towards_more_easily_digestible_design_documents.

# Ivan Shaverin 2024-06-02

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Partnering, Building Inclusion
This half Stefan was helping me with traffic allocation improvements for scaled lift: 
- In a series of 1-1 meetings he shared knowledge about Clustered CS infra (based on past experience working on Clustered CS) and it's limitations, which helped to proactively identify a dependency between Clustered CS and Scaled Lift Traffic Allocation and start discussing the solution before the problem become visible to users. 
- Helped reviewing the design doc and gave a valuable feedback for scaled lift traffic allocation improvements: https://fb.workplace.com/groups/743450197092653/permalink/936292157808455/
- Designed a plan for revisiting Small CS experiment limitations (one of options for improving traffic allocation for CS experiments)
    - Created a doc and communicated different options with tradeoffs to estimate impact of increasing Small CS traffic limitations on Clustered CS quality: https://docs.google.com/document/d/1Iu8y-YTUm-kx7YpvU53o4jWKuvwZZWFzcngem3NIlQ8/edit?usp=sharing
    - Acted as a POC for Clustered CS combining technical and statistical knowledge.
    - Set up proper expectations on effort and possible ETA for each of the options.

Additionally I would like to highlight following behaviours:
- Stefan is very easy to collaborate with:
    - He is responsive and available to help even for questions not directly related to his projects.
    - Respectful and cares about others
- Great work on scoping Estimator and Scheduler improvements: https://docs.google.com/document/d/1YZiT-fBX3heoFVOEryYEeMoQXWxqVKQMjXVVVVmtn7A/edit?usp=sharing 
    - Good direction for a large scope (> 2 HC)
    - Proactively was seeking for the feedback
- Good work during oncall:
    - Independent
    - Good communication of issues
    - Proactively seeking for help and shares status

# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Moving forward with traffic estimation improvements, I would encourage Stefan to have a strong ownership of the area and actively participate in the roadmapping/prioritisation.

# 2024 mid year self review
**What impact have you achieved so far?** Include impact achieved, progress against business goals, contributions to efficiency initiatives, and [building internal community](https://docs.google.com/presentation/d/1y-Xvmo75X9v7A0KvFMz6K3Exues5jQJI/preview?slide=id.g1ec6f199c9e_0_0). ------------------------------------------------------------------------------

Special circumstances: Took 2 weeks of bereavement leave due to death of mother in law and before that had to extensively support family in last months of illness, leading to very complex home situation, for months. Did not take advantage of leave options then, should have. Total bereavement+sick leave for the year 15 days.

I was working mainly on projects in the csbqrt scheduler problem space.



Project Impact
1.7 (likely >2, vs partial estimate of 0.5- not for all mini-projects) eys delivered via improving ability of small experiment owners to identify conflicting experiments, view traffic estimates quickly, and get recommendations how to change setup in order to get scheduled. increasing small experiment throughput by 140% Q4_2023-13.15/batch, Q12024-13.2 Q2-31.7.

Overlapping Experiments
Faster estimates
How many segments will fit in a batch? Giving users a clear way to self-unblock without oncall involvement.
Identified and fixed a bug in the main scheduler feature - the traffic received threshold rule (hidden in 500 lines of sql). Fixing it increases avg estimate of the ratio by 7.3% (test plan) . Unified across surfaces (Viktor Barzin was shipping quickly).
Benchmarked #Adunits, utilized by CS Experiments
Engineering Excellence
Update runbooks with information how to debug and resolve traffic queries.
Update oncall systems to facilitate debugging and resolving scheduler issues
Co-organized docathon (total abt 0.5 eys) updated 16 wiki pages, cataloged repeated customer questions
Oncall participation (2 shifts+3 day backup on 02.01-04.01),owned S382780, S421703, S410219,S421400, worked on other s3's .
Shipped 1st part of migration of estimator to l2/l3 estimations, a major gap between estimations and assignments.
Wiki updates on scheduling and traffic estimations
Fixathon participation
Created Tool to see custom flag overlap
Retro Task 0.35 diffs, 42.02 sloc, 0.63 diffs actioned on, 3nbs, 70wp words, 128 daiquery nb lines/work day, a lot of bento nbs
People
Present scheduling overview as a

Presentation to shops ads (26.06)
multiple ted talks on scheduling, rollout issues, and potential auction-based design
Co-designed a solution for improving runtime of scheduler w/ Viktor (dropping it down from a day to 30 minutes, reducing oncall load)
User guides, etc.
Onboarding Viktor and Xiao on scheduling issues
Sustained effort in increasing trust by team, e.g. by proposing ways to decrCease the footprint of non-clustered experimnents in a way that doesn't compromise clustered csbqrts. This is a huge pain point in the team,
Many comments on Viktor's RFC for RM.
Cataloging repeated customer queries
approaching directly many customers who wouldnt get in the batch with new features (see thanks tool)
Helped resurrect old triggered exposure algorithmic improvement in support of Zeno Gardner's work (D53432398)
Direction
Project docs: 'Estimations before cutoff', 'Segments to Fit In Batch', 'Visualize Overlaps',
Cataloged wide range of possible improvements to scheduler in particular: 1. develop metrics 2. potential custom flag def change
Sketched solution for integrating clusters with scheduler, which opens the whole traffic to be governed by the scheduler.
Overall vision, potentially encompassing the full range of experiments, and handling many business and platform needs, to fold in the cannonical doc
Driving serving memory addition to QRT Scheduler (upper bound 6% of global irev goal), napkin request for hc, contact
Sized opportunities for schedulier from the viewpoint of guided with Lucas (.
**Share 1-3 strengths (work you most enjoyed and excelled at).** Use the Meta Skills or [expectations](https://www.internalfb.com/my_journey/expectations). ------------------------------------------------------------------------------
I loved that my work unblocked customers
I liked moving fast and with clear targets
I liked figuring out the tricky part of the scheduler and trying to model a range of different objectives
I liked directional work, and seeing how for example when I showed Viktor the written-up model in bento with the code and the modelled text he instantly became more trusting.
Similar as above with Shivesh Ranjan. I think I may be able to help in the supply space.
**What are 1-2 areas you are intentionally working on this year to grow or improve?** ------------------------------------------------------------------------------
Information gathering and Communication Improve written and verbal communication - everyone can and should improve their writing. I have particular gaps with 1. lack of consistency in presenting high-level digestable summaries of design documents 2. In the presense of ambiguity, trying to keep all options equally open-for comms purposes better to choose a plan to present, and then in a more concise manner explain alternatives.The question of independence was raised, the combination of 'propose an action' + seek feedback should help with that. 3.More consistency in creating buffers and clearly aligning when I feel the need to plan time for understand work or to make small adjustments to plans. 3. Gaining more context into the organizational environment, priorities and decision making Seek early feedback from team members
Time and Work Management and Organization Creating project plans with concrete milestones maintainign async) contact about project status and building up a Making it easy to see my work async
WBL Better organization and goal clarity is a must to improve that

# 2024 mid year manager review

Stefan, your performance signal is: **Below Expectations**
# **Rationale for the performance signal Stefan received.**

------------------------------------------------------------------------------
[not answered]
# **How is Stefan’s impact tracking relative to their goals so far this year?** 
Include impact achieved, progress against business goals, contributions to efficiency initiatives, and [building internal community](https://docs.google.com/presentation/d/1y-Xvmo75X9v7A0KvFMz6K3Exues5jQJI/preview?slide=id.g1ec6f199c9e_0_0)  as part of the impact assessment.
------------------------------------------------------------------------------
PI
- (=)Overhauled small experiment scheduling, delivering [1.7 EYS](https://www.internalfb.com/eys/homepage?projectID=1137584773944529) and increasing [small experiment throughput](https://l.facebook.com/l.php?u=https%3A%2F%2Ffburl.com%2Fdaiquery%2F4n90bmhi&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI) by 140% (13->32)
    - Tooling for [overlap estimates](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1ioRSlIqu9bF5H5woUBi_V3CYXFCI5n0P9VP0gyGazcU%2Fedit%23heading%3Dh.rfestvxt88&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI), [speed improvements](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1wM01ohcp36kdO7E8BIVzYdDDxPr2wo3TKTxMRDb6fps%2Fedit%23heading%3Dh.czv0vpn4mw66&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI), WIP on helping experimenters [self-unblock](https://docs.google.com/document/d/1BxdVLRQqfDwyzBd_g5hLxHqzULLI0flYK33ZbU3kI0c/edit#heading=h.8zlkiv6k97s9).
- (-)Failed to complete "[segments in a batch](https://docs.google.com/document/d/1BxdVLRQqfDwyzBd_g5hLxHqzULLI0flYK33ZbU3kI0c/edit#heading=h.8zlkiv6k97s9)" feature in H1, despite committing to it -- significant risk of backsliding after earlier demonstration of ability to deliver to a schedule.

EE
- (=)Support for scheduler: [runbook](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/oncalls/BQRT_oncall_runbook/#handling-get-me-in-the-b) updates, [bug fixes](https://www.internalfb.com/diff/D55243761) to address legacy gaps, [wiki](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advertiser_Product_Evaluation_Area/BQRT_Internal_Details/CSBQRT_Scheduler/) updates, [user documentation](https://www.internalfb.com/intern/wiki/AdsInfra/Experimentation/Advertiser_Product_Evaluation_Area/User_Documentation/Budget_QRT_%28BQRT%29/AS_CS_BQRT_User_Guide/%28User_Guide%29_Traffic_Estimation_Tools_Before_Finalizing_Schedule/), work on [guardrails](https://docs.google.com/document/d/1Iu8y-YTUm-kx7YpvU53o4jWKuvwZZWFzcngem3NIlQ8/edit?fbclid=IwZXh0bgNhZW0CMTEAAR3GbJfWTJoqhrLKK4TuiO87m5sw7g7_rMVGLMAVMxI0bJgJoJt-IFMhJ2I_aem_8QTLSF-hF2yLEH97IoDdsA#heading=h.t6x7isqyvvp8) in support of increasing small experiment size.
- (=)Team fixathon participation, one task closed.
- (=)[Co-organized docathon](https://fb.workplace.com/groups/287111599789571/permalink/1002022904965100/), updated 16 wiki pages, [cataloged](https://fb.workplace.com/groups/287111599789571/posts/1002022904965100/?comment_id=1002152791618778) [repeated customer questions](https://docs.google.com/document/d/1tuo3mnQIMhorx22DLstbT1kqSXM0Y5WquJa_tSV5J84/edit#heading=h.6hgq22g7rih). [#3 in team](https://www.internalfb.com/dochub/my_team?project_id=965394031116357&project_name=Advertiser%20Product%20Evaluation%20User%20Docs&start_time=1704067200&end_time=1719705600&contributor_id=1390989691) in wiki updates.

People
- (=)Multiple team presentations on [scheduler](https://docs.google.com/document/d/1PRHi_y1jPBKQmTf42YTJk6jou6dwrNvXSbgrUfgHvoQ/edit?fbclid=IwZXh0bgNhZW0CMTEAAR0gH-NSP1wsGo0FY_HnOsdcyJAtFfKGewAtlukjF9kvH-i5ALi-ltGB2Tw_aem_pTHCPcj5HUFvNucJ9DfsOg#heading=h.lq7cfyo0bdk9), including [potential next steps](https://docs.google.com/document/d/16kGtE-qce_4uACNKDKLSy-OAd5jYkyTYhHmtI2uk0pE/edit?fbclid=IwZXh0bgNhZW0CMTEAAR1sEw00RX6T37ANYNsgPeXO4aJsjlM3Q0aLtNvcc3xIxIU7isFgKEjVgek_aem_n5UHA3C63HiPc5X0uYc3HA#heading=h.ta1avyve209m). Onboarding and [deep-dives](https://www.internalfb.com/me/career/thanks?thanks_ids[0]=1010229497336527&referrer=thanks_redirect) with teammates.
- (=+)[Budget ABTest overview](https://docs.google.com/presentation/d/10lBQ3TIKCqp01EqQxjRFNuyZNPC_Py1Ab8MbqLb_JFg/edit?fbclid=IwZXh0bgNhZW0CMTEAAR11jeBNu1q2onlawrhAsT99zhfx18z-KtjCmkJn2aXndd9RTwIakGCX0rA_aem_0SpU1kd9WE3Y7t6b-CX61w#slide=id.g2538359d6fc_0_0) presented to Shops Ads on short notice.

Direction
- (=)[Planning](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1zRoaRoAzuGjxGDL3YELs0691Az4ItUfVRuRsXPoT7xU%2Fedit%3Fusp%3Ddrivesdk&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI) [for](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1ioRSlIqu9bF5H5woUBi_V3CYXFCI5n0P9VP0gyGazcU%2Fedit%23heading%3Dh.rfestvxt88&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI) [projects](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F1BxdVLRQqfDwyzBd_g5hLxHqzULLI0flYK33ZbU3kI0c%2Fedit%23heading%3Dh.3l0zpuyvrbot&h=AT0f5Om3-uTQsJMHbVdc94IfDhpwiCaxpWM2C-qn3wQbtFIcEJZmIPwBsoRbi9sMqV27uM8KDjmEfAfHPWnZLA9xPy_4Tu71FPj5j9uXZTWzDy3ax7PxcLRJuPoZos79AaP3He4vmFI), including [assembling scheduler user issues](https://docs.google.com/document/d/1YZiT-fBX3heoFVOEryYEeMoQXWxqVKQMjXVVVVmtn7A/edit?fbclid=IwZXh0bgNhZW0CMTEAAR0ZD88tljNWb4OAJL8veaa8bb61r_Jnlum5zWfsvUYk8ZqVjZ5HTYzO2Wo_aem_3bI1eZxPhpxzN_wq37rK5g#heading=h.7xsuchdep8el) as part of larger roadmap.
- (=)Proposed new projects adjacent to scheduler, including [expanding to clusters](https://docs.google.com/document/d/11jlkW_d5w62x94wWdt50GA39CTyUblIOrlD8m1suD0A/edit?fbclid=IwZXh0bgNhZW0CMTEAAR0F3zEiw6r5pcEd-iRk8-vYv_TAMFHfCSWhn-KT8bo6uMxMN_gRLpkLdTQ_aem_1-3nngtRw1is86qwzT_ZOg#heading=h.rfestvxt88) and [investigating bin packing](https://www.internalfb.com/intern/anp/view/?id=5530384&scroll_cell=25).
- (=+)Drove [proposal](https://docs.google.com/document/d/1O2LXth5jqga1GrOr3BV74wpMkQVveYkL39dg_4r-QV4/edit?fbclid=IwZXh0bgNhZW0CMTEAAR2311uZDnxlMczsBBMKqCKBJkebTErHQFSEDWr1LGlannrDFv8DRW4vmoE_aem_8fucDpR-B3MvuojRqIExgw#heading=h.evaykcphveyj) to improve scheduling with ABTest (Shivesh, Ovunc).
- (--)No demonstrated ability to write high-quality design docs without support, and generally trouble communicating project progress. Stefan has difficulty managing his time and gets distracted easily -- he has shown the ability to execute against a schedule but not the ability to sustain that, which causes friction with teammates.
# **Highlight 1-3 strengths Stefan demonstrated.** 
Use the [Career Expectations Explorer](https://www.internalfb.com/my_journey/expectations) to help you describe how well their actions align with expectations or skills.
------------------------------------------------------------------------------
Stefan continues to demonstrate interest in deep solutions to a variety of problems, and the ideas he brings to the table are valuable. He sees limitations in how we're approaching things and wants to fix them, showing good drive and utilizing his expertise. Finally, he has shown a lot of resilience in the face of a very stressful half.
# **How can Stefan increase their impact and what are 1-2 areas they can intentionally work on this year to grow or improve? (Recommended minimum: 150 words)** 
Use the [Career Expectations Explorer](https://www.internalfb.com/my_journey/expectations) to help you describe growth or improvement areas.

------------------------------------------------------------------------------
Several concrete growth areas are already covered in performance plans. Let me make some more high-level suggestions here:
1. Prioritize work and remain focused. Stefan has shown that he can deliver to a schedule when required. He's also demonstrated that he's very interested in lots of things. These are frequently in conflict, and I feel that Stefan can get sidetracked easily. Remaining focused on specific tasks allows for less exploration but more completion of work, and will give Stefan more time to invest in EngEx and People contributions. Once he has delivered strongly on PSC-related items then that is the time for returning to exploratory work.
2. Communicate clearly and think about the perception and interests of others. Stefan has demonstrated that he can keep others up to date, but not that he can do it consistently. This could be improved by trying to think about what other stakeholders might want, and then using that to identify when and how to communicate. For example, communicating deadlines to others helps them predict when you'll deliver work, and builds trust. Giving them regular status updates help maintain that trust by confirming that you're on track (or if you're off track then what the new plan is). Clear roadmaps and technical documents provide a reference point about what's coming next and where you are in a longer-term plan. In all of these cases thinking from the perspective of stakeholders is key -- what do _they_ want to see?
3. Balance exploratory interests with short-term impact. Having a longer-term roadmap will help here, enabling the identification of short-term wins that can buy Stefan the time to invest in more blue-sky work.



# 2023 Reviews


# shivesh 2023-06-28

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
I had few brief interactions with Stefan on exploring improvements to our scheduling and how BQRT can onboard on our scheduling stack and what are additional capabilities we could build to facilitate it. 
Stefan demonstrated great collaboration skill in finding and reaching out to relevant stakeholders to present his ideas. He had some great ideas around using stochastic scheduling, accounting for demand forecasting, and how this problem could be modelled on the current stack as constraint satisfaction problem. He demonstrated excellent communication skills, presented his ideas articulately and engaged in some excellent technical discussions which shows his technical aptitude as well as his ability to influence and create impact.  
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]
# will kemp 2023-06-28
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Embracing Ambiguity, Prioritizing
- **Embracing Ambiguity:** 
    - Stefan and I worked together on the DIRCU forecast model. Stefan onboarded into the area very quickly and immediately picked up the existing data we had to build a simple ARIMA model. He also added features to allow simple manipulation of the model, which made presenting the model to stakeholders easier. 
    - Despite the short turnaround, Stefan was able to propose many possible features, models and approaches to improve the forecast model in the future. 
- **Prioritising:** 
    - Stefan prioritised ruthlessly and we focussed on the simplest approaches for the maximum output. This meant we were able to produce a reasonable forecast in the required short timeline. Our forecast was presented to senior leaders to request additional capacity for H2. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Nothing I can think of.

# paul ryland 2023-06-29

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Job-Specific Skills
I've collaborated with Stefan on three projects over H1: Platform MDE for CS-BQRT; Triggered Exposures; "CI estimation issues".

During each project Stefan has shown impressive fluency with exploratory data analysis with Bento and has a good grasp of our data-structures to dig deep into the data, and quickly produce prototypes.  He always creates many alternatives when prototyping so that the optimal solution can be chosen.

He shows some collaboration with our DS team and with the other members of the team.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively, Prioritizing
During meetings, Stefan needs to present his project progress better.  Stefan has a tendency during, 1:1's and team meetings, to mainly report data and SQL/Python code (Bento/Daiquery).  Not useful.  Little is actionable.  He also has great insights into issues with the data and code but only mentions them verbally in passing, even when they indicate major data consistency issues.  Stefan can improve by:
i) presenting status followed by concerns/observations/issues/risks preferably with possible plans/solutions -- only share links to Bento/Daiquery to back-up your report
iii) label tasks/concerns/observations/issues/risks (e.g. GSD task) --- create plans and work-packages for yourself/others (add structure to work)

# congshan zhand 2023-06-29
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan made a great contribution to the Clustered Budget ABTest workstream. 
- **Improving systems.** He **identified the opportunity** to further optimize the second stage of clustering. He **proposed and executed** a working solution that showed promising results in improving auction purity. This work is very important, as it pushes up auction purity by ~10% for all clusters, making the "bad" clusters also have a chance to become launchable slots. If successfully built and verified, **it has the potential to unblock another ~6 slots and iRev impact would scale proportionally with this improvement**. 
- In general, Stefan has a **strong technical and engineering skills and has motivations to drive innovative and impactful ideas**. I expect and would be excited to see the current optimization solution is successfully built, and other potential solutions proposed by Stefan, including directly clustering campaigns outside of Digraph framework, bring value to the workstream. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
[not answered]

# divyanshu 2023-06-30

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Partnering
Stefan  has ramped up well within the team and has started taking initiatives by himself.
- Stefan has shown good initiative in picking up different projects across multiple pillars. For example, he has been working on triggered exposures, BQRT Tax, and segment id mismatch in conversions. He has been able to communicate with multiple XFNs for different projects, and able to collaborate with them.
- Stefan quickly picked up the material on tax, and was able to deliver the pipeline. He also did a data-driven analysis on the distribution of tax across teams/resource accounts and was able to present to the team. 
- Stefan also started driving the idea of ROI in the BQRT ecosystem, as well as came up with ideas on how to improve CSBQRT scheduler.
Overall Stefan has shown good skills in communication and direction and has onboarded well to the team. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively, Prioritizing
I would like Stefan to get used to the culture of Meta, and try to move fast. In this half, he was working on multiple things, the delivery and impact took a hit on quality and time. For example I was hoping he would land the pipeline by March, however it was landed in May. I would suggest him to prioritise and land things faster rather than working on multiple things. 
I would also like him to discuss feasibility of his long term initiatives, in terms of engineering, maintainability, etc. so he make a better contribution towards team's direction.

# 2023-06-30 matt winn

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Thanks Stefan for your work on creating a time series model for Experimentation Capacity.  This was used in the leadership review, and was a key point in substantiating +2MW of extra machines for H2.  You were very responsive, partnered well with DS and it was great to see an outcome delivered in a short period of time.  
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
as a next step, would be good to have your input into the datasets we need to gather to great (an improved) causal model. 

# qingchao wang

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan is very proficient in skills, always glad to aid in various projects, challenge the status quo with great focus on details.
**He worked very hard and contributed significantly to the conversion hashing project.** With a few guidelines I provided at the beginning of the project, Stefan managed to extend his research to a great extent just within a few days. I was very impressed by the extensive analysis he did for just the couple of days he had time to work on. I really appreciate his attitude in exploring the problem space and looking for a feasible solution. He managed to make the team realise the potential issue was larger than expected and finally it led us to create a SEV aim to deal with the potential issue.  
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
**Stefan can be more successful by focusing on prioritisation.** I am aware that Stefan is working on several projects simultaneously and fewer deliverables can be produced due to the time limit. If Stefan prioritises the projects in progress and park less important ones, he can achieve deliverables much easily. 
**Stefan needs to strike a balance between exploration of the problem space and give scheduled deliverables.** The conversions hashing project required an urgent solution. Stefan could have been more successful if he had focused on one solution and provided a clear-cut path to implementation, rather than exploring multiple possible solutions.

# Saparbek 2023-06-30

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
- Stefan has demonstrated exceptional curiosity and initiative by getting involved in the Estimator project. Despite not being personally responsible for this project, he took the time to learn about it and understand its impact on the team's goals.
- I would like to thank him for his willingness to spend time with me to understand project details, importance, and goals of the project as well as brainstorming with me on metrics to communicate its importance externally
- His ability to ask good questions and understand the overall direction of the project is impressive, and I appreciate his enthusiasm and dedication to our team's success
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively
- Communication: 
    - When presenting proposals/ideas, start with "why"? Describe the problem first, and if there are other solutions describe what you think is wrong with them and then propose your solution
    - If you are not sure that you fully understand the problem scope, utilze smaller group meetings, 1:1 first
- Prioritizing / discovering projects
    - Before spending time on a new proposal, ask people currently working on a project if they have considered the solution 
    - Use oncalls as an opportunity to see user problems and scope new projects out of them


# Albert Cardente Massip
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
This past half I have been having conversations with Stefan about ROI prioritisation of experiments. In these sessions, he proposed some interesting new ideas for prioritising experiments which are competing for resources at scheduling time, such as:
- **Using past team or model type experiment performance to know if RoI is over/under-estimated**. This is the direction in which we are moving as a platform to allocate the resources for the different projects. We need to have a consistent approach when scheduling experiments if we want to maximise the outcomes from experimentation.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
- It would be great to see a prototype of some of his ideas on the scheduler. Budget ABTest is heavily bottlenecked, and valuable experiments run there. Some proofs of concept showing an increase in throughput or a form of experiment value (which is an ambiguous problem) would be very impactful.

# congshan zhand 2024-01-06
# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Stefan made contributions to the 2nd stage clustering. His work allowed the team to achieve [at least 14 good clusters per batch](https://fb.workplace.com/groups/599481660100453/permalink/25404486959173246/) (P50 goal). 
- Independently proposed this [optimization algorithm](https://docs.google.com/document/d/1-dPQTeggMPst-Ixmm6LkPEApJonwrR4JL4Y9gmb9brs/edit?usp=sharing). He was able to execute the algorithm with a low level of support and guidance. 
- Quickly learned how FBLearner flow works and started contributing code fairly fast (within 2 weeks).
- Made efforts of [summarizing results](https://docs.google.com/document/d/1-dPQTeggMPst-Ixmm6LkPEApJonwrR4JL4Y9gmb9brs/edit?usp=sharing) to increase visibility.
- Motivated to find [potential ideas](https://docs.google.com/document/d/1mCOA1kpsDqDfAvlA9HdcAzGip_YsaaxrgMnjimWe6bo/edit?usp=sharing) to improve products. 
From technical standpoint, Stefan's work is challenging: it is required to build facilitating pipelines that didn't originally exist in the codebase (e.g., country representativeness and cluster interaction tables). For performance evaluation, it is also required to initiate many tedious ad hoc training runs. The workload is large (more than a quarter) but Stefan managed to deliver outcomes, which was no small accomplishment. 
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
**Stefan has already made good progress in the following dimensions**. He could continue working on
- **Communication:** 
    - When presenting results, focus on the key message and provide visualizations. Sometimes showing all links and work-in-progress findings can easily confuse stakeholders.
    - Besides Asana, consider summarizing results in a tracking doc; form a habit of documenting. It'd help streamline processes, re-prioritize tasks, and quantify impacts. 
- **Handling ambiguity:**
    - Living with ambiguity will speed up progress. It's often not possible to sort out all details. First spend time on the key one (the one that directly determines success or failure). There will always be time to pick up "nice-to-know" details once the key impact is delivered. 
    
# Sergei Leonenkov 2024-01-08

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
I worked together with Stefan on Clustered BudgetABTest:
- His work was focused on a new optimization criteria for initial clustering, which helped to **improve efficiency and performance of our product and contributed to overall wins from the project**. Thank you for your work in H2-2023!
- In addition to his technical contributions, Stefan has also shown a **strong commitment to supporting his colleagues**. He has stepped up during times of urgent need (oncall cover, initial re-clustering, H1-quotas urgent task), providing assistance to ensure the team's success. These are the values, which are important for our team, thank you!
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
**Focus on impact delivery:** Stefan should continue to focus on delivering impact, I recommend to focus on one thing at a time only and deprioritize any other activity until main project is delivered. It will help to show positive trajectory.
**Document your work, share it for design reviews:** It's important to document proposals/plans/designs. This will not only help to keep track of progress, but it will also help Stefan to embrace ambiguity, stay aligned with everyone in the team, collect invaluable feedback beforehand and help avoid pitfalls, as well as it will speed the whole team up. Clustered ABTest is a nice example of such approach. 
**Align with the team/XFNs/key ICs/EMs before taking actions:** I recommend to always ensure that there is an alignment with the rest of the team&key partners before embarking on a project/area/major task. Our team members has extensive background and will be helpful with the feedback and prioritization advice.

# qingchao wang 2024-01-08

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively, Job-Specific Skills, Partnering, Embracing Ambiguity
**Stefan has exhibited excellent analytical skills in the project solving for segment hashing issues in the Budget ABTesting platform.** 
The issue was reported by XFN partners. After conducting further research, Stefan supported XFN's finding that the current segment hashing underestimates the confidence interval of conversions by at least 20%.The fix of the segment hashing issue indicates potential revenue loss that could have occurred due to this issue is mitigated by 0.2% See his work here: [__BQRT Segment ID- Different Calculations Case Study 15.08.2023__](https://docs.google.com/document/d/1SIPefd8fOXvcG9OH6T6zLJtaRC-ABX1IHTw9wSUkLtU/edit#heading=h.oc4upn6spv5r)
**Stefan has actively involved in communicating with customers about the segment hashing issues in the Budget ABTesting platform.** 
The segment hashing issue in the Budget ABTesting platform has been firstly reported in late 2022 but have not progressed much far since then. Stefan took over part of my role while I was on paternity leave to communicate with XFN partners. 
See his contribution here: https://pxl.cl/47nz0 in workplace group chat https://fb.workplace.com/chat/t/5951068848330472

# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively
**He could have shine more brightly by getting people more engaged with his finding.** 
Stefan had quite some good insights on the segment hashing issue. He explored the issues from multiple angles with multiple approaches. Apart from all these merits, he could have claimed a much higher impact by communicating more actively with stakeholders and XFNs to raise awareness. E.g. some approaches are premature or temporary as a promising engineering solution. By trimming down his analysis and focusing on full_bqrt_segment_id, his insights that confidence interval is much highly underestimated can shine and help prioritise the fix afterwards.

# 2024-01-08 Paul Ryland

# What are 1-2 things Stefan is doing well?
 Consider their impact and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Job-Specific Skills
- During each project Stefan has shown impressive fluency with exploratory data analysis with Bento and has a good grasp of our data-structures to dig deep into the data, and quickly produce prototypes.  He always creates many alternatives when prototyping so that the optimal solution can be chosen.
- He shows some collaboration with our DS team and with the other members of the team.
# What are 1-2 things Stefan could be doing better? 
Consider their work and impact, and how they collaborated with you. Use bullets and share specific examples and suggestions. 
------------------------------------------------------------------------------
Skills: Communicating Effectively, Prioritizing, Embracing Ambiguity
- Since 2023H1 feedback, Stefan has made some big improvements in the way he presents issues during 1:1's and team meetings:
    - he now starts off with verbally presenting issues and not huge Bento notebooks of SQL/Python code and data
- create alignment docs and or detailed tasks in GSD for everything --- the team's Technical Design Document template is a great starting point.  This is especially important when working remotely.  This helps align by:
    - letting your teammates understand that you have a firm grasp on the problem at hand --- you understand the impact and urgency
    - plan of what you are going to do --- sub-tasks, mile-stones --- what are the critical steps?
    - what are the outstanding issues, any concerns/observations have been noticed, and what risks need to be resolved
        - label tasks/concerns/observations/issues/risks (e.g. GSD task) --- create plans and work-packages for yourself/others (methodical breakdown of ambiguity, add structure to work)
    - plan for how you will validate/test the change
    - create commitment for when you will do the work
- don't walk away from half-done diffs/tasks --- some examples [D45911050](https://www.internalfb.com/diff/D45911050), [D50837322](https://www.internalfb.com/diff/D50837322) (2 months)  --- others want to rely on you completing work!

# self review midyear 2023

# What impact have you achieved so far? 
Include progress against business goals, contributions to building internal community, and impact achieved. For Engineers, the Project Impact axis may be described here.
------------------------------------------------------------------------------
( was sick on 30.06, so agreed w/ EM to put some posts early next week if possible)

BQRT Tax and ROI Calculation
Combined BQRT version tax+resource management data (bqrt_version_tax_and_supply_metrics todo- run on schedule) to provide overview of past efficiency and resource usage (dashboard link). Propose [experiment-level ROI definition](https://www.internalfb.com/intern/anp/view/?id=3392069) to be used in BQRT Scheduler ( post link(analysis)). While the results are inconclusive, it can be used basis for future work on experiment-level prioritization.

BQRT Platform MDE
(0->1) Created platform MDE definition, based on control versions, comparable to full BQRT observed mde versions. To be tracked for platform improvements (design doc link ). produced the[ design doc+](https://docs.google.com/document/d/19CgEhu-ifh4PLinTorsCNWw884xb9hAUoEjuTI5XRlg/edit) ,[implementation](https://www.internalfb.com/intern/daiquery/workspace/239038075506201/105486779268156/), and [analysis](https://www.internalfb.com/intern/anp/view/?id=3796450) working w/ DS to validate, expected delivery Q3.


Triggered Exposures
Attempted to find BQRT experiments with loggable models, failed so far due to not understanding loggable models system. I identified an issue with models not being logged, to be continued in H2. 
Identified an opportunity to [reduce complexity](https://www.internalfb.com/diff/D46387927) of exposed user calculation from 2 days and time out to 60 minutes (for any universe). to land in early July.
 
Best Practices Project
Implemented [__D45163679__](https://www.internalfb.com/diff/D45163679)__ __[__D42803508__](https://www.internalfb.com/diff/D42803508)__ __[D46019781](https://www.internalfb.com/diff/D46019781) __to qrt experiment creation, attempting to gamify and improve best practice conformance rate over time. Over h1 after diff land bp conformance rate__ [__improved__](https://fburl.com/unidash/a2l8gaat) __from 0.66 to 0.75.__


# What are the skills/behaviors that led to the outcomes/impact achieved, including work on efficiency? Identify 1-2 [Meta Skills](https://www.internalfb.com/my_journey/expectations) or [Levels & Expectations](https://www.internalfb.com/intern/wiki/Engineering_Careers/IC_Career_Hub/Levels_&_Expectations/). For Engineers, the Engineering Excellence, Direction, and People axis may be described here.
------------------------------------------------------------------------------
[Partnered with CDS](https://fb.workplace.com/workrooms/5862895333802300/), [driving modifying optimization ](https://www.internalfb.com/intern/anp/view/?id=3864853)for clustered CSBQRT. Tests so far show auction purity metric up 13%. [proposed](https://fburl.com/daiquery/yttsrtz7) vs [prod](https://fburl.com/daiquery/zoorj73o). If launched can >launchable slots 8->12-14?, decrease impression shift.
[15 diffs, 1964 SLOC,64 diff commented,555 daiquery nb, 176 bento nb,Wikis:18](https://www.internalfb.com/intern/teaminsights/?metrics[0]=REVISIONS&metrics[1]=DAYS_TO_CLOSE&metrics[2]=DAYS_IN_REVIEW&metrics[3]=LINES_OF_CODE&metrics[4]=SIGNIFICANT_LINES&metrics[5]=COMMENTS&metrics[6]=DAIQUERY_ALL_EXECUTIONS&metrics[7]=DAIQUERY_TOTAL_LINES&metrics[8]=THANKS_SENT&metrics[9]=THANKS_RECEIVED&metrics[10]=WIKI_PAGES_EDITED&metrics[11]=WP_WORDS_IN_POSTS&metrics[12]=DAIQUERY_NOTEBOOK_LINES&metrics[13]=NOTEBOOKS&start_date=1672527600&end_date=1688076000&rollup=Direct&selected_tab=TABLE&employee_ids[0]=1061453847)
[improved code qual](https://fburl.com/gsd/7hbnuarp) in preparation for platformization
Oncall stats: 3 main shifts, 1 shadow shift [SEV3](https://www.internalfb.com/sevmanager/view/318675)- [S348827](https://www.internalfb.com/sevmanager/view/348827)  [__Custom Search | Tasks__](https://www.internalfb.com/tasks) (135) 
[sevs](https://www.internalfb.com/sevmanager/view/320678) [lot](https://www.internalfb.com/sevmanager/view/326282) [bit](https://www.internalfb.com/sevmanager/view/318690) [mitigated](https://fb.workplace.com/chat/t/6448225981865177/) [investigated](https://www.internalfb.com/sevmanager/view/348818)
[__D45154581__](https://www.internalfb.com/diff/D45154581) fix- 8% of cs-bqrt deltoid queries incorrect due to flipped test and control default.

[Discussed](https://fb.workplace.com/chat/t/4958498057608421) QRT and BQRT [scheduler](https://docs.google.com/document/d/1IDxY0WSarx4DEirXeHBJbbl6XngnEW7WFvM8qlI8tHk/edit#heading=h.3l0zpuyvrbot) and platformization, identified [primary conceptual blocker](https://docs.google.com/document/d/1KZkVwb9N9EDpORggh4NgknO9QG17qD9CwOwg6ADfk6A/edit#heading=h.yjx1v182byuy) for this: [__https://fburl.com/gdoc/ln7dsbsf__](https://fburl.com/gdoc/ln7dsbsf) and [__https://fburl.com/gdoc/us4k4mip__](https://fburl.com/gdoc/us4k4mip) . Discussed potential [Stochastification](https://docs.google.com/document/d/1Q92UhTb_uOlje32DJQ6TabhfiQOnotfqPR33mVwyf9E/edit) of QRT scheduler w/ ds and Shivesh.

[Participated](https://fburl.com/daiquery/tgljxmvd) in [capacity](https://fburl.com/daiquery/3e7v98f1) [forecasting exercise](https://docs.google.com/document/d/1gXAkKQDkDprGSo5yRD05sMsDiCjTvS4PPrBHlJ_l9rY/edit#heading=h.fgadz4fpd8zt).

Helped roadmapping by providing [iRev estimates ](https://www.internalfb.com/intern/anp/view/?id=3541395)potential impact for Supply objectives- Scheduler algo improvements, platformization, and early stopping, and activity in discussions.

Flagged [potential ‘budget splitting’ tax](https://fburl.com/anp/25r3plly) in addition to version tax. Shared w/ DS.

# self review end of year 2023
# Highlight your impact relative to goals and expectations. Your mid-year self-review will be included in the year-end review process. Because of this, focus on impact, progress and results achieved since then. Include contributions to efficiency initiatives and [building internal community](https://docs.google.com/presentation/d/1y-Xvmo75X9v7A0KvFMz6K3Exues5jQJI/preview?slide=id.g174d821908c_0_3014). If axes are applicable for your role, you can include them here.
------------------------------------------------------------------------------
# Template 
## Project Impact 
**Overall**:
- [__Released 6 more launchable slots__](https://fb.workplace.com/groups/599481660100453/permalink/25404486959173246/) via [__algorithmic improvements in clustered csbqrt.__](https://docs.google.com/document/d/1-dPQTeggMPst-Ixmm6LkPEApJonwrR4JL4Y9gmb9brs/edit#heading=h.2ays7mklx9m3)(14->20, p50 goal)
- Participated in ci calculation fixes for budget Abtest platform
: clustered bqrt
- **Description**: methodological improvements to the clustered cs-bqrt allocatIon algorithm
- **Role**: initiation and execution
- **Impact:**
    - platform Launchable slots14->20, technicaly 18 possible.
    - [__0.25% irev unblocked__](https://docs.google.com/document/d/1w-vDZN33mHexk6mHYybI--Vx5tuKcBSi2rJVvJZFHGY/edit#heading=h.lkisqisu6rje)
- My contribution:
    - [__Created a proof of concept__](https://www.internalfb.com/intern/anp/view/?id=4225630)
    - **Demonstrated + 10% avg auction purity for this, convinced project team to invest** 
    - [__**Created design do**__](https://docs.google.com/document/d/1kI0Smo6SCyZvwSQWZUPVYFTqio6GLrx0T9TXLWpXP28/edit#heading=h.3l0zpuyvrbot)**c**
    - Rolled out a 'staging' environment for semi- online evaluation of guardrails of proposed clusterings
    - **iterated on both settings and objective**
    - **Rolled out to production after conforming hitting 14 launchable clusters**
    - [__**Did large-scale offline evaluation, showing we could potentially hit 18 launchable clusters**__](https://docs.google.com/document/d/1-dPQTeggMPst-Ixmm6LkPEApJonwrR4JL4Y9gmb9brs/edit#heading=h.2ays7mklx9m3)**.(link)**
    -  (unplanned) Cluster release support/ taking over the clustering 'oncall' duties for the releases on 25.10, 24.11, and 08.01, performing adhoc analysis of results, assigning best clusters to customers when needed.6h/every 4 weeks.
    - (unplanned) Fixing pipeline errors (including Legacy) that would have delayed rollout by a day/ caused sevs due to late landing of cluster allocation
    - Took over clustering pipelines support from CAS (w/ sherstobitov), supporting release, 6h/every 4 weeks.
    - Helping with intention features (diff comments, [__design doc__](https://docs.google.com/document/d/1FtGUTOL6Ygk1AdGNXoU96tPN_CKng-4vZdbOcqGJPzQ/edit#heading=h.3zaomugzkfz9) comments)
Project: [CI calculations for bqrt](https://fburl.com/daiquery/zjtptt5o)
- Description:
- Role: was working with quingchao, Ivan and sammy chen before paul took over the project
 [__A lot of analyses__](https://docs.google.com/document/d/1SIPefd8fOXvcG9OH6T6zLJtaRC-ABX1IHTw9wSUkLtU/edit#heading=h.oc4upn6spv5r), most recent one delivered to the ads ml and 1n1 team, confirming the proposed solutio[__n would work__](https://www.internalfb.com/thanks?thanks_ids[0]=880936026334413).
Also knew and considered the holdout segments problem.
Project: Delivery staging (w/paul)
1. In progress diff for core capabilities (initial prototype diff D50896569, to finish In jan 2024 , playground diffs : D51160118 , [__D50837175__](https://www.internalfb.com/diff/D50837175) ).
2. Identified problem with bqrt delivery staging dashboard, preventing rollout, [__workaround__](https://fburl.com/daiquery/1v5fo430)
3. Investigation of i[mplementation options.](https://docs.google.com/document/d/1nNsNrf-9XTCNc6DvEjjidv1Zgq-CSYgTseQZWEWAFXQ/edit#heading=h.17xp6k1emqda)
4. Investigation of why runs often fail (to add), many runs attempted.
## Engineering Excellence 
**Overall**:
- 3 oncalls, core capabilities, clustering pipelines takeover.
- Contribution to the team**:**
    - Code stats:([__Team Insights__](https://fburl.com/teaminsights/rv3rh580))
        - 32 diffs, 7098 SLOC, e.g.: [__D50292215__](https://www.internalfb.com/diff/D50292215),[__D48248970__](https://www.internalfb.com/diff/D48248970) D46387927 [__D49193653__](https://www.internalfb.com/diff/D49193653)
        - 44 diff commented, e.g. D51664422 
        - 122 notebooks, used for ad- hoc analysis, delivery staging study, CI computation issues, etc.
    - Doc points score: [__394__](https://www.internalfb.com/dochub?start_time=1672531200&end_time=1703980800) 
        - Pages added: 17
        - Pages moved: 0
        - Pages updated: 23
- Oncall [S333544](https://www.internalfb.com/sevmanager/view/333544), [S348827](https://www.internalfb.com/sevmanager/view/348827) ,[S359122](https://www.internalfb.com/sevmanager/view/359122), [S359179](https://www.internalfb.com/sevmanager/view/359179) detected and turned over to exp owners`
            - [__12-19 aug, 21-28 sept, 30.11-07.12; 02-03.01 2024.__](https://www.internalfb.com/omh/view/bqrt/oncall_management_scheduling?schedule=14738)
            - 'clustering oncall' takeover.
            - [__Lots__](https://www.internalfb.com/thanks?thanks_ids[0]=267790359366576) of after- hours [__custom__](https://www.internalfb.com/thanks?thanks_ids[0]=1056134005753882) [__requests__](https://www.internalfb.com/thanks?thanks_ids[0]=132372269840186) [__serviced__](https://www.internalfb.com/thanks?thanks_ids[0]=2055522628114203), [__unblocking__](https://www.internalfb.com/thanks?thanks_ids[0]=1056134005753882) [__many__](https://www.internalfb.com/thanks?thanks_ids[0]=599518468770983) [__experiments__](https://docs.google.com/document/d/1ns6S1KHGJOcDy-KJ6mbgSfpO-76iyS4BtviDAJDoIPk/edit) 
            - [__Setting up of temporary bqrt quotas from 19.12-29.01.__](https://fb.workplace.com/groups/budgetabtestfyi/permalink/2011381732565002/)enabling 202401 booking before release of yearly quotas are (w/ Saparbek).
[__228 oncall tasks closed__](https://fburl.com/tasks/xzhm4b5h)
- Core capabilities (3 sprints)
9 tasks,14 diffs,Eys saved: 0.385(>50% of team's eys).

## People
**Overall:**
**lots of user support and ad-hoc analysis**

**Detailed**
- XFN/X-org collaboration with your partners for your projects, according to feedback from them.
    - Delivery staging [thanks]
    - CAS 
    - Capacity (ashwin, ram)
-  36 thanks  received.
- helped ci project with notebooks
- Guidance/support:
    - Intentions feature- helping with proper data sources and logic for clustering intentions features, ensuring we use the same data across, features, constraints, guardrails and intentions, improving correctness and maintainability.
## Direction
- Created[ __Clustered bqrt intentions feature__](https://docs.google.com/document/d/1mCOA1kpsDqDfAvlA9HdcAzGip_YsaaxrgMnjimWe6bo/edit#heading=h.v5r9p22xiyq3) design proposal, enabling  2 very high quality launchable slots per week 
-  [__Analyzed__](https://docs.google.com/document/u/0/d/1qkkxEKZGxgLOUqlfeZY3bFEfmsvGahcvoczBkV1OMko/edit) feasibility of gaming scheduler proofing that it can’t be gamified, and extended the [__proposal__](https://docs.google.com/document/d/1qkkxEKZGxgLOUqlfeZY3bFEfmsvGahcvoczBkV1OMko/edit)(unblocking up to 5% irev goal) with integration strategy into the qrt scheduler [__via mathematical model formulation.__](https://www.internalfb.com/intern/anp/view/?id=3951991)
- __c__[__lustering algorithm__](https://docs.google.com/document/u/0/d/1kI0Smo6SCyZvwSQWZUPVYFTqio6GLrx0T9TXLWpXP28/edit) __doc__


# Share 1-3 strengths (work you most enjoyed and excelled at).
Use the [Meta Skills](https://www.internalfb.com/my_journey/expectations) or [Levels & Expectations](https://www.internalfb.com/intern/wiki/Engineering_Careers/IC_Career_Hub/Levels_&_Expectations/) as you reflect on your strengths.
------------------------------------------------------------------------------
I liked my persistence and insistence to correctness and perfectionism. this helped both in clustering projects, TE tasks, direction, and user support. I think mitigation and communication improved a lot this half.
# Share 1-3 areas you want to develop or improve.
Use the [Meta Skills](https://www.internalfb.com/my_journey/expectations) or [Levels & Expectations](https://www.internalfb.com/intern/wiki/Engineering_Careers/IC_Career_Hub/Levels_&_Expectations/) as you reflect on your development or improvement.
------------------------------------------------------------------------------
want to improve communication ability further.
want to do the proper senior eng idea ->alignment->proposal->implementation process - will help with influence too, rather than react to circumstances.
# What new experiences do you want to have, and/or what career goals do you want to work toward? This could include developing [new skills](https://www.internalfb.com/me/career_expectations), moving teams or roles, becoming a people manager/individual contributor, or taking on a new project. 
------------------------------------------------------------------------------
more presentations/analytics.

# manager review 2023 midyear

Stefan, your performance signal is: **Below Expectations**
# Rationale for the performance signal Stefan received.
------------------------------------------------------------------------------
Stefan has demonstrated a lot of enthusiasm for the interesting problems we have in Experimentation, and has been of great help to others. Unfortunately, this has come at the cost of a lack of focus on deliverables and metric movements, meaning projects weren't derisked early and no significant impact was delivered in H1. Together we have worked to mitigate this, with ad-hoc milestones shipped late in H1, but this critically needs addressing in H2, with a focus on fewer deliverables and better planning.
# How is Stefan's impact tracking relative to their role and level so far this year? Include impact achieved, progress against business goals, and contributions to [building internal community](https://fburl.com/building-internal-community) as part of the impact assessment.
------------------------------------------------------------------------------
(=) (Onboarding) Best Practices – gamify BPR, rate[ improved](https://fburl.com/unidash/a2l8gaat) 0.66->0.75.
(=) BQRT Tax – [__prototyped approach__](https://docs.google.com/document/d/191izUaY_Oyy762XTKqW5X5Lbbkt0nBCPLQX4zJB7ayk/edit), unsuccessful, further steps available.
(=) [__CS-BQRT Platform MDE__](https://l.facebook.com/l.php?u=https%3A%2F%2Fdocs.google.com%2Fdocument%2Fd%2F19CgEhu-ifh4PLinTorsCNWw884xb9hAUoEjuTI5XRlg%2Fedit&h=AT2X4BKhromk0RNDLT_RcDfMWkco8YVhNjI86LA2eMxY277DiOrFYrDjhX4djtTebn0dMRef7lpuZQRjWo25A05xlaM_URkJvKsAs3lGxdAF6cSkqYV8t8JDi0RbxGgF_hY1z5eMWRo) – [__prototyped__](https://www.internalfb.com/intern/daiquery/workspace/239038075506201/105486779268156/), [__analyzed__](https://www.internalfb.com/intern/anp/view/?id=3796450) approach, validations with DS. Expected delivery Q3.
(!--) Triggered Exposures – lack of data, no meaningful steps. Not derisked early.
(=) Acceptable diffs, SLOC, comments.
- (=+) High notebook/prototyping output (176).
- (=) [__Fixed__](https://www.internalfb.com/diff/D45154581) 8% incorrect cs-bqrt queries.
- (=) Identified opportunity to[ __reduce complexity__](https://www.internalfb.com/diff/D46387927) of exposed user calculation (any universe) ~2days->1hour. Landing early July.
(=) Oncall onboarding, owned [__two__](https://www.internalfb.com/sevmanager/view/318675) [__SEVs__](https://www.internalfb.com/sevmanager/view/348827).
# How well is Stefan exhibiting behaviors that are expected for their role and level?
------------------------------------------------------------------------------
(=+) [__Discussed__](https://fb.workplace.com/chat/t/4958498057608421) QRT/BQRT[ __scheduler__](https://docs.google.com/document/d/1IDxY0WSarx4DEirXeHBJbbl6XngnEW7WFvM8qlI8tHk/edit#heading=h.3l0zpuyvrbot) and platformization, identified[ __blocker__](https://docs.google.com/document/d/1KZkVwb9N9EDpORggh4NgknO9QG17qD9CwOwg6ADfk6A/edit#heading=h.yjx1v182byuy), raised[ __Stochastification__](https://docs.google.com/document/d/1Q92UhTb_uOlje32DJQ6TabhfiQOnotfqPR33mVwyf9E/edit) of scheduler w/ DS, Online Platform.
(=+) [__Participated__](https://fburl.com/daiquery/tgljxmvd) in group-wide[ __capacity__](https://fburl.com/daiquery/3e7v98f1)[ __forecasting__](https://docs.google.com/document/d/1gXAkKQDkDprGSo5yRD05sMsDiCjTvS4PPrBHlJ_l9rY/edit#heading=h.fgadz4fpd8zt) – +2MW of extra machines for H2.
(+) Roadmapping support: [ __iRev estimates__](https://www.internalfb.com/intern/anp/view/?id=3541395)__ __for Supply.
(+) [__Partnered with CDS__](https://fb.workplace.com/workrooms/5862895333802300/),[ __driving modifying optimization__](https://www.internalfb.com/intern/anp/view/?id=3864853)__ __for Clustered CSBQRT – should lead to new metric in H2.
(!--) Lack of focus on planning + impact: projects not derisked, multiple simultaneous projects, resistance to focusing on metrics. Tax project underperformed, Triggered Exposures lasted entire half.
# Next steps on how Stefan can increase their impact and which skills they can develop or improve this year.
------------------------------------------------------------------------------
Stefan worried quite a lot about his impact at the beginning of H1, which was great, but at the end of H1 essentially no concrete metric movements were delivered. While I want to stress that this is not required -- failure is always an option -- what _is_ required is that there are plans on how to derisk projects early, with enough time to react. My concrete recommendations are:
- Work on only one project at a time.
- Write up a project plan with projected impact before starting.
- Identify risks early and plan how to derisk them and fail fast.

# manager review 2023

Stefan, your rating is: **Met Some Expectations**
# **Highlight Stefan's results and impact for the year relative to goals and expectations.** Since mid-year feedback has been shared, please reflect on impact since mid-year and overall results for the year. Include contributions to efficiency initiatives and to [building internal community](https://docs.google.com/presentation/d/1y-Xvmo75X9v7A0KvFMz6K3Exues5jQJI/preview?slide=id.g1ec6f199c9e_0_0).
------------------------------------------------------------------------------

Please find your full results [here](https://docs.google.com/document/d/1wLlCaSQLgOdPwIahzGeq-pLkgVIqQvyhV_SHAFxtc0I/edit).
Thank you for your achievements in 2023. This year you’ve demonstrated a good ability to take your expertise and apply it strategically, being a key part of Clustered Budget ABTest meeting its p50 target in H2. In addition, you’ve shown a lot of interest in the areas we’re working in, engaging with scheduling and forecasting efforts both within and outside of the team.

We have unfortunately had some larger issues around delivery against expectations and communication. Part of this is, I feel, a misalignment around how Meta wants you to work: it’s not only about landing impact, but also about delivering the work you commit to. This is not always possible to do, but in those cases having sensible derisking plans and communicating status proactively are absolutely critical. Fundamentally, as an IC5 you’re expected to be able to operate independently: we agree on deliverables and you then execute on your own, taking responsibility for sensible planning, communication, and requests for support as necessary. We have a lot of work to do on this front in 2024.
# **Highlight 1-3 strengths Stefan demonstrated.** Use the [Meta Skills](https://www.internalfb.com/my_journey/expectations) or [Levels & Expectations](https://www.internalfb.com/intern/wiki/Engineering_Careers/IC_Career_Hub/Levels_&_Expectations/) to help you describe strengths.
------------------------------------------------------------------------------
[not answered]
# **Summarize how Stefan can increase their impact and which skills they can develop or improve this year.** Use the [Meta Skills](https://www.internalfb.com/my_journey/expectations) or [Levels & Expectations](https://www.internalfb.com/intern/wiki/Engineering_Careers/IC_Career_Hub/Levels_&_Expectations/) to help you describe development or improvement areas.
------------------------------------------------------------------------------
These growth areas are around the expectations for an IC5, essentially the ability to execute and deliver impact independently.
1. **Create project plans with concrete milestones**. This will give us both the confidence to set expectations for the half.
2. **Maintain contact about project status, both with me and with stakeholders**. You’ve done much better at this so far this year, but keep the fundamentals in mind, and be proactive about communicating:
    1. What are the goals (including milestones)?
    2. Are you on track to meet them?
    3. Are there headwinds or risks that are causing delays?
    4. Do you need my support to unblock you?
Remember as well that you should be aligned with anyone else in the project space here, e.g. Paul about Detectability / Reliability work, Saparbek about scheduler work, etc.
**Build a track record of success**. We’ve started on this together with the traffic visibility work and are off to a decent start, but it needs to continue.
# **What new experiences and/or career goals could Stefan start, explore or learn about?** Consider their strengths, growth areas and interests.
------------------------------------------------------------------------------
[not answered]

