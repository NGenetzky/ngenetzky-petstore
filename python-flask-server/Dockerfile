FROM python:2-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

EXPOSE 80

ENTRYPOINT ["python"]

CMD ["-m", "ngenetzky_petstore_server"]