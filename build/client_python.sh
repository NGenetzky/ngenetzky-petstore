
GIT_ROOT="$(git rev-parse --show-toplevel)"

build()
{
    sudo docker build \
        -t ngenetzky/client_python:0.0.1 \
        "${GIT_ROOT}/build/client_python"
}

run()
{
    sudo docker run -it \
        --net "container:cocky_hoover" \
        ngenetzky/client_python:0.0.1 \
        /bin/sh
}

