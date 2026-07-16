# FreshShell

My shell aliases, functions, and custom scripts, managed with
[fresh](https://freshshell.com).

## Layout

```
freshrc              fresh manifest — lists what to load
shell/               files sourced into the shell
  aliases/           alias definitions
  functions/         shell function definitions
bin/                 standalone executables (linked via --bin)
```

## Usage

1. Push this repo to GitHub (`ColinElective/FreshShell`).
2. Reference these files from your `~/.freshrc`. The canonical list lives in
   this repo's [`freshrc`](./freshrc) — copy those `fresh …` lines into your
   `~/.freshrc`, or symlink it:

   ```sh
   ln -sf ~/code/freshshell/freshrc ~/.freshrc
   ```

3. Rebuild your shell config and reload:

   ```sh
   fresh
   source ~/.fresh/build/shell.sh   # already sourced by ~/.zshrc on login
   ```

## Notes

- Homebrew paths resolve via `brew --prefix`, so they work on both Apple
  Silicon and Intel Macs.
- Some functions/aliases are specific to the `core-api` monorepo and its
  branches (e.g. `staging`, `deprecation-station`, the `apps/core-api` test
  aliases) — useful to teammates on that repo, harmless to anyone else.
