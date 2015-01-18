#!/bin/bash

TEMPLATE_FILE="./templates/cloudformation.template"

display_usage() {
    echo ""
    echo "usage:"
    echo "$0 [PROFILE NAME] [EXISTING AWS KEYPAIR NAME] [EMAIL ADDRESS]"
    echo "(An email will be sent to the address you provide, once provisioning and setting up the instance has been completed)"
    echo ""
}

if [ "$#" -ne 3 ]; then
    display_usage;
    exit
fi

# Create the stack.
aws cloudformation create-stack --stack-name aws-webserver-test --template-body "file://$TEMPLATE_FILE" --profile $1 --parameter ParameterKey=KeyPair,ParameterValue=$2 ParameterKey=EmailAddress,ParameterValue=$3 && echo "Stack creation started! You will receive an email at $3 when this process has completed!"
