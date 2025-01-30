---
created: 2024-09-02T12:17
updated: 2024-10-15T22:29
---
Key Problem To Assignment Summary; dimred


We start up with a matrix of the kind:dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] (see cs_bqrt_estimator_eligibility_results)
We want a matrix A1, non-negative, entries, s.t.:k is ‘small enough’, latent space, like 20-100.dim(A1) = [k,|csbqrt_experiments|]# overall traffic is preserved, i.e.
A.T*ones(|ad_units|) = A1.T*ones(k)Interactions between experiments (competition for traffic) is preserved as much as possible
Min ||A.T*A-A1.T*A1||
/