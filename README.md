# hello-container

Super small container that prints the current hostname via HTTP.

# usage

The application is built with docker. When building with `docker build -t hello .`, the binary is being compiled and then copied to the resulting image. The whole pipeline looks simply like this:

```bash
docker build -t hello .
docker-compose up -d
```

After that you can do `curl -v http://localhost:8080`. You can access metrics via the `/metrics` endpoint.
