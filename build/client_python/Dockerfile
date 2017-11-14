FROM jfloff/alpine-python:3.4-slim

WORKDIR /usr/src/app

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./swagger_client ./swagger_client
# RUN python ./swagger_client/setup.py install

COPY ./run.py ./

# CMD [ "python", "./run.py" ]
CMD [ "/bin/sh" ]

