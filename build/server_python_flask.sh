
GIT_ROOT="$(git rev-parse --show-toplevel)"

build()
{
    sudo docker build \
        -t ngenetzky/server_python_flask:0.0.1 \
        "${GIT_ROOT}/build/server_python_flask"
}

run()
{
    sudo docker run -d \
        -p 8080:8080 \
        ngenetzky/server_python_flask:0.0.1

}

