---
id: rwqoeg10di4q6oef18plx6q
title: Automatic Differentiation
desc: ""
updated: 2024-12-15T22:35
created: 1652088752579
---
References: [Matlab site](https://www.mathworks.com/help/deeplearning/ug/deep-learning-with-automatic-differentiation-in-matlab.html).

$x_1 exp(-\frac{1}{2}(x_1^2+x_2^2)).$

<div class="mermaid">
  graph TB;
x1[x1] --&gt; u1[u2=x1^2];
x2[x2] --&gt; u2[u2=x2^2];
u2[u2] --&gt; u3[u3=u2+u1];
u1[u1] --&gt; u3[u3];
u3 --&gt; u4[u4=-1/2u3];
</div>

# Forward Mode Differentiation

# Reverse Mode Differentiation

