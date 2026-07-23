# Fresh auto-update helpers.

# Update fresh sources at most once per day, then re-source the rebuilt
# shell so the changes apply to the *current* shell.
#
# Call this at the very bottom of ~/.zshrc (after the line that sources
# ~/.fresh/build/shell.sh, since that's where this function is defined):
#
#   fresh_daily_update
#
# It re-sources ~/.fresh/build/shell.sh, NOT ~/.zshrc, so there is no
# infinite loop: this function is only ever *called* from ~/.zshrc.
fresh_daily_update() {
  command -v fresh >/dev/null 2>&1 || return 0

  local stamp=~/.fresh/.last-update

  # Skip if we updated within the last day (stamp exists and is <24h old).
  if [[ -f "$stamp" && -z "$(find "$stamp" -mtime +1 2>/dev/null)" ]]; then
    return 0
  fi

  if fresh update; then
    touch "$stamp"
    # Apply the freshly rebuilt output to this shell.
    source ~/.fresh/build/shell.sh
  fi
}
