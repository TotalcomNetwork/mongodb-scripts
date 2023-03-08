#!/bin/bash

if  [ -n "$1" ] 
then
    source $1
else
    echo "Error: missing .env file path"
	exit 1;
fi

if [ -z "$db_uri" ] || [ -z "$dump_dir" ] || [ -z "$source_db_name" ] || [ -z "$destination_db_name" ]
then
	echo "Error: 4 mandatory env variables expected: db_uri, dump_dir, source_db_name, destination_db_name"
	exit 1;
fi

mongorestore \
    --uri=$db_uri \
    --nsInclude="$source_db_name.*" \
    --nsFrom="$source_db_name.*" \
    --nsTo="$destination_db_name.*" \
    --drop \
    --preserveUUID \
    --numParallelCollections=6 \
    --gzip \
    --dir=$dump_dir \
    --verbose