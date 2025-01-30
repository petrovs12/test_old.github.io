---
id: 49xcl19in5182wvpute8s94
title: Estimating Unobserved Demand Inefficiencies
desc: ''
updated: '2024-10-07T09:34'
created: '2024-10-07, 09:33'
tags:
  - excalidraw
  - type/sketchnote
  - type/note
  - theme/xyz
excalidraw-plugin: parsed
aliases: null
lead: +++ Lead paragraph goes here +++
visual: '![[image.jpg]]'
modified: '2024-10-07, 09:33'
template_type: Note
template_version: '1.27'
---
<!--  See "Template Help" below for using properties -->

<div class="mermaid">
  sequenceDiagram
    participant User
    participant System

    loop Booking
    User-&gt;&gt;System: Book Experiments

    rect rgb(180,0,0)
    System--&gt;&gt;User: Charge Extra Quota
    System--&gt;&gt; User: Run Experiment
    User-&gt;&gt;System: Demand Delayed Due to Missing Quota
    User-&gt;&gt;User: Forget/Invalidate Ideas
    User-&gt;&gt;User: Demand is Lost
    end
    System--&gt;&gt;User: Return Quota
    end
</div>

<!--  Most essential idea from "lead"-key  in properties section -->

In CSBQRT, at the moment the quota accounting process charges quota as a user books an experiment, but this quota charging is unaware of the actual traffic the experiment will receive. This varies batch by batch. Rather, we charge on the full traffic ask. Then, we run the experiment and at the end we return the unused quota. This effecitevly loses some quota. However, the actual inefficiency is hard to quantify.

One KPI would be 'quota days lost', which we may use directly. However, whether this actually prevents experiments from being ran, or simply creates nuisance for the user is hard to quantify (EYS vs supply). One can imagine a world where a user can instantly see the new quota and make optimal decisions on the basis of it.

This note hypothesises a plausible simple model of how demand is created via an autoregressive process, in which users:

1. Create Demand by generating ideas
2. Book experiments, based on their current demand and quota projections till the end of the period(year)
3. Forget/Invalidate ideas in alternative ways, if the demand is not fulfilled.

Then we introduce the system inefficiency above and try to estimate the inefficiency in terms of quota days lost and other kpi's.

The model can easily be extended to model e.g. losses via other mechanisms, e.g. the severe quota allocation delays in 2024.

This is an RFC. There is a prototype implementation of the model in pyro (in appendix).

## Model

  • Idea Generation Rate ($\lambda$): The rate at which new ideas (demand) are generated.
  • Forgetting Rate ($\phi$): The rate at which unfulfilled demand decays over time.
  • Quota Management: Quota is consumed when experiments are scheduled and partially returned after a delay.

  Parameters

  • $\lambda$: Idea generation rate.

  $\lambda \sim \text{Gamma}(\alpha_\lambda, \beta_\lambda)$

  • $\phi$: Forgetting rate.

  $\phi \sim \text{Beta}(\alpha_\phi, \beta_\phi)$

  • $Q_{\text{total}}$: Total quota for the period.
  • $I_0$: Initial accumulated demand (known and fixed).

  Variables

  • $\delta I_t$: New ideas generated at time $t$.
  • $I_t$: Accumulated demand at time $t$.
  • $Q_t$: Available quota at time $t$.
  • $E_t$: Experiments scheduled at time $t$.
  • $R_t$: Quota returned at time $t$.
  • $\text{DemandLost}_t$: Demand lost at time $t$ due to quota limitations.

  Data Generation Steps

1. Initialization

   • Set initial demand:

   $I_0 = \text{Known constant (e.g., } 10.0\text{)}$

   • Set initial quota:

   $Q_0 = Q_{\text{total}}$

   • Initialize quota return schedule:

   $R_t = 0 \quad \forall t \in \{1, 2, \dots, T\}$

2. Time Loop (for $t = 1$ to $T$)

   At each time step $t$:

   a. Generate New Ideas

   • Idea generation:

   $\delta I_t \sim \text{Poisson}(\lambda)$

   New ideas are generated following a Poisson distribution with rate $\lambda$.

   b. Update Accumulated Demand

   • Incorporate forgetting and quota returned:

   $I_t = (1 - \phi) \cdot I_{t-1} + \delta I_t + R_t$

   Accumulated demand decreases by a forgetting factor $\phi$, adds new ideas $\delta I_t$, and includes any quota returned $R_t$.

   c. Update Available Quota

   • Add returned quota:

   $Q_t = Q_{t-1} + R_t$

   d. Compute Potential Experiments

   • Potential experiments per remaining periods:

   $E_{\text{potential}} = \frac{I_t}{T - t + 1}$

   • Quota per remaining periods:

   $Q_{\text{per\_period}} = \frac{Q_t}{T - t + 1}$

   e. Schedule Experiments

   • Determine experiments to schedule:

   $E_t = \min\left( E_{\text{potential}},\ Q_{\text{per\_period}} \right)$

   Schedule experiments based on demand and available quota per remaining periods.

   f. Update Quota After Scheduling

   • Quota consumed:

   $Q_t = Q_t - E_t \cdot (T - t + 1)$

   g. Simulate Quota Return

   For each scheduled experiment:

   • Random delay until quota return:

   $D_k \sim \text{UniformInteger}(1, 4)$

   • Random return fraction:

   $R_k \sim \text{Uniform}(0, 0.9)$

   • Quota return time:

   $t_{\text{return}} = t + D_k$

   • Schedule quota return:

   $\text{If } t_{\text{return}} \leq T, \quad R_{t_{\text{return}}} = R_{t_{\text{return}}} + R_k \cdot \text{Cost per Experiment}$

   h. Compute Demand Lost Due to Quota Limitations

   • Potential total experiments:

   $\text{TotalPotential}_t = E_{\text{potential}} \cdot (T - t + 1)$

   • Actual total experiments scheduled:

   $\text{TotalScheduled}_t = E_t \cdot (T - t + 1)$

   • Demand lost at time $t$:

   $\text{DemandLost}_t = \max\left( 0,\ \text{TotalPotential}_t - \text{TotalScheduled}_t \right)$

   i. Update Variables for Next Time Step

   • Update accumulated demand:

   $I_{t} \text{ (from step b)}$

   • Update available quota:

   $Q_{t} \text{ (from step f)}$

3. End of Period Calculations

   • Total demand lost due to quota limitations:

   $\text{TotalDemandLost} = \sum_{t=1}^{T} \text{DemandLost}_t$

   • Quota unspent at end of period:

   $\text{QuotaUnspent} = Q_T$

   Explanations

   • Idea Generation ($\delta I_t$): Models the random arrival of new ideas using a Poisson distribution, reflecting variability in idea generation.

   • Forgetting Mechanism ($\phi$): Represents the rate at which unfulfilled demand decays, capturing the tendency to forget or discard old ideas.

   • Accumulated Demand ($I_t$): The net demand at time $t$, considering forgetting, new ideas, and influence of returned quota.

   • Quota Management ($Q_t$): Tracks the available quota, accounting for consumption by scheduled experiments and replenishment from returned quota.

   • Experiment Scheduling ($E_t$): Determines the number of experiments that can be scheduled based on current demand and quota constraints.

   • Quota Return Simulation: Models the delayed return of quota from experiments, introducing uncertainty in future quota availability.

   • Demand Lost ($\text{DemandLost}_t$): Quantifies unmet demand due to quota limitations, representing potential missed opportunities.

   • Total Demand Lost: Aggregates demand lost over the entire period, serving as a key performance indicator (KPI) for system efficiency.

   Note: The parameters $\lambda$ and $\phi$ are subject to inference in a Bayesian framework, using observed data on idea generation, demand accumulation, and quota usage. This model captures the dynamics of experiment scheduling and resource allocation, providing insights into system performance and areas for optimization.

> [!Note]
> `= this.lead`

**Supporting Content**

<!-- Supporting content in tail of my note  -->

-

```python
import torch
import pyro
import pyro.distributions as dist
from pyro.infer import SVI, Trace_ELBO
from pyro.optim import Adam
import numpy as np
import matplotlib.pyplot as plt

# Set random seed for reproducibility
pyro.set_rng_seed()

# True parameters for data generation
lambda_true = 3.0     # True idea generation rate
phi_true = 0.05        # True forgetting rate
T = 50                # Total time periods
Q_total = 100.0       # Total quota for the period

# Initialize variables
I_prev = 10.0       # Initial accumulated demand (known and fixed)
Q_prev = Q_total    # Initial available quota
scheduled_experiments = []  # List to keep track of experiments and their return times

# Lists to store generated data
delta_I = []               # New ideas generated at each time
I = []                     # Accumulated demand at each time
Q = []                     # Available quota at each time
E = []                     # Experiments scheduled at each time
E_obs = []                 # Observed experiments
Q_obs = []                 # Observed available quota
quota_returned_list = []   # Quota returned at each time
demand_lost_due_to_quota = []  # Demand lost due to quota limitations

for t in range(T):
    # Step 1: Generate new ideas using Poisson distribution
    delta_I_t = np.random.poisson(lam=lambda_true)
    delta_I.append(delta_I_t)
    
    # Step 2: Collect quota returned at time t from previous experiments
    quota_returned = 0.0
    experiments_to_remove = []
    for exp in scheduled_experiments:
        if exp['return_time'] == t:
            quota_returned += exp['return_fraction'] * exp['cost']
            experiments_to_remove.append(exp)
    
    # Remove experiments that have returned quota
    for exp in experiments_to_remove:
        scheduled_experiments.remove(exp)
    
    quota_returned_list.append(quota_returned)
    
    # Step 3: Update accumulated demand with forgetting and quota returned
    I_t = (1 - phi_true) * I_prev + delta_I_t + quota_returned
    I.append(I_t)
    
    # Step 4: Update available quota with quota returned
    Q_t = Q_prev + quota_returned
    
    # Step 5: Compute scheduled experiments
    E_t = min(I_t / (T - t + 1), Q_t / (T - t + 1))
    E.append(E_t)
    
    # Step 6: Compute cost and update available quota
    Cost_t = E_t
    Q_t = Q_t - Cost_t
    Q.append(Q_t)
    
    # Step 7: For each scheduled experiment, record its return time and fraction
    num_experiments = int(E_t) if E_t >= 1 else 1
    for i in range(num_experiments):
        # Random delay between 1 and 4
        D_k = np.random.randint(1, 5)  # Random integer between 1 and 4 inclusive
        # Random return fraction between 0 and 0.9
        R_k = np.random.uniform(0, 0.9)
        # Return time
        t_k_return = t + D_k
        # Ensure return time is within the time horizon
        if t_k_return < T:
            scheduled_experiments.append({
                'return_time': t_k_return,
                'return_fraction': R_k,
                'cost': Cost_t / num_experiments  # Distribute cost evenly
            })
    
    # Step 8: Record observed scheduled experiments and available quota
    E_obs.append(E_t)
    Q_obs.append(Q_t)
    
    # Step 9: Compute demand lost due to quota limitations
    potential_E_t = I_t / (T - t + 1)
    demand_lost_t = potential_E_t - E_t
    demand_lost_due_to_quota.append(max(0.0, demand_lost_t))
    
    # Step 10: Update previous values for next iteration
    I_prev = I_t
    Q_prev = Q_t

# Convert observed data to PyTorch tensors
E_obs = torch.tensor(E_obs, dtype=torch.float)
Q_obs = torch.tensor(Q_obs, dtype=torch.float)
delta_I_obs = torch.tensor(delta_I, dtype=torch.long)  # Use long dtype for Poisson
quota_returned_list = torch.tensor(quota_returned_list, dtype=torch.float)

# Define the Pyro model
def model(E_obs, Q_obs, delta_I_obs, quota_returned_list):
    # Priors for lambda (idea generation rate) and phi (forgetting rate)
    lambda_ = pyro.sample('lambda', dist.Gamma(2.0, 1.0))
    phi = pyro.sample('phi', dist.Beta(2.0, 2.0))
    
    # Initial accumulated demand is known and fixed at 10
    I_prev = 10.0
    
    # Initial available quota (known constant)
    Q_prev = Q_total
    
    T = len(E_obs)
    
    for t in range(T):
        # delta_I_obs[t] ~ Poisson(lambda_)
        pyro.sample(f'delta_I_obs_{t}', dist.Poisson(lambda_), obs=delta_I_obs[t])
        
        delta_I_t = delta_I_obs[t]
        
        # Quota returned is observed
        quota_returned = quota_returned_list[t]
        
        # Update accumulated demand with forgetting and quota returned
        I_t = (1 - phi) * I_prev + delta_I_t + quota_returned
        
        # Update available quota with quota returned
        Q_t = Q_prev + quota_returned
        
        # Ensure I_t and Q_t are positive
        I_t = torch.clamp(I_t, min=0.0)
        Q_t = torch.clamp(Q_t, min=0.0)
        
        # Compute scheduled experiments
        E_t_model = torch.min(I_t / (T - t + 1), Q_t / (T - t + 1))
        E_t_model = torch.clamp(E_t_model, min=0.0)
        
        # Observe E_obs[t] with a small epsilon
        epsilon = 1e-3
        pyro.sample(f'E_obs_{t}', dist.Normal(E_t_model, epsilon), obs=E_obs[t])
        
        # Update previous I and Q
        I_prev = I_t
        Q_prev = Q_t - E_obs[t]

# Define the guide (variational distribution) for SVI
def guide(E_obs, Q_obs, delta_I_obs, quota_returned_list):
    # Variational parameters for lambda_
    lambda_alpha_q = pyro.param('lambda_alpha_q', torch.tensor(3.0), constraint=dist.constraints.positive)
    lambda_beta_q = pyro.param('lambda_beta_q', torch.tensor(1.0), constraint=dist.constraints.positive)
    pyro.sample('lambda', dist.Gamma(lambda_alpha_q, lambda_beta_q))
    
    # Variational parameters for phi
    phi_alpha_q = pyro.param('phi_alpha_q', torch.tensor(3.0), constraint=dist.constraints.positive)
    phi_beta_q = pyro.param('phi_beta_q', torch.tensor(3.0), constraint=dist.constraints.positive)
    pyro.sample('phi', dist.Beta(phi_alpha_q, phi_beta_q))

# Set up the optimizer for SVI
optimizer = Adam({'lr': 0.005})

# Set up the loss function for SVI
elbo = Trace_ELBO()

# Initialize SVI object
svi = SVI(model, guide, optimizer, loss=elbo)

# Number of training iterations
num_iterations = 3000

# Lists to store loss values
losses = []

# Perform variational inference
for i in range(num_iterations):
    loss = svi.step(E_obs, Q_obs, delta_I_obs, quota_returned_list)
    losses.append(loss)
    if i % 100 == 0:
        print(f"Iteration {i}, Loss: {loss:.2f}")

# Extract the estimated parameters
lambda_alpha_q = pyro.param('lambda_alpha_q').item()
lambda_beta_q = pyro.param('lambda_beta_q').item()
lambda_estimate = lambda_alpha_q / lambda_beta_q

phi_alpha_q = pyro.param('phi_alpha_q').item()
phi_beta_q = pyro.param('phi_beta_q').item()
phi_estimate = phi_alpha_q / (phi_alpha_q + phi_beta_q)

# Print the estimated parameters and compare with true values
print(f"\nEstimated lambda (idea generation rate): {lambda_estimate:.2f}")
print(f"True lambda: {lambda_true}")
print(f"Estimated phi (forgetting rate): {phi_estimate:.2f}")
print(f"True phi: {phi_true}")

# Plot the loss over iterations
plt.figure(figsize=(8, 4))
plt.plot(losses)
plt.xlabel('Iteration')
plt.ylabel('ELBO Loss')
plt.title('ELBO Loss over Iterations')
plt.show()

# Corrected code for calculating demand lost due to quota limitations
# Initialize arrays to store KPIs
demand_lost_samples = []
quota_unspent_samples = []
quota_days_lost_samples = []

num_samples = 5000  # Number of samples to draw from the posterior

for _ in range(num_samples):
    # Sample lambda and phi from variational posterior distributions
    lambda_sample = dist.Gamma(lambda_alpha_q, lambda_beta_q).sample()
    phi_sample = dist.Beta(phi_alpha_q, phi_beta_q).sample()
    
    # Initialize variables for this simulation
    I_prev = 10.0  # Starting from the known initial accumulated demand
    Q_prev = Q_total  # Starting quota
    unmet_demand = 0.0
    total_demand = 0.0
    quota_unspent = 0.0
    quota_days_lost = 0.0
    
    for t in range(T):
        # Sample delta_I_t
        delta_I_t = np.random.poisson(lam=lambda_sample.item())
        
        # Quota returned is observed
        quota_returned = quota_returned_list[t].item()
        
        # Update available quota with quota returned
        Q_t = Q_prev + quota_returned
        
        # Update accumulated demand with forgetting and quota returned
        I_t = (1 - phi_sample.item()) * I_prev + delta_I_t + quota_returned + unmet_demand
        
        # Ensure I_t and Q_t are positive
        I_t = max(I_t, 0.0)
        Q_t = max(Q_t, 0.0)
        
        # Compute potential experiments that could be scheduled
        potential_E_t = I_t / (T - t + 1)
        # Compute actual experiments schedule
        E_t = min(potential_E_t, Q_t / (T - t + 1))
        E_t = max(E_t, 0.0)
        
        # Update unmet demand
        actual_E_t = E_t * (T - t + 1)
        unmet_demand = max(0.0, I_t - actual_E_t)
        
        # Update quota not used in this time step
        actual_quota_used = E_t * (T - t + 1)
        quota_not_used = Q_t - actual_quota_used
        quota_days_lost += quota_not_used  # Accumulate quota days lost
        
        # Update cumulative demand
        total_demand += delta_I_t
        
        # Update previous I and Q
        I_prev = I_t - actual_E_t  # Remaining demand carries over
        Q_prev = Q_t - actual_quota_used  # Remaining quota carries over
    
    # At the end of the period
    # Demand lost due to quota limitations is any remaining unmet demand
    demand_lost_total = unmet_demand
    
    # Quota unspent at the end of the period
    quota_unspent_end = Q_prev
    
    # Store the KPIs
    demand_lost_samples.append(demand_lost_total)
    quota_unspent_samples.append(quota_unspent_end)
    quota_days_lost_samples.append(quota_days_lost)

# Convert to tensors
demand_lost_samples = torch.tensor(demand_lost_samples)
quota_unspent_samples = torch.tensor(quota_unspent_samples)
quota_days_lost_samples = torch.tensor(quota_days_lost_samples)

# Compute statistics
mean_demand_lost = demand_lost_samples.mean().item()
std_demand_lost = demand_lost_samples.std().item()

mean_quota_unspent = quota_unspent_samples.mean().item()
std_quota_unspent = quota_unspent_samples.std().item()

mean_quota_days_lost = quota_days_lost_samples.mean().item()
std_quota_days_lost = quota_days_lost_samples.std().item()

print(f"\nDemand Lost KPI:")
print(f"Mean demand lost due to quota limitations: {mean_demand_lost:.2f}")
print(f"Standard deviation: {std_demand_lost:.2f}")

print(f"\nQuota Unspent at End of Period:")
print(f"Mean quota unspent: {mean_quota_unspent:.2f}")
print(f"Standard deviation: {std_quota_unspent:.2f}")

print(f"\nQuota Days Lost:")
print(f"Mean quota days lost: {mean_quota_days_lost:.2f}")
print(f"Standard deviation: {std_quota_days_lost:.2f}")

# Plot histogram of demand lost samples
plt.figure(figsize=(8, 4))
plt.hist(demand_lost_samples.numpy(), bins=30, density=True, alpha=0.7)
plt.xlabel('Demand Lost Due to Quota Limitations')
plt.ylabel('Density')
plt.title('Distribution of Demand Lost KPI')
plt.show()

# Plot histogram of quota unspent at the end of period
plt.figure(figsize=(8, 4))
plt.hist(quota_unspent_samples.numpy(), bins=30, density=True, alpha=0.7)
plt.xlabel('Quota Unspent at End of Period')
plt.ylabel('Density')
plt.title('Distribution of Quota Unspent')
plt.show()

# Plot histogram of quota days lost
plt.figure(figsize=(8, 4))
plt.hist(quota_days_lost_samples.numpy(), bins=30, density=True, alpha=0.7)
plt.xlabel('Quota Days Lost')
plt.ylabel('Density')
plt.title('Distribution of Quota Days Lost')
plt.show()

```

* * *

# Back Matter

**Source**

<!-- Always keep a link to the source- --> 

- based_on::

**References**

<!-- Links to pages not referenced in the content. -->

-

**Terms**

<!-- Links to definition pages. -->

-

**Target**

<!-- Link to project note or externaly published content. -->

-

**Tasks**

<!-- What remains to be done with this note? --> 

-

**Questions**

<!-- What remains for you to consider? --> 

-

**Template Help**

<!-- Links to external help pages on GitHub. -->

- [Basic Template Structure](https://github.com/groepl/Obsidian-Templates#basic-template-structure)
- [How to Use Links](https://github.com/groepl/Obsidian-Templates#how-to-use-links)
- [How to Use Tags](https://github.com/groepl/Obsidian-Templates#how-to-use-tags)
- [How to Search Notes](https://github.com/groepl/Obsidian-Templates#how-to-search-notes)
- [Plugins Needed](https://github.com/groepl/Obsidian-Templates#obsidian-plugins-needed)
- [Find Latest Updates](https://github.com/groepl/Obsidian-Templates)

==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

## Drawing

```compressed-json
N4IgLgngDgpiBcIYA8DGBDANgSwCYCd0B3EAGhADcZ8BnbAewDsEAmcm+gV31TkQAswYKDXgB6MQHNsYfpwBGAOlT0AtmIBeNCtlQbs6RmPry6uA4wC0KDDgLFLUTJ2lH8MTDHQ0YNMWHRJMRZFAFZFAEYyJE9VGEYwGgQAbQBdcnQoKABlALA+UEl8PGzsDT5GTkxMch0YIgAhdFQAayKuRlwAYXpMenwEEABiADMx8ZAAX0mgA
```

%%

