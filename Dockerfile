FROM python:3.7.2-alpine

RUN mkdir /opt/podtubecast
WORKDIR /opt/podtubecast
RUN mkdir -p /opt//podtubecast/data

COPY ./ /opt/podtubecast

VOLUME /opt/podtubecast/data

RUN pip install -r requirements.txt
RUN apk add  ffmpeg --no-cache

ENTRYPOINT ["python", "/opt/podtubecast/podtubecast.py"]


