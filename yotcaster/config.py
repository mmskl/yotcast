from huey import SqliteHuey
from os import environ
import sys

data_dir = '{}/data'.format(environ['APP_DIR'])

if 'APP_URL' in environ:
    app_url=environ['APP_URL'].strip('/')
else:
    app_url=''

queue_db = '{}/queue.db'.format(data_dir)

huey = SqliteHuey(filename=queue_db)
