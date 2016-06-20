alias killdocker="docker stop $(docker ps | grep Up | awk '{print $1}'); docker-compose -f ~/workspace/metrix-release/resources/docker-compose.yml rm --all -f"
