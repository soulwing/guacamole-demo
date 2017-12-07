Configuration Volume
====================

For static configuration files, extensions, and associated libraries, an 
easy way to make them available to Guacamole is to mount an external volume
(e.g. from the host) into the Guacamole Web Server container.

Each of the Docker Compose stacks in the demo uses a subdirectory of the
directory containing this README as a configuration volume for the Guacamole
Web Server. By arranging to mount the external volume on a directory path
identified by the `GUACAMOLE_HOME` environment variable, Guacamole can
discover your configuration.

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


