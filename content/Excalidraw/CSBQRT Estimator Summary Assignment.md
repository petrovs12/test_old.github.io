**

- Assumes nothing changes in the characteristcs of the traffic, but only of the batch. 
- Given candidate experiments of a batch, figure out a forecast probability of assigning a given adunit to an experiment (justified by the claim/observation that adunits are in [equilibrium wrt custom flags](https://docs.google.com/document/d/1LZzI4-iJ04iEJ32xkUsN_FHwFzM01YdNXFmihcGkRIc/edit#heading=h.wdne1s81v88t)) 
    
- Given these probabilities, compute metrics on the forecasted traffic for experiments, and put guardrails on those.
    

*output: dim(A) = [|ad_unit|,|csbqrt experiments_within_a_batch|] 