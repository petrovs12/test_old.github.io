---
id: nxnr9e25lja5r4tw8vz3m1l
title: Token Masking
desc: ""
updated: 2024-12-15T22:35
created: 1689682251868
---
Mask some words in a sequence and predict which tokens should replace that...
e.g. 

```python
from transformers import pipeline
classifier = pipeline("fill-mask")

classifier("Paris is the [MASK] of France.")
```

