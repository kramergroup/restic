#!/bin/bash

# Run restic within a shell to configure environment variables

ARGS=()

# Allows for defining some environment variables on the command line
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        --AWS_ACCESS_KEY_ID)
            export AWS_ACCESS_KEY_ID=$VALUE
            ;;
        --AWS_SECRET_ACCESS_KEY)
            export AWS_SECRET_ACCESS_KEY=$VALUE
            ;;
        --RESTIC_PASSWORD)
            export RESTIC_PASSWORD=$VALUE
            ;;
        --RESTIC_REPOSITORY)
            export RESTIC_REPOSITORY=$VALUE
            ;;
        *) 
            ARGS+=($1)
            ;;
    esac
    shift
done

exec restic $( IFS=$' '; echo "${ARGS[*]}" )