#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

OUT_DIR=$SCRIPT_DIR/dist

MVN=$SCRIPT_DIR/mvnw
MVN_BUILD="$MVN clean package -DskipTests"

dk_publish() 
{
    for dir in $(find $OUT_DIR -type d); do 
        if [[ -f "$dir/dockerfile" ]]; then 
            docker build -t khoildm2508/$(basename $dir) $dir
            docker push khoildm2508/$(basename $dir) 
        fi
    done
}

dk_publish
