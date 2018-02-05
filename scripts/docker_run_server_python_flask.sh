#!//bin/sh
GITROOT="${GITROOT-$(readlink -f ./$(git rev-parse --show-cdup))}"
DOCKER_USER='ngenetzky'
run()
{
    docker run -d \
        -p 9001:8080 \
        ${DOCKER_USER?}/python-flask:0.0.1
}
run $@
