#!/bin/bash
cd haproxy-01 && vagrant reload && \
cd ../haproxy-02 && vagrant reload && \
cd ../master-01 && vagrant reload && \
cd ../master-02 && vagrant reload && \
cd ../master-03 && vagrant reload && \
cd ../worker-01 && vagrant reload && \
cd ../worker-02 && vagrant reload && \
cd ../worker-03 && vagrant reload && \
cd ../devci && vagrant reload
