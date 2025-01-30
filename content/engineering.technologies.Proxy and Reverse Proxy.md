---
id: sr83ehqeiolm9fm149vq7i2
title: Proxy and Reverse Proxy
desc: ""
updated: 2024-12-15T22:35
created: 1657798609937
---
## Forward Proxy

 A proxy server sits in front of some client machines (e.g. you IPS may be a proxy?) and intercepts web requests.

 It then redirects the request to the internet and can do some processing on the response and the request.

### Example  usecase:

 Thus it can help w/ security and generally augment both the request and the response.

## Reverse Proxy

 A reverse proxy is a proxy server that sits in front of some server and intercepts web requests.

 Example use case:

1. Load balancing
   [[engineering.system_design.load balancer]]
2. Caching

