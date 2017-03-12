
# Perforce aliases
resolve_default() {
  p4 resolve -as -c default
}

resolve() {
  p4 resolve -as -c $1
}

pending_changelists() {
  p4 changes -s pending -c $P4CLIENT
}

sync_branch() {
  p4 sync --parallel=0 "$WD_REPOSITORY/$1/..."#head
}

release() {
  p4 sync "$WD_REPOSITORY/release/..."
  p4 integrate "$WD_REPOSITORY/trunk/..." "$WD_REPOSITORY/release/..."
  resolve_default
}

rebase() {
  p4 integrate "$WD_REPOSITORY/trunk/..." "$WD_REPOSITORY/branches/$1/..."
  resolve_default
}

integrate() {
  p4 integrate "$WD_REPOSITORY/branches/$1/..." "$WD_REPOSITORY/trunk/..."
  resolve_default
}

branch() {
  p4 populate -o "$WD_REPOSITORY/trunk/..." "$WD_REPOSITORY/branches/$1/..."
  sync_branch("branches/$1")
  p4 edit "$WD_REPOSITORY/branches/$1/db/schema.rb"
}

diff_opened_files() {
  p4 diff -sa | grep $1 | xargs p4 diff -du
}

add_file_or_directory() {
  find $1 -path ./.git -prune -o -name '*' -print | xargs p4 add
}

alias p4pending=pending_changelists
alias p4submit='p4 submit --parallel=0 -f revertunchanged -i'
alias p4sync=sync_branch             # trunk | release | branch/<name>
alias p4rebase=rebase                # <branch_name>
alias p4branch=branch                # <branch_name>
alias p4integrate=integrate          # <branch_name>
alias p4revert='p4 revert -a -c'     # default | <changelist>
alias p4resolve=resolve              # default | <changelist>
alias p4diffs=diff_opened_files      # <branch_name>
alias p4release=release
alias p4add=add_file_or_directory    # <file_or_dir>
