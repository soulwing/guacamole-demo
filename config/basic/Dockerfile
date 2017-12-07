# Dockerfile for a Guacamole configuration volume

FROM guacamole/guacamole:latest
ARG GUACAMOLE_HOME=/opt/guacamole/home
VOLUME ${GUACAMOLE_HOME}
ENTRYPOINT [ "/bin/echo", "guacamole configuration volume" ]

COPY user-mapping.xml ${GUACAMOLE_HOME}/
