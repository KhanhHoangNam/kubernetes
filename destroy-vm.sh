#!/bin/bash
cd master-01 && vagrant halt && vagrant destroy -f && \
cd ../master-02 && vagrant halt && vagrant destroy -f && \
cd ../master-03 && vagrant halt && vagrant destroy -f && \
cd ../worker-01 && vagrant halt && vagrant destroy -f && \
cd ../worker-02 && vagrant halt && vagrant destroy -f && \
cd ../worker-03 && vagrant halt && vagrant destroy -f
