---
id: j9zu91f2fr78iz7ux7iop10
title: Story Bumping in Feed
desc: ""
updated: 1733573229985
created: 1733573198356
---



# Description
Story Bumping In Feed is a Ninja interview question which tests knowledge of basic data structures and how they interact with a table view API. It can give good signal on iOS SDK experience and performance intuition.

# Question Statement
## The Problem
Let's implement iOS News Feed! Part of it anyway.

In the Facebook for iOS app, you can pull to refresh to load new stories. Some stories may already be visible in the feed but the server could decide that something interesting has changed (a friend commented) and they should be shown at the top of feed again. This is called story bumping.

We'll go and implement this in a couple of stages (explain stage-by-stage as the candidate implements them):

## Implement stories being loaded from the top
Remove stories already present in the feed that are duplicates of the ones newly loaded
Animate stories being moved, added and removed, using specific index path mutations instead of `reloadData`
For the first 2 stages, we'll tell the candidate they can use UITableView's reloadData and not worry about fine-grained updates. Don't suggest it yourself immediately though, having a candidate bring this up is a good signal of perf knowledge.
