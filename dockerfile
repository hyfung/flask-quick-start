FROM ubuntu:bionic

copy app/ app/

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get install python3-pip -y
RUN apt-get install gunicorn3 python3-gunicorn -y
RUN pip3 install flask

EXPOSE 8000

CMD gunicorn3 app:app
