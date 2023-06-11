#!/bin/bash

docker ps --format '{{.ID}}' | xargs -I '{}' docker container stop '{}' 

