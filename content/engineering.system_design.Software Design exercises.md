---
id: 2zpx76ajrr3y2vvooi7zkte
title: "Exercise 5.1: Strategy Pattern and sales chart display"
desc: ""
updated: 2024-12-15T22:35
created: 1657559251436
---
From [here](https://etutorials.org/Programming/Software+engineering+and+computer+games/Part+I+Software+Engineering+and+Computer+Games/Chapter+5.+Software+design+patterns/Exercises/)

Suppose that you have a cSalesData object with a drawGraph() method. Draw a UML including a few lines of code to show how you could use a Strategy Pattern to select at runtime between drawing a bar graph or a pie graph of the data.

type A<C> = 
    object a: C
    function b: C->1
end

A<C>(a::C,b::C->1) = new A(a,b)
A<C>(a::C) = new A(a,x->{})

execute(a::A) =a.b(a.a)

cSalesData = A(salesData)
cSalesData.b = {...

drawBar
..
} 

Exercise 5.2:
Template Method patterna dn opening diverse file types

Template methd pattern and opening 

