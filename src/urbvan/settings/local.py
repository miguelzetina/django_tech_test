from .base import *


ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'urbvan_test',
        'USER': 'urbvan',
        'PASSWORD': 'password',
        'HOST': 'postgresql',
        'PORT': 5432,
    }
}
