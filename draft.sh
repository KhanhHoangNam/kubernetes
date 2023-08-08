#!/bin/bash
# Config keepalived
vrrp_script haproxy-check {
    script "killall -0 haproxy"
    interval 2
    weight 10
}

vrrp_instance kubernetes {
    state MASTER
    priority 100
    interface eth1
    virtual_router_id 61
    advert_int 2
    authentication {
        auth_type AH
        auth_pass khanhhn
    }
    virtual_ipaddress {
        192.168.56.7
    }

    track_script {
        haproxy-check
    }
}
