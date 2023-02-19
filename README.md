# Base Rails
The purpose of this repo is to serve as a Rails basic setup with a local Docker
 environment.

# Setup
- Copy the `example.env` env file to `.env`.
- Update your container user vars in `.env` to values returned by your
 system's `id` command.
- run `docker-compose --rm app ./bin/setup`.
- Profit.
