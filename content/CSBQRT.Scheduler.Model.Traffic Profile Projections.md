---
id: kis874qj9syvcigqla12rak
title: Traffic Profile Projections
desc: ""
updated: 2024-12-15T22:35
created: 1728893688460
---
#### Formal Definition and Implementation

To quantify **Traffic Selection Bias**, we consider the distribution of traffic across key dimensions (e.g., country) and measure deviations from the desired profiles. 

**Projection Framework:**

1. **Latent Dimension Projection:**
   - The `trafficMatrix` variable captures the projection of each experiment setup along the latent dimensions. Specifically, each row in `trafficMatrix` represents a dimensionally reduced representation of an experiment's traffic profile.

2. **Distribution Projection:**
   - For each adset, we can project it to a distribution across the key dimensions of interest (e.g., country distribution). This projection is facilitated by the dimensionality reduction function $ f$, which maps the latent representation to the distribution space.

3. **Mapping Reduced Representation to Distribution:**
   - While the projection from an adset to its distribution is defined, mapping a row from the dimensionally reduced `trafficMatrix` to the full distribution across key dimensions remains undefined. This mapping is analogous to constructing a balanced multi-feature table for clusters, where each cluster is associated with a specific distribution across multiple features.

**Chi-Squared Distance for Bias Measurement:**

To measure the deviation between the observed traffic distribution and the expected (desired) distribution, we employ the Chi-Squared (\( \chi^2 \)) distance:

\[
\chi^2 = \sum_{d=1}^{D} \frac{(O_d - E_d)^2}{(E_d + O_d)}
\]

- \( O_d \): Observed frequency in dimension \( d \) (e.g., actual traffic in country \( d \)).
- \( E_d \): Expected frequency in dimension \( d \) based on the `trafficMatrix` projection.

This metric effectively captures the discrepancy between the allocated traffic and the desired distribution across all key dimensions.

#### Implementation

To integrate Traffic Selection Bias into the scheduling model, we introduce penalty variables and constraints based on the \( \chi^2 \) distance.

1. **Penalty Variables:**
   
   - \( z_{i,w,d} \in [0,1] \): Represents the penalty for traffic deviation in dimension \( d \) for experiment \( i \) scheduled in week \( w \).

2. **Constraints for Penalty Calculation:**

   For each experiment \( i \), week \( w \), and dimension \( d \):

   \[
   z_{i,w,d} \geq y_{i,w,d} - \text{trafficMatrix}_{i,d} \times \left( \sum_{d' \in D} y_{i,w,d'} \right)
   \]
   
   \[
   z_{i,w,d} \geq \text{trafficMatrix}_{i,d} \times \left( \sum_{d' \in D} y_{i,w,d'} \right) - y_{i,w,d}
   \]

   These constraints ensure that \( z_{i,w,d} \) captures the absolute deviation between the allocated traffic and the expected distribution.

3. **Chi-Squared Constraint:**

   To enforce that the total deviation across all dimensions does not exceed a predefined threshold \( \delta \) for each experiment:

   \[
   \sum_{w \in W} \sum_{d \in D} z_{i,w,d} \leq \delta, \quad \forall i \in I
   \]

4. **Objective Function Adjustment:**

   Incorporate the penalties into the objective function to balance traffic assignment and bias minimization:

   \[
   \max \alpha \sum_{i \in I} \sum_{w \in W} x_{i,w} + \beta \sum_{i \in I} \sum_{w \in W} \sum_{d \in D} y_{i,w,d} - \gamma \sum_{i \in I} \sum_{w \in W} \sum_{d \in D} z_{i,w,d}
   \]

   - \( \gamma \): Weighting factor for penalizing traffic selection bias.

5. **Projection Implementation:**


$f(adset)\rightarrow trafficVector$

$g(adset)\rightarrow Distributions$

$g(f^{-1}(adset))\rightarrow Distributions$

In the NMF setup, $f$ is a linear operation, implemened by a matrix( the $W$ in $N=WH$), so we can directly invert it.
