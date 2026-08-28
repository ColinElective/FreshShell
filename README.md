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

## `mrpost`

Generates the code-review message to paste into the review channel. Run it
inside a GitLab repo:

```sh
mrpost          # print the message
mrpost -c       # ...and copy it to the clipboard
```

It lists your open, non-draft merge requests via `glab`, oldest first, so the
ones that have been waiting longest lead the message:

```
!401 — Bump node to 22
https://gitlab.com/wize-apps/web/-/merge_requests/401
Opened 2 weeks ago

!412 — Fix phone input validation
https://gitlab.com/wize-apps/web/-/merge_requests/412
Opened 3 days ago
```

Deliberately plain text — the chat composer does not interpret markdown on
paste, so any asterisks would show up literally.

`MRPOST_AUTHOR` overrides the GitLab username, which otherwise comes from
whoever `glab` is logged in as.

## Notes

- Homebrew paths resolve via `brew --prefix`, so they work on both Apple
  Silicon and Intel Macs.
- Some functions/aliases are specific to the `core-api` monorepo and its
  branches (e.g. `staging`, `deprecation-station`, the `apps/core-api` test
  aliases) — useful to teammates on that repo, harmless to anyone else.
