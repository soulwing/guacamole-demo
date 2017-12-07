Configuration Volume
====================

For (relatively) static configuration files, extensions, and associated
libraries, an easy way to make them available to Guacamole is to use a
Docker container as a storage volume.

We build a simple container image starting from the _same base image_ as
the container we want to configure (in this case, `guacamole/guacamole`)
and expose a small part of it as a mountable volume. By starting with the
same base, we're assured of the same filesystem layout, and that the new
configuration container image will differ from the target in a very 
predictable way that makes good use of the layered filesystem model.

## GUACAMOLE_HOME

Static configuration files, extensions and their dependencies are all placed 
in the directory identified by the `GUACAMOLE_HOME` environment variable, 
with the following layout:

```
${GUACAMOLE_HOME}/
    guacamole.properties            # configuration properties
    logback.xml                     # logging subsystem configuration
    user-mapping.xml                # simple user configuration
    extensions/                     # jar files for supported extensions
    lib/                            # jar files for extension dependencies
```

## Building a Configuration Image

This directory contains several subdirectories for different Guacamole
configurations used in the demo. Each directory contains a `Dockerfile`
along with files laid out in the structure given above, which are copied
into the configuration volume at the path '/opt/guacamole/home`.

When building a configuration, we use same image name, but with a tag to
distinguish it. The tag is the subdirectory name. For example, to build
the configuration that uses CAS along with a static `user-mapping.xml` 
file for authorization, we run the build command as follows.

```
docker image build --tag guacamole-demo-config:cas-static cas-static/
```

This creates the `guacamole-demo-config` image using the `Dockerfile` and
other resources in the `cas-static/` subdirectory and tags it as `cas-static`.
We can then use a Docker Compose configuration that specifies this image tag
to try it out.
