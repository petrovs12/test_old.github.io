---
id: bq2049tvv95z83zy7sbv2f3
title: Sys Design Criteria
desc: ""
updated: 1733564261258
created: 1733564258486
---


SWE System Design
The purpose of the SWE System Design is to assess the candidate’s ability to design a well-structured system(s) or a piece of a system and describe how their piece(s) fit into a larger context.
Note: The interviewer should be a Meta engineer with adequate experience (e.g., E5 and above) to guide interviewees. They should have a good grasp of the problem and have a deep understanding of the focus areas below.

After reviewing this interview role guide, check out the SWE System Design elearn to learn more!
Please use this direct link to access the vetted questions for the SWE System Design interview in the IQB.
Please use the SWE System Design Leveling Guide  as SUPPLEMENTAL materials during the interview process. The supplemental leveling guidance should NOT be used as a checklist, nor should it be used to rate focus areas, rather as a guide to help interviewers make leveling recommendations after conducting the interview.

FOCUS AREAS
Problem Navigation: Organizes the problem space, the constraints, and potential solution(s). Asks questions to systematically reduce ambiguity, targets the most important problems to solve, understands what’s needed for quantitative analysis, and defines a requirement set. Demonstrates awareness of the system or domain from an end-user perspective.
Solution Design: Designs a working solution for the complete problem/system or pieces of the problem/system. Considers the big picture or broader context in their design. Approaches layering and organization of components thoughtfully. Keeps scale and multiple developer scenarios in mind, especially when conducting quantitative analyses.
Technical Excellence: Dives deeply into technical details. Articulates dependencies and tradeoffs in the solution. Identifies and grapples with challenging aspects of the problem, including foreseeing and mitigating potential failure points and non-functional aspects (e.g., maintainability, testability, API considerations).
Technical Communication: Articulates their technical ideas, viewpoints, language in area of expertise/domain, and vision. Communicates reasoning in a logical and structured way to others. Listens to feedback and incorporates that into the design as appropriate.

RATING GUIDANCE
First, provide written feedback about the candidate in the structured feedback tool.
Next, rate the Focus Area using the following scale:
Insufficient: Responses indicate significant gaps in proficiency
Moderate: Responses indicate proficiency with some gaps
Solid: Responses satisfy basic requirements
Strong: Responses indicate significant proficiency
Exceptional: Responses indicate outstanding proficiency
Cannot Assess → Didn’t ask questions for a given focus area and therefore can’t make an assessment
Cannot Assess → Observations too limited: Questions were asked for a given focus area, however answers were not substantial enough to support an assessment
Then, determine whether the candidate meets or does not meet the criteria for the interview role after rating all Focus Areas.
In certain instances, the interviewer will see a recommended decision about whether the candidate met the criteria to move forward in the process. This recommendation will be indicated within the relevant dropdown menus in the “Make a Final Decision” section.
Provide a narrative summary of the interview.

EVALUATION CRITERIA
Please note, the example behaviors below should be used as a guide to “self-calibrate” on what types of behaviors are associated with different focus area assessment ratings. This is not an exhaustive list of all behaviors that interviewers may observe during the interview.
The evaluation criteria are on a 5-point rating scale: Insufficient (1), Moderate (2), Solid (3), Strong (4), and Exceptional (5). Interviewers will be able to select any of those ratings for each focus area, even though only the 1-3-5 ratings are shown below.

Problem Navigation
Organizes, structures, and/or analyzes the problem space
Insufficient: Struggles to understand or structure the problem space; is unable to make true progress while exploring or analyzing the problem (even with hints)
Solid: Identifies problems and systematically analyzes most smaller pieces of the problem; works to structure the problem space with some hints; identifies where issues follow the form of a known class of problem(s)
Exceptional: Displays high levels of organization and has a clear logic to the order of topic discussions; identifies, organizes, and structures the overall problem space before analyzing sub-problems; bounds the problem and prioritizes sub-areas/ requirements (e.g., non-functional and functional)
Navigates issues in the problem space
Insufficient: Is generally unable to identify or work around common issues and challenges in the problem space
Solid: Works around some common challenges within relevant problem space; addresses practical issues when performing common tasks in relevant systems
Exceptional: Consistently leverages expert judgment and knowledge to anticipate common and more obscure challenges across the stack; selects appropriate abstractions for the problem; foresees and describes the nuances of important pitfalls in development and explains how to counteract them in a larger organization
Focuses on important problem areas and guides parts of the interview
Insufficient: Does not adequately work to understand one or more major aspects of the problem; fixates on minor and non-critical facets of the problem; needs continuous interviewer intervention to stay on-track
Solid: Accurately articulates the central problem(s) to solve for; engages with big-picture or critical areas of the problem; guides and follows through with key aspects of the problem with some guidance
Exceptional: Independently leads exploration into the most important problem areas and guides significant parts of the interview; proactively reduces ambiguity in the problem statement; effectively shapes how the solution should work and how components should be designed; re-prioritizes aspects of the problem based on new information

Solution Design
Creates a working solution that addresses key aspects of the problem/design
Insufficient: Designs a solution that does not solve the problem/design; may create an architecture or system that is convoluted, ineffective, and difficult to understand, or misses key components
Solid: Designs functional systems that address core parts of the identified problem/design
Exceptional: Creates effective working solutions that address multiple, critical aspects of the problem/design; successfully designs an overall system or architecture that is easy to understand
Accounts for scalability / specific technical solutions
Insufficient: Creates a design that works on only a small scale of data; persists in their non-scalable approach despite hints and suggestions
Solid: Uses basic techniques to deal with either large quantities of data/files OR very specific technical solutions; identifies related issues, especially when prompted to or provided with hints
Exceptional: Proactively builds a scalable design across a wide range of users and data OR for complex, specific problems; independently foresees and accounts for multiple challenges with large-scale data (e.g., syncing with error correction) OR complex, specific problems in their design
Designs with user experience and problem in mind
Insufficient: Makes choices that do not reflect an understanding of the problem or how systems provide value to users; struggles to describe how the end user might react to the product; is unable to approach the product from different perspectives
Solid: Infers sensible design requirements based on the user's problem statement; shows an understanding of how the end user might react to the product; grasps the kinds of experiences that would be acceptable to the end user (e.g., offline experience, reasonable latency)
Exceptional: Proactively works through problems by sharing expert insights regarding how features come together to make a viable and valuable product; describes stages of rollout; connects technical decisions to product behavior for different end user populations; analyzes problem statement(s) to verify gaps in the user experience
Deploys architectural/design patterns with extensibility and multiple developers in mind
Insufficient: Is consistently unable to maintain separation of concerns within the design; centralizes responsibilities in single objects or distributes them without a logical plan
Solid: Designs layers with clear, focused responsibilities (e.g., avoids a single class responsible for networking, disk, and UI); enables code reusability where appropriate; walks through their design using basic user scenarios
Exceptional: Deploys logical architecture/design that ensures clear separation of concerns; segments functionality so that individual components can be updated without impacting the entire system; covers challenging extensibility edge cases

Technical Excellence
Demonstrates technical knowledge of concepts/techniques/frameworks/APIs
Insufficient: Demonstrates misunderstandings of core concepts, frameworks, techniques, and/or APIs within area of expertise; is unaware of basic abstractions and functionality
Solid: Demonstrates familiarity with some common abstractions and programming models; can go deeper in at least one relevant framework, concept, technique, and/or API to describe its strengths, limitations, motivations for design, and common workarounds
Exceptional: Consistently displays understanding and mastery of relevant frameworks, concepts, techniques, and APIs across the stack; deeply elaborates on the technical specifics and explains the ‘whys’ of these specifics; compares with other relevant frameworks and concepts that serve similar purpose
Dives into technical details where appropriate
Insufficient: Struggles to describe general technical concepts, approaches, techniques, and potential solutions beyond a basic level, even when probed
Solid: Demonstrates sufficient technical knowledge in challenging and essential aspect(s) of the problem; goes in depth (when prompted) to describe a reasonable and/or implementable solution
Exceptional: Displays expert-level working knowledge of more than one challenging problem area; thoroughly, accurately, and insightfully explores the technical details of the problem
Articulates multiple options and assesses tradeoffs
Insufficient: Is unable to explain the reasoning or related tradeoffs / dependencies behind decisions; struggles to identify or foresee the consequences of their design choices
Solid: Identifies an important and viable alternative; explains system tradeoffs and dependencies with sufficient depth; objectively talks through the pros and cons of their design choices with some hints
Exceptional: Proactively talks through nuanced implications, tradeoffs / dependencies, and long-term challenges; uncovers and examines multiple technical alternatives by leveraging expert depth and insight
Foresees potential points of failure
Insufficient: Struggles to anticipate or avoid pitfalls; does not account for basic issues that are common in design (e.g., keeping cached data up to date)
Solid: Addresses pitfalls or common issues in design; speaks to some potential risks and points of failure in the system; generates a design that is largely extensible and flexible to new requirements
Exceptional: Foresees subtle but challenging details (e.g., version-to-version DB schema upgrades); describes where patterns fall apart (e.g., scaling up engineers on the project, amount of code, or amount of users); leverages a variety of experiences to illustrate points of failure

Technical Communication
Communicates technical concepts in a focused and logical manner
Insufficient: Communications are not structured or logical; frequently over-indexes on non-critical parts of messages, leaving others unclear or confused; randomly jumps from one topic to another
Solid: Communicates information in a logical way; approaches many topics and technical concepts in an organized manner; brings relevant context into each area
Exceptional: Approaches all topics and technical concepts in a focused, logical, and organized manner; makes complex topics easily digestible; is consistently crisp, clear, and accurate in technical discussions
Articulates technical ideas and benefits of design
Insufficient: Struggles to communicate technical ideas clearly or concisely, even with hints; has difficulty explaining common concepts that are pertinent to their solution; struggles to explain why their design choices are appropriate for solving the problem
Solid: Articulates technical ideas and information in an understandable way (after some probing); communicates the benefits of their design choice
Exceptional: Shares technical ideas in a clear, concise, and compelling manner; articulates complex, nuanced, or conflicting views in an easy-to-digest way; makes a compelling case for their design choice
Demonstrates fluency in area of expertise or subject matter
Insufficient: Has difficulty explaining relevant language / vocabulary that are pertinent to their solution, or does so in a confusing way; uses the wrong language / vocabulary for a given topic
Solid: Demonstrates fluency in relevant language / vocabulary for a given subject matter or in area of expertise (i.e., domain or pipeline)
Exceptional: Show expert-level fluency for a given subject matter or in area of expertise (i.e., domain or pipeline) by integrating critical, complex, and relevant language / vocabulary into answer
Engages with technical queries and feedback from the interviewer
Insufficient: Requires detailed explanations before grasping problems; ignores concerns or problems the interviewer raises; pushes back defensively when encountering a gap; requires multiple rounds of questions before providing answers
Solid: Demonstrates comprehension of technical questions from interviewer; listens carefully; is willing to acknowledge missteps openly and easily
Exceptional:Thoroughly responds to technical questions from interviewer even when prompts and hints are indirect; incorporates feedback from interviewer and works backwards to debug any communication gaps; demonstrates attentive listening throughout discussion