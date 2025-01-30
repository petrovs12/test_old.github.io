---
id: e507yizs3r5n59lxjcz1oz8
title: Rectangle Contains
desc: ""
updated: 1733566220548
created: 1733566070234
---

# Problem Statements

We will have the candidate implement the commonly used Core Geometry APIs.
CGRectContainsRect(rect1: CGRect, rect2: CGRect)
CGRectEqualsRect(rect1: CGRect, rect2: CGRect)
This boils down to having the candidate devise an algorithm to detect if one rectangle “contains” another, and if two rectangles equal each other (identity case).

Time & Difficulty
This is a warm-up easy question. Any combination can be asked. We can have the candidate simply implement one of the above APIs or have the candidate implement both. This question is designed to be a bit flexible for higher difficulty follow-up questions that require a majority of the interview time (30+ minutes), or if interviewer is running out of time.
CGRectContainsRect → Easy (5–10 minutes)
CGRectEqualsRect → Easy (3–5 Minutes)
Asking both questions → Easy (~10–15 minutes)
Asking "Follow Up Question" → Medium (~20–25 minutes)

# Follow Up Question
Have the candidate extend their CGRectContainsRect() solution to handle negative width & height values. This is actually possible in UIKit, CGSize of a CGRect can contain negative width & height values. 

The solution to this problem is to understand that “CGRect(x: 5, y: 5, width: 50, height: 50)” and “CGRect(x: 55, y: 55, width: -50, height: -50)” are equivalent to one another. This is equivalent to “translating” or “normalizing” the rectangle origin, so that the width and height values can be expressed and treated as positive. Once this is done, the problem reduces itself to detecting if CGRectContainsRect() for the positive width/height case only. Matter of fact, this is exactly how UIKit treats negative CGRect width & height values in the layout pass.

