---
id: yc0qsi8wt4uhls623ittnrx
title: oncall runbook
desc: ""
updated: 2024-12-15T22:35
created: 1717947510212
---
## sev investigation runbook - last update mar 7, 2023

is it up to date?
does it have anything on how the configs work?
it has a lot about supply/demand

 the split setup is now being done automatically, without manual set oup of the splits;
how to cover the supply/demand study cases?

TODO dates are sort of out of date...

TODO frontend experiment consistency- affected in any way by recent changes?

TODO backend experiment consistency - is it affected in any way by recent changes?

check budget qrt configs...

have to also check if hte new process for rolling htem out?? does this matter?
how to investigate a sev now with the new rollout procefss...

# mchleck code/treatment changes...

### set of killswitches, are they current?/

## first oncall page- updated on 6.08.2023

  this is just scheduling stuff.

## BQRT sev recovery/killswitches

killswitches...

frontend www assigns users to full versions or cs(doesnt know about versions)

baceend- fbcode, delivery systems. Assigns versions to individual cs experiments and versions.
Assigns users to budgets according to theirfull bqrt or cs versions...

* * *

last test of killswitches in production - 23.08.2021

TODO- did we do killswitch testing at any point after that???

* * *

Note that ' kill baceend conflisct, put bigger font/colors'....

* * *

