---
id: 3i536ovnuyix0de329yepuq
title: Docker Compose
desc: ""
updated: 2024-12-15T22:35
created: 1657802582247
---
Tool to combine and run multiple related containers with single command and define their dependencies reasonably...

Syntax:

```
services:
 service 1:
    image: image1
    ports:
     - "80:80"
     - "443:443"
    volumes:
     - /var/www/html:/var/www/html
    links:
     - service 2
     - service 3
service 2:
    build: . # path to dockerfile
    ports:
     - "80:81"
     - "443:444"
    links:
     - service 1

```

## Clauses

### Build or Image

 \-- path to the dockerfile, or image name (from the repository, I guess), respectfully.

### Ports

 \-- Mapping of container ports to host ports.
 \-- Creates a tunnel
 \-- Same as using the -p 5000:5001 flag in `docker run`.

### Volumes

 same as the -v option in `docker run`. Used to mount disks.

### Links

 Link in the ![[engineering.technologies.DevOps.Bridge Network]]

```


# Docker Swarm



# Docker Security and Nginx
```

