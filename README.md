# Myumbrella

> Elixir umbrella applications can be smoothly hot-upgraded with [DeployEx][dye].

## Running Locally

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Genreating a hot-upgrade release

1. Build the initial release (e.g., `0.1.0`):
```bash
# Release the version 0.1.0
MIX_ENV=prod mix assets.deploy
MIX_ENV=prod mix release
```

2. Update the version (e.g., from `0.1.0` to `0.1.1`) in `version.txt`
3. Build the new release with forced compilation:
```bash
MIX_ENV=prod mix assets.deploy
MIX_ENV=prod mix compile --force
MIX_ENV=prod mix release
```

## Observer Web Notes

If using Observer Web, install it in only one app (recommended: the LiveView web app).

[dye]: https://github.com/thiagoesteves/deployex

