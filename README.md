# MongoDB Charts No-Root

**This is unsupported by MongoDB**

### What is this?

This is a Docker build that extends the MongoDB Charts image from quay.io.  The Dockerfile and nginx configuration settings adjust the environment to ensure PID 1 is not executed with a root user account.  Instead, system user `www-data` executes all processes.  This is necessary for building a MongoDB Charts docker image that is friendly with restrictive kubernetes environments.  Namely, OpenShift default security context constraints do not allow for deployments with a RunAsAny (root, in this case).

This projects goal is to build a MongoDB Charts docker image that runs within the UID range allowed by OpenShift's default scc.


