---
id: 2j2y4ecryqeiqyc5jz123h3
title: S438909 Refactor scheduler code which performs quota validations to do it once
desc: ""
updated: 2024-12-15T22:35
created: 1732207269422
---


## Criticality: Critical

This task is Critical because it must be addressed ASAP as this is an active issue and affect rollout

  

## Description

[https://fburl.com/code/i839jsvs](https://fburl.czom/code/i839jsvs) performs validation by throwing exceptions. This means we treat system exceptions with user errors (e.g missing quota). This means we will wrongly push back experiments due to system failures (e.g with ELMS).



## Notes
genValidateResourcesAvailability is called by  


![[Pasted image 20240909124434.png]]


![[Pasted image 20240909125324.png]]

Scheduler2::genRunInstance
CSBQRSchedulerAllocator::genAllocate
CSBQRSchedulerAllocator::genValidateCandidateForTheBatch
CSBQRSchedulerAllocator::genValidateResourcesAvailability()

-----

### Where are the estimation results coming'from
![[Pasted image 20240909125725.png]]

  private async function genGetImpCount(
  this gets impression count from scuba!!!
      await $this->genValidateResourcesAvailability($candidate, $imp_count),
      this is still from scuba


### figure out the resource account

    $resource_account = monocle_entity_inventory_ResourceAccount::getNames()[
      $sched_exp->getResourceAccountV2()
    ];
    try {
      await BQRTResourceManager::genValidateCSBQRTRequest(
        $duration,
        $requested_pct,
        $resource_account,
      );

```genValidateCSBQRTRequest
```
