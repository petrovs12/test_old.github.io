---
id: 0kw337apvegz0u6dqdofs28
title: Multiset Implementation
desc: ""
updated: 1733566553082
created: 1733566500955
---

# Description
Implement a multiset type

# Question Statement
A multiset (also known as a bag) is a mutable, unordered collection of distinct objects that may appear more than once in the collection.



# Implement a multiset that implements the following Swift methods (or Objective-C equivalents):

(sounds like 'couter'  in python)



add(element)
remove(element)
count(for: element)


In swift: 

protocol MutableUnorderedCollection {
  
  associatedType Element
  
  func add(element: Element)
  func remove(element: Element)
  func count(for element: Element) -> Int

}
