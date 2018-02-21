### Glenn's thing to load SSH Key from LastPass ###
function _load_ssh_key_from_lastpass() {
  keytype=$1
  username=$2

  if [ -z "${username}" ]; then
    echo "Must supply your lastpass login without '@pivotal.io'. E.g. 'goppegard'."
    return
  fi

  tmpdir=$(mktemp -d -t lpass)
  export LPASS_HOME=$tmpdir
  export LPASS_AGENT_DISABLE=1

  trap 'lpass logout --force; rm -rf "${tmpdir}"' EXIT INT TERM HUP

  private_key_name="${keytype}_${username}"
  private_key_path="${tmpdir}/${private_key_name}"
  lifetime='10H'
  if [ "${keytype}" = 'prod' ]; then
    lifetime='9H'
  fi

  mkfifo -m 0600 "${private_key_path}"
  lpass login "${username}+lastpass-cf@pivotal.io"
  lpass show --notes ${username}_${keytype} > "${private_key_path}" &
  ssh-add -t "${lifetime}" "${private_key_path}"

  # Clean up
  rm -rf "${tmpdir}"
  unset LPASS_HOME
  unset LPASS_AGENT_DISABLE
  trap - EXIT INT TERM HUP
}
alias nonprod='_load_ssh_key_from_lastpass nonprod'
alias prod='_load_ssh_key_from_lastpass prod'
