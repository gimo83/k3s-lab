#!/bin/env bash
#

namespace_name=mynamespace
pod_name=nginx

if [[ $(echo $(kubectl get pods -n $namespace_name $pod_name -o name )) == pod/nginx ]] &>/dev/null
then
    kubectl delete pod/$pod_name -n $namespace_name
fi


if kubectl get ns $namespace_name &>/dev/null
then
    kubectl delete namespace/$namespace_name
fi
