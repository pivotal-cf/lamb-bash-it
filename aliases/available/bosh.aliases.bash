cite 'about-alias'
about-alias 'common bosh abbreviations'

alias bosh-dev="pushd ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch-dev > /dev/null; head -n3 <(/usr/local/bin/bbl print-env); popd > /dev/null"
alias bosh-acceptance="pushd ~/workspace/deployments-metrics/bosh-deployments/gcp/healthwatch/ > /dev/null; head -n3 <(/usr/local/bin/bbl print-env); popd > /dev/null"
                                                                                                                                        s
