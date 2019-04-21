from huey import SqliteHuey
from os import environ
import sys

DATA_DIR = '{}/data'.format(environ['APP_DIR'])

queue_db = '{}/queue.db'.format(DATA_DIR)

huey = SqliteHuey(filename=queue_db)
