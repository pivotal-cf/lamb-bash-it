alias gap="git add -p"
alias gdf="git diff --color | diff-so-fancy"
alias healthwatch-data="cd ~/workspace/go/src/github.com/pivotal-cf/healthwatch-data/java"
alias release-data="cd ~/workspace/healthwatch-release/src/github.com/pivotal-cf/healthwatch-data"
alias release="cd ~/workspace/healthwatch-release"
alias tile="cd ~/workspace/p-healthwatch"
alias superfly="fly -t superpipe"

function pcf-target ()
{
    if [ "$#" -lt 1 ]; then
        echo "Usage: pcf-target <environment-name>";
        exit 1;
    fi;
    pushd ~/workspace/metrics-env-locks/
    path=$(find . -name $1)
    om_username=$(jq .ops_manager.username -r $path)
    om_password=$(jq .ops_manager.password -r $path)
    om_url=$(jq .ops_manager.url -r $path)
    cf_password=$(om  -k -t ${om_url} -u ${om_username} -p ${om_password} credentials -p cf -c .uaa.admin_credentials -f password)

    domain=$1.cf-app.com;
    cf api api.sys.${domain} --skip-ssl-validation;
    cf auth admin ${cf_password}
    cf target -o system -s system
    popd
}

function pcf-target-ssh()
{
    if [ "$#" -lt 1 ]; then
        echo "Usage: pcf-target-ssh <environment-name>";
        exit 1;
    fi;
    pushd ~/workspace/metrics-env-locks/
    path=$(find . -name $1)
    om_username=$(jq .ops_manager.username -r $path)
    om_password=$(jq .ops_manager.password -r $path)
    om_url=$(jq .ops_manager.url -r $path)
    bosh_creds=$(om  -k -t ${om_url} -u ${om_username} -p ${om_password} curl -s --path /api/v0/deployed/director/credentials/bosh_commandline_credentials | jq .credential -r)
    echo "============================"
    echo ${bosh_creds}
    echo -n ${bosh_creds} | pbcopy
    echo "============================"

    domain=pcf.$1.cf-app.com;
    ssh -i ~/workspace/deployments-metrics/aws-environments/gcp.pem ubuntu@${domain} -oStrictHostKeyChecking=no
    popd
}
