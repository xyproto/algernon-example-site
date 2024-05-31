# Algernon Example Site

An example site that uses Algernon, ref https://github.com/xyproto/algernon/issues/147

The idea is to be able to deploy a simple web site to Google Cloud Run.

When using a custom domain, rename `localhost` to the name of the domain.

Adjust the `Dockerfile`, `Makefile` and Lua code as needed.

Algernon just serves HTTP, since Cloud Run can deal with the TLS.

Cloud Run might need to be configured to use port 80 instead of 8080 when setting it up.

## Requires

* Docker to be installed and running as a service.
* Make
* Python
* The Google Cloud CLI to be installed and configured with a Google Cloud project.

## License

Triple licensed, choose the one that you want:

* [CC0](LICENSE) - anyone can use this code, these music files and the contents of this repository freely without attributing anyone
