#!/bin/env bash
#

if kubectl get ns mynamespace &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t namespace 'mynamespace' was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t namespace 'mynamespace' was not found"
fi
TOTAL=$(( TOTAL + 10 ))

if [[ $(echo $(kubectl get pods -n mynamespace nginx -o jsonpath='{.spec.containers[*].image}')) == nginx:latest ]] &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t found pod 'nginx' that uses the latest version of nginx"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t pod 'nginx' that uses the latest version of the nginx image was not found"
fi
TOTAL=$(( TOTAL + 10 ))