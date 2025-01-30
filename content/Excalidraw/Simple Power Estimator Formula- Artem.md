power estimator- make 
it aware of the days-correction
https://www.internalfb.com/intern/anp/view/?id=4360241

Modify the formula


```
return (

c_events + c_users * days * (1 + d_sqrt / np.sqrt(days)) * (

(4 * (2 * np.exp(-3 * days / t_evolve) + 6 * days / t_evolve - 2)) / (6 * days / t_evolve)**2

)

) / (segments * days)
```

need to can we modify those thing