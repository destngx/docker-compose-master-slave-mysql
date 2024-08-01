#!/bin/bash

docker-compose down -v
sudo rm -rf ./master/data/*
sudo rm -rf ./slave/data/*
