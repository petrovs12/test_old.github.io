---
id: l6w5ujetn2aypjdb92w5grw
title: Evaluate Arithmetic Expression
desc: ""
updated: 1733566622553
created: 1733566608512
---


Description
Implement a multiset type

Question Statement
A multiset (also known as a bag) is a mutable, unordered collection of distinct objects that may appear more than once in the collection.



Implement a multiset that implements the following Swift methods (or Objective-C equivalents):


```
add(element)
remove(element)
count(for: element)
````

In swift: 
```
protocol MutableUnorderedCollection {
  
  associatedType Element
  
  func add(element: Element)
  func remove(element: Element)
  func count(for element: Element) -> Int

}
```
