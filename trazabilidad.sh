#! /bin/bash
bash -c "source venv/bin/activate;gunicorn trazacion.wsgi:application --config gunicorn-cfg.py --certfile=/etc/letsencrypt/live/app-trazabilidad.com/fullchain.pem --keyfile=/etc/letsencrypt/live/app-trazabilidad.com/privkey.pem"
