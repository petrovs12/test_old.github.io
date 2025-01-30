---
id: bfbflal1lgufkpcm9iuq6gm
title: CD Command
desc: ""
updated: 1733566348074
created: 1733566252398
---


# Description
WARNING: This question is on Leetcode: https://leetcode.com/discuss/interview-question/553454/facebook-phone-change-working-directory



Implement a mock of cd (change directory) command on Unix. The code doesn't have to change actual directories, just return the new path after cd was executed.



The function takes two arguments (current working directory and directory to change to), and returns the output directory as if cd command was executed. There's no filesystem underneath; all paths are valid.


# Question Statement
Example table of inputs and outputs:



| cwd      | cd (arg)       | output
| -------- | -------------- | ------
| /        | foo            | /foo
| /baz     | /bar           | /bar
| /foo/bar | ../../../../.. | /
| /x/y     | ../p/../q      | /x/q
| /x/y     | /p/./q         | /p/q


This covers almost all situations except blank arg (I tell them that won't happen; on Unix, that means "go to $HOME", and $HOME isn't defined here, and two slashes next to one another (I also won't expect them to handle this; Unix treats it as a single slash).


The examples cover the following cases:

First: simple append
Second: absolute paths
Third: Root is its own parent. Avoid saying "stack underflow" here; the candidate should figure out that they need a stack on their own.
Fourth: Editing cwd. This is to push the candidate towards realizing they need to edit cwd (or a copy of cwd) in place
Fifth: Absolute path with relative elements. This is to prevent candidates from short-circuiting on absolute paths. You still have to process them.



# Analysis

## Good solutions

Good solutions use platform string-split library, use a stack, and are careful to return / when the stack is empty (not just the empty string).

oGood candidates should take under 20 minutes.

## iffy solutions 
recursion'
