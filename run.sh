docker build . -t podtubecast
docker rm -f podtubecast_app
docker run -d -p 8084:5000 --name podtubecast_app podtubecast

