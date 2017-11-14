FROM jfloff/alpine-python:3.4-slim

WORKDIR /usr/src/app

RUN pip install -U connexion

COPY ./server_python_flask ./

CMD [ "python", "./app.py" ]
EXPOSE 8080
