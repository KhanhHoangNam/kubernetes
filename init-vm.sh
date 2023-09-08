#!/bin/bash
cd master-01 && vagrant halt && vagrant destroy -f && vagrant up && \
cd ../master-02 && vagrant halt && vagrant destroy -f && vagrant up && \
cd ../master-03 && vagrant halt && vagrant destroy -f && vagrant up && \
cd ../worker-01 && vagrant halt && vagrant destroy -f && vagrant up && \
cd ../worker-02 && vagrant halt && vagrant destroy -f && vagrant up && \
cd ../worker-03 && vagrant halt && vagrant destroy -f && vagrant up
