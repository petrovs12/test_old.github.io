---
id: 5hp389ah3p23qp5l00swhh0
title: LMQL
desc: ""
updated: 2024-12-15T22:35
created: 1689680593676
---
syntaxt

'' where ...

# Clauses

## where clause

specify some constraints on the output

## the main program caluse

Basically we can have some holes inn a text and some python expressions inside, where we're predicting the masked words.

Then as the model is generating stuff according to the strategy, there is a mechanism to enforce the constraints.

How does this work? with partial evaluation.
First note how LLM's generate their output.
Before I thought they generate it trough only a deterministic greedy procedure, but actually they can use
other graph search algorithms, where the log-probablity of the output is the weight function in the inference graph. So they can do beam search, greedy search, etc.

As they go they know what variable is being 'generated' at the moment. This variable has some current value and on the basis of this one can say if the variable is violating some constraints. If yes, the search procedure can backtrack. If not, it can continue, while also knowing if the variable can have something added to it, or not.
I think these are generated as 'follow' and 'fin' nodes in the graph for a particular variable.

Examples:
If a var is constrained to be in a list (e.g. 'positive' or 'negtive') that can work in an obvious way..

other things...

It saves 26-60% ofthe cost, but sort of a 'normal amound', as it can cut off unsatisfiable branches.

quite flexeble with the constraints, have to learn more about the syntax...
There was this syntax 

```
sample(temperature=1.2)
"A few things not to forget when going to the sea (not travelling):\n "
"-[THING]" where stops_at(thing,"\n")
"-[THING]" where stops_at(thing,"\n")
"-[THING]" where stops_at(thing,"\n")
"-[THING]" where stops_at(thing,"\n")
```

where 'thing' is not the same everywhere.

Quite good at enforxing consistency, eg.g by a clause like:

```
"A few things not to forget when going to the sea (not travelling):\n "
```

### It's also included in LangChain

As we've geneRated the partial outpud

## decoder clause

Specity the decoding algorithm to use,
can be sample, argmax/or other stuff, like beam or best_k

Beam, argmax.
,
sample, beam_sample, beam_var,...

## from clause

specify the model to use

# Related work

### Language Model Programming

All sorts of chain-of-thought and similar things can be considered as part of language model programming...

Chain of thought prompting, tree of thought, and others are all part of this and instantiations of it.

