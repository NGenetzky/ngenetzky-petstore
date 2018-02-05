FROM python:3-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./swagger-codegen/server_python_flask/requirements.txt /usr/src/app/

RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./swagger-codegen/server_python_flask/ /usr/src/app

EXPOSE 8080

ENTRYPOINT ["python3"]

CMD ["-m", "swagger_server"]