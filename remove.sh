#!/bin/bash

docker-compose down -v
sudo rm -rf ./master/data/*
sudo rm -rf ./slave-1/data/*
sudo rm -rf ./slave-2/data/*
