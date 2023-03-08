#!/bin/bash

if  [ -n "$1" ] 
then
    source $1
else
    echo "Error: missing .env file path"
	exit 1;
fi

if [ -z "$db_uri" ] || [ -z "$dump_dir" ] 
then
	echo "Error: 2 mandatory env variables expected: db_uri, dump_dir"
	exit 1;
fi

mongodump \
    --uri=$db_uri \
    --oplog \
    --gzip \
    --out=$dump_dir \
    --numParallelCollections=1 \
    --verbose