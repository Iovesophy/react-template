#!/bin/sh -eux

readonly FILENAME=template/s3.yml
readonly STACKNAME=react-template
readonly APPDIR=./react-sample/build
readonly REGION=

aws cloudformation validate-template --template-body file://${FILENAME}

changeset_option="--no-execute-changeset"

if [ $# = 2 ]; then
    # region remove phase
    if [ $1 = "remove" ]; then
        echo "-- Remove s3 bucket --"
        aws s3 rm s3://$2 --recursive 
        aws s3 rb s3://$2 
        aws cloudformation delete-stack --stack-name "${STACKNAME}"
    fi
    # endregion remove phase

    # region create chengeset phase
    if [ $1 = "chengeset" ]; then
        echo "-- Set chengeset mode --"
        changeset_option="--no-execute-changeset"
        aws cloudformation deploy \
            ${changeset_option} \
            --stack-name "${STACKNAME}" \
            --template-file "${FILENAME}" \
            --parameter-overrides \
              S3BucketName=$2
    fi
    # endregion create chengeset phase

    # region deploy phase
    if [ $1 = "deploy" ]; then
        echo "-- Set deploy mode --"
        changeset_option=""
        aws cloudformation deploy \
            ${changeset_option} \
            --stack-name "${STACKNAME}" \
            --template-file "${FILENAME}" \
            --parameter-overrides \
              S3BucketName=$2
        aws s3 sync ${APPDIR} s3://$2/
        echo "http://${2}.s3-website-${REGION}.amazonaws.com"
        open "http://${2}.s3-website-${REGION}.amazonaws.com"
    fi
    # endregion deploy phase
fi


