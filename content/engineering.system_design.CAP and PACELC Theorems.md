---
id: t5788torxmxky9tto6jf95n
title: CAP theorem
desc: ""
updated: 2024-12-15T22:35
created: 1643138564603
---
## Availability

everyone can read and write at the same time

## Consistency

if you and I both read some data, it will be the same.

## Partition tolerance

the system works well across physical network partitions.

Examples with a physical notebook- we all write some data for family finances in a  notebook. 
I have a notebook now and I put it on the camina. Now, a database system would be:
Who's allowed to write in nb . What are the allowed to write?
What constraints, like you can't write that I have 100000 usd;
What happens if 2 peoiple try to write simultaneously?

Cap theorem- pick 2

# PACELC Theorems

 In case of Partitionin one has to choose between availability and consistency,
 else (normal operations) between latency and consistency (in the sense of data consistency).

