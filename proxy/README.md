NGinX Reverse Proxy
===================

This directory contains an image configuration for a NGinX container that
will serve as a reverse proxy for the Guacamole Web Server. Using a proxy
like this avoids the need to configure the Guacamole Web Server to support
TLS, which requires a different toolchain than OpenSSL and is less convenient
to set up.

### Why NGinX?

It just happens to have a simple configuration model that will allow us to
accomplish what we need in our reverse proxy with just one small configuration
file. You could certainly accomplish the same thing with the Apache http
server, if that is your preference.

### Reverse Proxy Configuration

Our configuration simply directs the `/guacamole` path to the Guacamole
server running on port 8080. If you decide to run Guacamole on some other
port, you'll need to modify `conf/default.conf` accordingly.

If you look at the configuration file, you'll see the following location 
directive.

```
location / {
  proxy_pass http://guacamole:8080/guacamole/
  ...
}
  
Notice the use of _guacamole_ in the server name portion of the URL? This
"hostname" will be resolved by the DNS proxy in Docker that handles service
discovery. The name of our Docker Compose service for the Guacamole Web
Server is _guacamole_, so we can use this as an unqualified hostname in
any container that runs as part of the same stack.

In addition to reverse proxy setup, the configuration includes a `/ping` path
that you can use to verify that the proxy is running properly -- just use
curl to fetch from that path and check for a 200 response.

### TLS Configuration

To support TLS, you'll obviously need a certificate. For the demo, I'm using
a certificate from [Let's Encrypt](https://letsencrypt.org), but a certificate
from just about any legitimate certification authority will do.

When we run the container for the proxy, our configuration will bind mount
a directory from the host in which we'll place the files for our certificate.
The container can then reference the files as a fixed path. To keep things
simple, we'll use just two files for our certificate.

* `key.pem` -- the PEM-encoded private key for our certificate; it should
  not be protected with a passphrase
* `cert.pem` -- the full chain of PEM-encoded certificates, starting with
  the subject certificate and including all CA certificates all the way to
  the root CA

### Building the Container Image

This directory contains a `Dockerfile` that starts with the official NGinX
container image and overlays our configuration. We build the container image
for our proxy using Docker.

```
docker container image --tag guacamole-demo-proxy .
```

Note that `guacamole-demo-proxy` is the name of the result container image.
We'll use this name in our Docker Compose configuration to run the reverse
proxy as a container with the other parts of Guacamole.
