#!/usr/bin/env bash

docker build -t build/nginx:1.15-fpm -f fpm/Dockerfile .
