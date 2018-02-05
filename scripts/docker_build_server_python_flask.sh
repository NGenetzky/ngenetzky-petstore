#!//bin/sh
GITROOT="${GITROOT-$(readlink -f ./$(git rev-parse --show-cdup))}"
DOCKER_USER='ngenetzky'
build()
{
  docker build \
      -t ${DOCKER_USER?}/python-flask:0.0.1 \
      "${GITROOT}"
}
build $@
