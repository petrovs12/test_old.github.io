---
id: 9g27ny98ywrbwj1df65k72n
title: ML System Design Interview Structure
desc: ""
updated: 2024-12-15T22:35
created: 1642338141330
---
Signals they're looking for

- Theoretical knowledge of ML
- Methods/ algorithms 
- How it's done in the industry/ state of the art solutions
- Practical Experience 
- Implementation: development and model serving 
- Technical leadership
- Product leadership: 

 People ask about recommendation systems, as it:

1. Huge impact/ big part.
2. Many approaches, very creative methods, could go in different directions.
3. Non-trivial model serving.
4. Tricky product stuff.

Examples:

1. Recommend new trips to take.
2. Recomend restaurants on Google Maps.

# Design Process

# Clarify Objectives And Constraints (requirements)

[[seed.Product Management.Product School Book#^companygoals]]

1. What are we optimizing?
   Engagement+ revenue are common ones.
2. Timing SLA (batch or real-time)?
3. Scale (whole product/all users, is it decomposeable,etc)?
4. Multiple languages? 
5. Recency of content to show?

**Look for buy in...**

# User Feed/recommendations

<div class="mermaid">
  graph LR;
a[Universe of possible items] --&gt;b[Candidate Generations]--&gt;c[Ranking, scoring, re-ranking]
</div>

# Inputs and Features

Sources:

- User profile
- Item profiles (e.g. videos)
- User-item interactions.
- The search query

Features:

- Session information (length, number of viewed items)
- Item profiles (e.g. videos): NumViews, weighted number of views, description, features from the video, text, data2vec, etc
- User demographics info - age, gender, nationality, location
- Post History/ action history
- Friends and following -  info from the graph

# Some Videos to Watch

[OneNote Links]\(<https://onedrive.live.com/view.aspx?resid=A6A13EED7FFACAB8%215824&id=documents&wd=target%28meta%20notes.one%7C5A0AC04E-9E8E-4CFF-A157-0BCC01CE8AC7%2F%29>
onenote:<https://d.docs.live.net/a6a13eed7ffacab8/Документи/Leetcode%20Problems/meta%20notes.one#section-id={5A0AC04E-9E8E-4CFF-A157-0BCC01CE8AC7}&end>)

<https://www.youtube.com/watch?v=7VFoLDN3apI&ab_channel=DataScienceJay>
<https://www.youtube.com/watch?v=sEZsIUBIhNk&list=PLmGsNPZGeM5D8fgr2scwe8wZih4SYB7Vt&ab_channel=InfoQ>

<https://www.youtube.com/watch?v=4mG7morAasw&ab_channel=DataScienceJay>
<https://www.youtube.com/watch?v=sEZsIUBIhNk&list=PLmGsNPZGeM5D8fgr2scwe8wZih4SYB7Vt&ab_channel=InfoQ>
<https://www.youtube.com/watch?v=HREeLryOh4Q&list=PLmGsNPZGeM5D8fgr2scwe8wZih4SYB7Vt&index=3&ab_channel=ArtificialIntelligence-AllinOne>

