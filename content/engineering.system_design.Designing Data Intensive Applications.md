---
id: 9srfjlyhbntoriulb0p71u3
title: Storage and Retrieval
desc: ""
updated: 2024-12-15T22:35
created: 1646778662999
---
These are nots from the Designing Data Intensive Applications book.

Big difference between storage engines, optimized for analytics, and ones optimized for transactional workloads.

one can use auxilary [[science.CS.algos.Data Structures.Bloom Filters]] in cases where not finding key would take long time.

## Hash indices

Keep the offset

- only append to file
- tombstone is a special value, indicating that the key is deleted
- to optimize: 
  use fixed- size segments, periodically compact (removing duplicates) and merge them 

Limitations: no range queries.

## Apend, split into segments

keep segments sorted, compactify segments.

# SSTables and LSM trees

Require that the sequence of key value records is sorted by key always.
In-memory memtable, implemented as self-balancing tree.
When grows, write it to disk as a segment.

Find record: 

1. try the memtable.
2. if not found, try the disk segments in order of recency.

Handle crash by writing simultaneously to disk as well as the memtable.

### Merge and compact

On schedule, compact and merge the disk segments.

This is how lucene works, roughly.

**Range queries ** are supported ,as keys are kept sorted.

# B-tree indices

B-trees are much more wildly used than lsm trees, but latter are promising.

Very similar to other balanced trees

# Summary

 LSM trees might be faster to write, as it's just sequential writes...
 Look at pages 82-83 of the book.

# Secondary keys

 they are not unique, but crucial for performance of joins and such.
 can append row id to the row to make it unique and use either b-tree or lsm tree. Another way is to make the values lists of matching row identifiers.

# Multi-dimensional indices

## Latitude and longitude

 in a geographical ocntext, we would like to see all locations within a lat-lon grid...

 One option is to translate a two-dimensional location into a single number using a **space-filling curve**, and then to use a regular B-tree index [28]. More commonly, spe‐
cialized spatial indexes such as R-trees are used. For example, PostGIS implements
geospatial indexes as R-trees using PostgreSQL’s Generalized Search Tree indexing
facility [29]. We don’t have space to describe R-trees in detail here, but there is plenty
of literature on them.

# In-memory databases

Redis, Memcached
[[engineering.system_design.Caching.Redis and Memcached]]
when restarted, Memcached would reload state from disk or over network. Disk is used only for an appen0donly log, which we use in case of crash/resta

