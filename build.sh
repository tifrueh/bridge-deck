#!/bin/sh

docker buildx build --platform linux/amd64 --tag bridge-deck:$(git describe --always --dirty='-d' || date +'%Y-%m-%d') .
