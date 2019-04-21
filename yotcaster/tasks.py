import youtube_dl
from os import path, environ
from config import huey

@huey.task()
def download_video(video_id):
    file_path = '{}/data/{}.m4a'.format(environ['APP_DIR'], video_id)

    if not path.exists('data/' + file_path):

        ydl_opts = {
            'outtmpl': file_path,
            'format': 'm4a/worstaudio/worst',
            'postprocessors': [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': 'm4a',
                'preferredquality': '128',
            }],
        }

        with youtube_dl.YoutubeDL(ydl_opts) as ydl:
            ydl.download(['https://www.youtube.com/watch?v={}'.format(video_id)])

    return file_path
