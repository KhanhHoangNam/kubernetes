#!/bin/bash
cd master-01 && vagrant reload && \
cd ../master-02 && vagrant reload && \
cd ../master-03 && vagrant reload && \
cd ../worker-01 && vagrant reload && \
cd ../worker-02 && vagrant reload && \
cd ../worker-03 && vagrant reload && \
cd ../worker-04 && vagrant reload && \
cd ../worker-05 && vagrant reload && \
cd ../rancher && vagrant reload && \
cd ../devci && vagrant reload && \
cd ../haproxy-01 && vagrant reload && \
cd ../haproxy-02 && vagrant reload 
