FROM python:3.7.2-alpine

RUN mkdir /opt/Yotcaster
WORKDIR /opt/Yotcaster/yotcaster
RUN mkdir -p /opt/Yotcaster/data

COPY ./yotcaster /opt/Yotcaster/yotcaster
COPY ./requirements.txt /opt/Yotcaster/requirements.txt

RUN pip install -r /opt/Yotcaster/requirements.txt
RUN apk add  ffmpeg --no-cache
