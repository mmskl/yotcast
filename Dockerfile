FROM python:3.7.2-alpine

RUN mkdir /opt/Yotcaster
WORKDIR /opt/Yotcaster/yotcaster
RUN mkdir -p /opt/Yotcaster/data

COPY ./yotcaster /opt/Yotcaster/yotcaster
COPY ./requirements.txt /opt/Yotcaster/requirements.txt
COPY ./supervisord.conf /opt/Yotcaster/supervisord.conf

RUN pip install -r /opt/Yotcaster/requirements.txt
RUN apk add  ffmpeg supervisor --no-cache

ENTRYPOINT ["supervisord", "-n", "-c", "/opt/Yotcaster/supervisord.conf"]
