---
id: 5uql1zj798h2cad6ggualq0
title: Flash attention
desc: ""
updated: 1737466004479
created: 1737465187925
---

Transformers are slow and memory-hungry on long sequences, since the time and memory complexity of self-attention are quadratic in sequence length. Approximate attention methods have attempted to address this problem by trading off model quality to reduce the compute complexity, but often do not achieve wall-clock speedup. We argue that a missing principle is making attention algorithms IO-aware -- accounting for reads and writes between levels of GPU memory. We propose FlashAttention, an IO-aware exact attention algorithm that uses tiling to reduce the number of memory reads/writes between GPU high bandwidth memory (HBM) and GPU on-chip SRAM. We analyze the IO complexity of FlashAttention, showing that it requires fewer HBM accesses than standard attention, and is optimal for a range of SRAM sizes. We also extend FlashAttention to block-sparse attention, yielding an approximate attention algorithm that is faster than any existing approximate attention method. FlashAttention trains Transformers faster than existing baselines: 15% end-to-end wall-clock speedup on BERT-large (seq. length 512) compared to the MLPerf 1.1 training speed record, 3

So flush attention like basically what it's doing is it's trying to optimise the calculation of the attentions by making sure like the relevant stuff so bye-bye basically minimising operations and making sure for example when you load certain victory memory like in the flash memory in the different tear the faster memory of the GP you like duo calculations with it then offload it into the calculations for the next one something like that.

there is an sram memory and hbm memory...




You can treat each submatrix multiplication (or each attention sub-block) as a “job” that requires certain data “operands” in on-chip SRAM. Formally:

1. **Sets and Indices**  
1. **Sets and Indices**  
    - Let $$J = \{1, \dots, N\}$$ index all “jobs” (e.g., multiplications or attention sub-steps).  
    - Time is discretized into steps $$t \in \{1, \dots, T\}$$, or you can use an ordering model rather than explicit time steps.

2. **Decision Variables**  
    - $$x_{j,t} \in \{0,1\}$$ indicates whether job $$j$$ is executed at time $$t$$.  
    - $$y_{i,t} \in \{0,1\}$$ indicates whether submatrix/block $$i$$ is present in SRAM at time $$t$$.  
    - (Optionally) $$z_{i,t} \in \{0,1\}$$ indicates whether block $$i$$ is loaded from HBM into SRAM at time $$t$$.

3. **Constraints**  
    - **Capacity constraint**: $$\sum_{i} \bigl(\text{size}(i)\cdot y_{i,t}\bigr) \le C$$, where $$C$$ is the SRAM capacity.  
    - **Data availability**: A job $$j$$ that depends on blocks $$i_1, i_2, \dots$$ can only run if those blocks are present:  
      $$
         x_{j,t} \le y_{i_1,t}, \quad x_{j,t} \le y_{i_2,t}, \quad \dots
      $$
    - **Load/unload linking** (if you explicitly track loads): If block $$i$$ is not in SRAM at time $$t-1$$ but is needed at time $$t$$, you must set $$z_{i,t}=1$$. Also, if $$z_{i,t}=1$$, you must have $$y_{i,t}=1$$.  
    - **One-job-at-a-time** (if you require sequential execution at each time step): $$\sum_{j} x_{j,t} \le 1$$, or some parallel limit.

4. **Objective**  
    - Minimize total loads (or total HBM I/O). This can be approximated by minimizing $$\sum_{i,t} z_{i,t}$$, the number of times blocks are brought into SRAM. Alternatively, you can incorporate cost weights for loads and evictions.

Such a formulation reveals how to tile the computations and schedule block transfers to minimize SRAM↔HBM traffic. Though solving the full MIP is generally expensive, insights (e.g. which patterns or tiling orders appear optimal) can inform heuristic or deterministic tiling implementations for the attention kernels.
