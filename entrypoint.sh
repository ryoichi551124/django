#!/bin/sh

echo "ENV=${ENV}"

echo "Collect static files..."
python3.13 manage.py collectstatic --noinput

if [ "$ENV" = "dev" ]; then
    echo "Starting Django in development mode with runserver..."
    exec python3.13 manage.py runserver 0.0.0.0:8000
else
    echo "Starting Django in production mode with uWSGI..."
    exec uwsgi --ini /app/uwsgi.ini
fi
