Docker MySQL master-slave replication 
========================

MySQL 8.0 master-slave replication with using Docker. Slave will be in super read only mode.

## Run

#### Create 2 MySQL containers with master-slave row-based replication

```bash
./build.sh
```

## Test

#### Make changes to master

```bash
docker exec mysql_master sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'create table code(code int); insert into code values (100), (200)'"
```

#### Read changes from slave

```bash
docker exec mysql_slave sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from code \G'"
```

## Troubleshooting

#### Check Logs

```bash
docker-compose logs
```

#### Check running containers

```bash
docker-compose ps
```

#### Clean data dir

```bash
sudo rm -rf ./master/data/*
sudo rm -rf ./slave/data/*
```

#### Run command inside "mysql_master"

```bash
docker exec mysql_master sh -c 'mysql -u root -p111 -e "SHOW MASTER STATUS \G"'
```

#### Run command inside "mysql_slave"

```bash
docker exec mysql_slave sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
```

#### Enter into "mysql_master"

```bash
docker exec -it mysql_master bash
```

#### Enter into "mysql_slave"

```bash
docker exec -it mysql_slave bash
```
