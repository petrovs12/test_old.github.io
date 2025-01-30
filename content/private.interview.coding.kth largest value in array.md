---
id: ijyrmcz46sd53tp28rq2i58
title: Kth Largest Value in Array
desc: ""
updated: 1733566764688
created: 1733566690652
---


https://leetcode.com/problems/kth-largest-element-in-an-array/?fbclid=IwZXh0bgNhZW0CMTEAAR2vmM8vtB-fJp0Dx_iMklv_ZssYgx7EaxYRkaBhJZ1h6MFa2A59J-2y84Y_aem_Rln4x7i9ZMASQdExHOw0Sg

using heapq, but not so fast.
```
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        import heapq
        return heapq.nlargest(k,nums)[k-1]
```
