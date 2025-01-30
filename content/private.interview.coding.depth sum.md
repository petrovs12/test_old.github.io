---
id: 9okmgdjfdk7j15k0q11isk2
title: Depth Sum
desc: ""
updated: 1733567274288
created: 1733567091452
---


https://leetcode.com/problems/nested-list-weight-sum/

```
class Solution:
    def depthSum(self, nestedList: List[NestedInteger]) -> int:
        k=1
        def ds(lst:List[NestedInteger],k:int):
            if not lst:
                return 0
            return sum(
                (
                    k*el.getInteger() if el.getInteger() else
                    ds(el.getList(),k+1)
                ) for el in lst
            )
        return ds(nestedList,1)
```
