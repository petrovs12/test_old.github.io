---
id: 6flhwc9tqghaksyo1p45v7z
title: ent fields and code generation
desc: ""
updated: 2024-12-15T22:35
created: 1729948081258
---
[[engineering.system_design.SQL Databases]]
[[engineering.technologies.Object Relational Mapping]]

The Ent framework is hthe object relational mapping, used in Meta, and in some other places.

<div class="mermaid">
  graph TD;
EntFields--&gt; RelationalColumns
EntSchema--&gt;B['Create Table']
EntEdges--&gt;FKS['Foreign Key']
EntMutator--&gt;CRUD['Insert, Update, Delete']
EntActions--&gt;SP['Stored Procedures or triggers']
EntActions--"are build upon"--&gt;EntMutator
EntObservers --'similar to'--&gt; SP
EntMutator --&gt; Changeset
Changeset--&gt; Execute
Changeset --&gt; View
Changeset --&gt; Modify
Changeset --&gt; Stuff["Apply additional logic (e.g. validation)"]

</div>

the framework takes the schema, and generates a bunch of code for you, namely methods that do:

- selects
- CRUD operations

# Mutators

bulid mutation;
execute

- Changesed

# Triggers

There are triggers like:
uponUpdate, do xx

# Observers

<div class="mermaid">
  flowchart TB

classDef decision fill:#ffffe0
classDef top fill:#f0f8ff
classDef result fill:#90ee90

G(What's your goal?):::top

M1{{"Does the additional 
 mutation need data that's 
 only available after the 
 main mutation is done?"}}:::decision 

M2{{"Does it matter if the main 
 mutation succeeds but the 
 Observer fails due to
 exceptions, timeout, etc.?"}}:::decision

Trigger[Triggers]:::result
Critical[Critical Observers]:::result
Observer[Regular Observers]:::result

G --&gt;|Perform additional 
EntMutations| M1
G --&gt;|Add logging, 
run async jobs,
or other 
non-EntMutation logic| Observer
M1 --&gt;|Yes| M2
M1 --&gt;|No| Trigger
M2 --&gt;|Yes| Critical
M2 --&gt;|No| Observer
</div>

# Patterns

Reusable piece of funcitonality, like hack trait.

[[science.cs.languages.hack]]

ents provide no inheritance at all, so the patters are a way to provide some kind of inheritance.

