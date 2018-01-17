cite 'about-alias'
about-alias 'common bosh abbreviations'

alias bosh-dev="pushd ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch-dev > /dev/null; /usr/local/bin/bbl print-env; popd > /dev/null"
alias bosh-dev-ssh="bosh ssh --gw-user jumpbox --gw-host 35.196.93.221 --gw-private-key ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch-dev/director_ssh_cert.pem"

alias bosh-acceptance="pushd ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch/ > /dev/null; /usr/local/bin/bbl print-env; popd > /dev/null"
alias bosh-acceptance-ssh="bosh ssh --gw-user jumpbox --gw-host 35.196.76.134 --gw-private-key ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch/director_cert"
                                                                                                                                        s
