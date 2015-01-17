#!/bin/bash

TEMPLATE_FILE="./templates/cloudformation.template"

display_usage() {
    echo ""
    echo "usage:"
    echo "$0 [PROFILE NAME] [EXISTING AWS KEYPAIR NAME]"
    echo ""
}

if [ "$#" -ne 2 ]; then
    display_usage;
    exit
fi

# Create the stack.
aws cloudformation create-stack --stack-name aws-webserver-test --template-body "file://$TEMPLATE_FILE" --profile $1 --parameter "ParameterKey=KeyPair,ParameterValue=$2"
# Display info about the stack.
echo "Stack creation started! You can view more information about the stack via the following command:"
echo ""
echo "    aws cloudformation describe-stacks --profile $1"
