---
id: o294cr59s4v15tt55a7849c
title: Data Science Process Diagram
desc: ""
updated: 2024-12-15T22:35
created: 1645907363147
---
<div class="mermaid">
  graph LR;

a[Data Collection] --&gt;b[Data Preparation] --&gt; c[Model Training] --&gt; d[Model Evaluation/Selection] --&gt; e[Model Persistence]
req[Requests]--&gt;ms[Model Serving]
ms--&gt;ml[Model Logging]
ms&lt;-.-&gt;g
ms&lt;-.-&gt;f





b--&gt;f[Feature Store]
c--&gt;g[Model Store]
</div>

