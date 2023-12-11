#!/bin/bash
cd haproxy-01 && vagrant halt && \
cd ../haproxy-02 && vagrant halt && \
cd ../master-01 && vagrant halt && \
cd ../master-02 && vagrant halt && \
cd ../master-03 && vagrant halt && \
cd ../worker-01 && vagrant halt && \
cd ../worker-02 && vagrant halt && \
cd ../worker-03 && vagrant halt && \
cd ../worker-04 && vagrant halt && \
cd ../worker-05 && vagrant halt && \
cd ../rancher && vagrant halt && \
cd ../devci && vagrant halt
