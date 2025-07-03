# Use the official n8n image as base
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Fix: Replace default Alpine mirror with a working one, then install ffmpeg
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
  && apk update \
  && apk add --no-cache ffmpeg

# Switch back to the node user
USER node
