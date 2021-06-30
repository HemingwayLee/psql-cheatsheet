FROM python:3.8

RUN apt-get update && apt-get install -y sudo postgresql postgresql-contrib

RUN mkdir -p /home/proj
WORKDIR /home/proj
COPY . .

ENTRYPOINT ["tail", "-f", "/dev/null"]

