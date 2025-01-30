---
id: vwkbx1t8zwe7iq8bk0fw83g
title: readings and thinkin
desc: ""
updated: 1737492103517
created: 1737492101479
---
# Reading Summary

**Current Date**: 2025-01-21

## 1. QuickStep, LLM Evaluation, and Multi-Agent Support
- **Overview**: QuickStep focuses on large language model (LLM) evaluation at different stages, especially for search-based chatbots. It also explores multi-agent systems for support use cases.  
- **Pipeline Focus**: Emphasizes data ingestion, ensuring search result relevance, and the use of knowledge-base augmentation techniques.  
- **Notable Reference**: Tomasz Gleif’s blog post on creating a semantic layer on top of an LLM (mentioned in L4J community resources).

## 2. Project Progress and Feedback
- **Context**: Discussions with Katie on assignment latency forecasting (using logistic regression) highlighted the need for quicker delivery and clearer presentation of project results.  
- **Action Items**: Refine approach, streamline tasks, and present stories more effectively to meet deadlines.

## 3. Model Size Reduction Techniques
### 3.1 Knowledge Distillation
- **Concept**: Transfer knowledge from a large teacher model to a smaller student model (e.g., matching the large model’s classification outputs).  
- **Benefit**: Reduced complexity and size while retaining performance on a specific task.  
- **Reference**: [Hinton et al., 2015 - “Distilling the Knowledge in a Neural Network.”](https://arxiv.org/abs/1503.02531)

### 3.2 Pruning
- **Unstructured Pruning**: Removes individual weights (often low magnitude), but can be hardware-inefficient because sparse matrices do not always reduce runtime.  
- **Structured Pruning**: Removes entire filters/blocks for better runtime benefits, though potentially more significant accuracy trade-offs.  
- **Reference**: [Frankle & Carbin, 2019 - “The Lottery Ticket Hypothesis.”](https://arxiv.org/abs/1803.03635)

### 3.3 Low-Rank Approximation
- **Key Idea**: Decompose weight matrices into low-rank factors (e.g., rank-1 or other small ranks).  
- **Use Case**: Efficient fine-tuning by only learning low-rank updates.  
- **Reference**: [Hu et al., 2021 - “LoRA: Low-Rank Adaptation of Large Language Models.”](https://arxiv.org/abs/2106.09685)

## 4. Hardware and Memory Optimization
### 4.1 FlashAttention
- **Concept**: A reimplementation of the attention mechanism to reduce GPU memory access.  
- **Approach**: Tiling Q, K, V matrices so they fit in faster on-chip (SRAM) memory and avoid repeated global memory fetches.  
- **Reference**: [Dao et al., 2022 - “FlashAttention: Fast and Memory-Efficient Exact Attention with IO-Awareness.”](https://arxiv.org/abs/2205.14135)

### 4.2 KV Caching in Transformers
- **Problem**: Repeatedly accessing previous K (key) and V (value) vectors for each new token is expensive.  
- **Solution**: Cache previously computed K and V; update only the new tokens to avoid full recomputation.  
- **Benefit**: Faster inference for sequence generation tasks.

## 5. Additional Notes
- **Multi-Agent Systems**: Discussed as a means of modularizing tasks (e.g., classification, database lookups, wiki/doc lookups).  
- **Hardware Co-Design**: Ties low-level GPU memory constraints (e.g., SRAM usage, caching) with high-level model architecture choices to maximize efficiency.

## References
1. Hinton, G., Vinyals, O., & Dean, J. (2015). [Distilling the Knowledge in a Neural Network](https://arxiv.org/abs/1503.02531).  
2. Frankle, J. & Carbin, M. (2019). [The Lottery Ticket Hypothesis: Finding Sparse, Trainable Neural Networks](https://arxiv.org/abs/1803.03635).  
3. Hu, E., Shen, Y., Wallis, P., Allen-Zhu, Z., Li, Y., Wang, L., & Chen, W. (2021). [LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685).  
4. Dao, T., Fu, D., Ermon, S., Rudra, A., & Ré, C. (2022). [FlashAttention: Fast and Memory-Efficient Exact Attention with IO-Awareness](https://arxiv.org/abs/2205.14135).