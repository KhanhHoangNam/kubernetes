----------------
== Couchbase-operator deployed.
   # Check the couchbase-operator logs
   kubectl logs -f deployment/couchbase-couchbase-operator  --namespace default


== Admission-controller deployed.
   # Check the admission-controller logs
   kubectl logs -f deployment/couchbase-couchbase-admission-controller --namespace default

== Connect to Admin console
   kubectl port-forward --namespace default couchbase-couchbase-cluster-0000 8091:8091

   # open http://localhost:8091
   username: Administrator
   password: WUdPUEpv

== Manage this chart
   # Upgrade Couchbase
   helm upgrade couchbase -f <values.yaml> couchbase/couchbase-operator

   # Show this status again
   helm status couchbase