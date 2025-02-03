#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

OUT_DIR=$SCRIPT_DIR/dist

MVN=$SCRIPT_DIR/mvnw
MVN_BUILD="$MVN clean package -DskipTests"

mvn_dk_build() 
{
    PROJECT=$1
    cd $SCRIPT_DIR/$PROJECT
    $MVN_BUILD
    mkdir -p $OUT_DIR/$PROJECT
    cp -r target/$PROJECT-*.jar $OUT_DIR/$PROJECT
    sed 's/${PROJECT}'"/${PROJECT}/g" $SCRIPT_DIR/generic.java.dockerfile > $OUT_DIR/$PROJECT/Dockerfile
}

build() 
{   
    rm -rf $OUT_DIR
    mkdir $OUT_DIR

    # article client
    cd $SCRIPT_DIR/article-client
    npm install . 
    npm run build 
    mkdir -p $OUT_DIR/article-client 
    cp -r dist config $OUT_DIR/article-client
    cp Dockerfile $OUT_DIR/article-client

    # article server
    mvn_dk_build article-server
    # auth server
    mvn_dk_build auth-server
    # config server
    mvn_dk_build config-server
    # netflix eureka 
    mvn_dk_build eureka

    # database
    cp -r $SCRIPT_DIR/database $OUT_DIR/article-db
}

dk_publish() 
{
    for dir in $(find $OUT_DIR -type d); do 
        if [[ -f "$dir/dockerfile" ]]; then 
            docker build -t $(basename $dir) $dir
        fi
    done
}

build
dk_publish
