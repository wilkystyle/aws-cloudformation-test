#!/bin/bash

display_usage() {
    echo ""
    echo "usage:"
    echo "$0 [PROFILE NAME]"
    echo ""
}

if [ "$#" -ne 1 ]; then
    display_usage;
    exit
fi

aws cloudformation delete-stack --stack-name aws-webserver-test --profile $1
