# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

bind = '0.0.0.0:8000'
accesslogfile = '-'
loglevel = 'debug'
capture_output = True
enable_stdio_inheritance = True
timeout=180
threads=2
worker=2
worker_connections=1000
#worker_class='uvicorn.workers.UvicornWorker'
