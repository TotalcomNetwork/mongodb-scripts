# MongoDB Scripts

Script to automate and simplify common MongoDB administration tasks

## Requirements

The scripts require MongoDB database tools installed


## Setup DEV environment

1. `cd` into the repository root directory: `cd mongodb-scripts`
1. run the docker service with `docker stack deploy -c docker-compose.dev.yml mongodb_scripts` or `docker compose up`


## Scipts

* [Backup remote DB](backup-remote-db/README.md)
* [Restore remote DB](restore-remote-db/README.md)