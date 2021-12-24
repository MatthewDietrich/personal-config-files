export WIN="/mnt/c/Users/mdietrich"

bind -x '"\C-B":mvn -DskipTests clean package'

dnpm () (
    docker run -it --rm --name docker-npm -v "$PWD":/usr/src/app -v $HOME/.npmrc:/root/.npmrc -w /usr/src/app --env CYPRESS_INSTALL_BINARY=0 node:16 $@
)

dc () (
  cd ~/dev/docker-lab || exit 255
    # shellcheck disable=SC2068
      docker-compose -f docker-compose.yml -f additional-containers/lasso-api.yml $@
)
