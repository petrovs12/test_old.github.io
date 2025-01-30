---
id: 7jtths3n9f5fldmq1stvwf2
title: Default Docker Networks
desc: ""
updated: 2024-12-15T22:35
created: 1657803180290
---
By default, all cockers run 
in the 'Docker network' (?). Maybe.

Quote from educative:

"By default, **all** containers **run** in the **default network space of Docker**. Hence, **every container can communicate** with others. We can create network isolation if it is needed."

![Docker Network View](/assets/images/2022-07-14-15-15-32.png)

By default, 3 networks are created:

# host network

Docker Internal- nevermind

# None Network

Docker Internal- nevermind

# Bridge network

named Docker0; it automatically creates IP subnet and gateway.

 **Containers within the docker network can talk to each other via IP addressing**. They are in the **same subnet**.

