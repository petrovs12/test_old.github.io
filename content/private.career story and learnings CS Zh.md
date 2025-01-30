---
id: no4l9jf3o5czopk9x26kpec
title: career story and learnings CS Zh
desc: ""
updated: 1733734036336
created: 1733734034104
---

After spending 4.5 years at Meta, I feel it’s about time to share my learnings. It's been a journey filled with learning, growth, and a fair share of challenges. From working on various projects to collaborating with talented people both in and outside CAS, each experience has taught me some valuable lessons. I’d like to highlight some moments that were particularly insightful for me.



TL;DR

Lesson 1. Being Open-Minded and embracing unknowns

Lesson 2. Embracing Setbacks as an Opportunity to Grow

Lesson 3. Building good engineering skills

Lesson 4. Building a strong sense of ownership



Transition to Meta

Lesson 1. Being Open-Minded and embracing unknowns

Starting at Meta straight out of grad school, where I was trained as an econometrician focused on high-frequency statistics, meaning that I spent most of my time dealing with equations like the one in Fig 1, was a leap that took me far from my comfort zone. Right from the start, I was plunged into unfamiliar territories. My first project focused on understanding advertiser spend responsiveness. It aimed to address a fundamentally important question for Meta, but it featured an open-ended problem statement and various potential solutions. This required me to quickly grasp the relevant business context and pick a method that made most sense. Even with Peter and J. Mark teaching me how economists at Meta typically approach this type of problem, I steered the analysis in a slightly different direction that aligned more with my time series background. Even from today’s view, the method I used was quite innovative to apply to such a problem. However, the issue was that I was overly confident in it without thoroughly examining the data quality to derisk the project. Building statistically meaningful results turned out to be very difficult. After working on it for more than 6 months without successful validations, we had to shelve the project. 

Learning from this experience, I started to be more open-minded – listening to all ideas especially when facing an ambiguous problem, derisking projects more carefully, abandoning wishful thinking, asking mentors and experts around me to check if they see risks that I don’t see, and spending more time just playing with data in the early stage of any project. Around two halves in, the pieces started to click into place. I began to feel more comfortable and confident in the process of how projects are formed. Additionally, I started intentionally adjusting my communication style, tuning down technicalities to reach a broader engineering community by knowing my audience better, thinking of the goals I wanted to achieve before conversations and only providing information that was absolutely necessary to achieve those goals. Reflecting on this journey, staying open and eager to learn has been pivotal. Over years, it continued enabling me to pick up new techniques, broaden my scope, and tackle increasingly complex challenges across various contexts. In fact, most of my good ideas came from exploring areas previously unknown to me. When I learned about the challenges with budget-controlled experimentations (more details in the sections below), I realized that this sounded an awful lot like an interference problem. While I wasn't an expert in this area, I took it as an opportunity to learn more, which opened up new project areas to tackle problems that had been unsolved for years.




Fig 1. A classic jump diffusion model for the log price process in financial econometrics



Growth at Meta

Lesson 2. Embracing Setbacks as an Opportunity to Grow

The journey to making an impact is filled with twists, turns, setbacks, and lessons. After about a year, I started working on developing Synthetic Control Mean 2.0, a methodology that shrinks confidence intervals by smartly exploiting pre-treatment data. Initially we had planned to bring this to QE, but we weren't seeing good enough results compared with another method being built at the time, so we failed to get adoption. Rather than put the work on hold, we asked why not try it out with QRT data (in the area of Ads Experimentation which presented considerably higher opportunities for variance reduction) and we did it. The results turned out to be quite promising (see Fig 2), but ENG did not prioritize this due to lack of initial alignment. It was disappointing to see this project fail to gain traction, so to still get some value out of it we decided to make it available as a Bento kernel, so at least experiment owners could see the benefit. Over time, this got the attention of senior analytics people as a top contender for variance reduction and was subsequently integrated into the QRT platform. Adoption depends on many things that sometimes are out of our control, but we can maximize what we can control by persistently seeking new applications for our methods. Rather than being disheartened by the initial lack of adoption, the challenge provided me with a valuable opportunity to explore new application areas. It was exactly because of this exploration, which was seemingly unnecessary at the time, I became acquainted with QRT data and the operational dynamics within that organization, both of which have been instrumental in shaping my future collaborations and paving the way to bigger wins down the road. 




Fig 2. The performance of Synthetic Control Mean 2.0 across 100 QRT universes. Surprisingly, I heard recently that variance reduction from regression adjustment has become stronger in QRT than it was years ago. If true, I’d be glad the impact of this piece of work has been growing.



Lesson 3. Building good engineering skills

In my opinion, building good engineering skills is crucial for researchers in CAS: it allows us to build proof-of-concepts quickly, demonstrate the practical value of research ideas as opposed to using pure theoretical arguments or simulations. It also makes us understand ENG constraints better so we can better attune proposed scientific solutions to the system, and it enables us to unblock ourselves and move quickly when difficulties arise in the implementation stage. Among the projects in my early years, I intentionally worked on a few engineering-intensive projects, including building mean 2.0 for ratio metrics in Deltoid, developing HTE Screener (later merged into HTE-as-a-Service and demonstrated in Fig 3), Buyer Intent Score, and Ads Experimentation kernel. Not all of these became successful products at the end of the day, but all provided fantastic opportunities to sharpen my engineering skills. 

As an example, working with the shaper file of Deltoid (i.e., the engine that generates Presto queries for lift computations) was very tough, which overwhelmed me for a number of weeks and there were separate calculation systems (precomp and adhoc) in different languages that needed to generate identical results. The level of engineering complexity was high even for a seemingly straight-forward task of computing ratio metrics. Sometimes it feels painful to work with systems like this. However, in this process I observed how senior engineers debug and test their code. For me, observation plus imitation was an effective way of picking up good practices. Building engineering skills not only helped me progress towards becoming a full-stack researcher, more importantly, I was less afraid of working on complex systems or intricate data pipelines. The time savings and gains in development efficiency have often been very surprising when we are capable of building solutions that would otherwise need help from engineering partners: some of my later successful projects, for example the measurement redesign for Infra ABTest, wouldn’t have gone so well if I hadn’t been capable of or had not contributed significantly to the engineering components. 




Fig 3. Output of HTE Screener: The left figure is a typical output that shows treatment heterogeneity and right figure is a visualization of simple personalized policies automatically generated for users.



Lesson 4. Building a strong sense of ownership

I am grateful for the numerous opportunities I've had to work on large-scale projects involving collaboration across organizations. One of my earliest experiences in this area was developing the Shops Score for e-commerce which aimed to build an Ads-Score-like topline metric that combines a value and a quality component for the space of e-commerce — a large undertaking that involved tackling intricate scientific challenges in causal inference and optimization, engaging with numerous stakeholders, and managing diverse people challenges. This work was pivotal in fostering my sense of responsibility for all subsequent projects I undertook. Through this experience, I learned the importance of building trust with high-quality deliverables and established myself as a reliable partner capable of effectively managing tasks. Also in this project, I started to proactively think of risks in the part of the project I was responsible for, pointing out risks in other people’s work and mitigating them. Additionally, I communicated transparently with partners and stakeholders to align expectations both in science and in timelines and deliverables. 

Although Shops Score was eventually discontinued due to a strategic reprioritization during the pandemic, the skills I gained from it were instrumental in achieving one of the career milestones I am proud of—the Clustered Budget ABTest. Like all projects, this too faced many challenges from ideation to execution: There were many correctness issues with the platform at that time. I focused on the major problem from this ambiguity, connected it to a type of interference bias in A/B testing, proposed the solution, evaluated its engineering feasibility, performed the due diligence in early data analysis to derisk the project, mapped out how the system should be working, formed a team towards building the key engines to power it, including clustering formulation and balancing, performance monitoring and guardrail system, and performed a thorough validation to build trust, which later allowed for a smooth path to full adoption. Looking back, one of the main reasons why we were able to deliver the MVP within a half and reached full adoption within a year was our mindset that we are the captains of our projects, ready to navigate through ups and downs propelled us forward through various risks and eventually made the product one of the biggest successes in its area for years.  




Fig 4. The left shows the process of finding the optimal tradeoff between the GMV and the quality components in Shops Score; the right shows the comparison of auction purity distribution between Clustered Budget ABTest and the old Any-Traffic CS Budget ABTest.



Scale further based on past learnings

After my work in Budget ABTest, I started a formal collaboration between CAS and Infra ABTest, venturing into this complex area. Infra ABTest has been a platform driving Infrastructure-based innovation for the past 10 years. With recent efficiency push across the company, infra constrained experimentation has become a critical area. It presented a significant opportunity, yet because of the fact that infra ABTest is embedded in ads serving, the amount of nuances in this space is daunting in terms of both design and uncertainties due to fast evolvement of serving infrastructure (e.g. Serving Elasticity Redesign, Debundling, Neutron Star, Heterogeneous Hardware) that will all affect the correctness of Infra ABTest. When I entered this area, the prospect of making changes seemed overwhelming due to years of stagnation, the extensive sign offs required, and potential customer resistance. Reflecting on that time, it took some courage to embrace such a challenge. Since then, we have invested considerable effort in understanding the problem space, establishing what needs to be corrected, devising a practical plan to gradually bring the platform to state-of-the-art, resolving long standing problems in its measurement, and innovating bigger solutions. 1.5 years into this endeavor, I began to see a path towards what could be one of the largest expansions of this area: Building on our experimentation work, including improvements to correctness and detectability to Infra ABTest and scaling infra control to all regular QRTs through Infra-Adjusted ABTest, we are now working to scale this effort to Ads Serving Infra and key areas in non-Monetization. This initiative is particularly timely given Meta's focus on efficiency and significant investment in AI hardware. This journey is still ongoing, and I am thrilled to be intimately involved every step of the way.




Fig 5. Pairwise comparison between Infra-Adjusted ABTest and Infra ABTest. The right side demonstrates the magnitude and sign consistency that our method achieves that was absent in Regular ABTest.



The end

Reflecting on my experiences in CAS, I'm humbled by the trust and support I've received from people around me, and I am thankful for all the learning and growth opportunities. Working with you is the motivation that keeps me going. 

Finally, I would like to thank Aude and Okke for giving me the opportunity to reflect on my journey, and providing super valuable feedback to this piece of writing, making it such a rewarding experience. I want to thank my mentors over the years, Peter, Israel and Aayush, for sharing their experiences and providing actionable feedback, my colleagues for teaching me a lot things and having fun together, my managers for their unwavering supports, and my amazing XFN partners who trusted me to play in their backyard.   

A picture of me watching Mr Olympia this year as a reminder to build up stronger at work and beyond.