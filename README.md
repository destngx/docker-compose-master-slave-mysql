Docker MySQL master-slave replication 
========================

MySQL 8.0 master-slave replication with using Docker. Slave will be in super read only mode.

## Run

#### Create 3 MySQL containers with master-slave row-based replication

This will create 3 MySQL containers with master-slave replication. The master will be running on port 20306 and the slaves will be running on port 20307 and 20308.

```bash
> [!info]
> The default password and database name could be change in env file in each database config folder. The current config is set to allow empty password.

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
docker exec mysql_slave_1 sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from code \G'"
docker exec mysql_slave_2 sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from code \G'"
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
sudo rm -rf ./slave-1/data/*
sudo rm -rf ./slave-2/data/*
```

#### Run command inside "mysql_master"

```bash
docker exec mysql_master sh -c 'mysql -u root -p111 -e "SHOW MASTER STATUS \G"'
```

#### Run command inside "mysql_slave"

```bash
docker exec mysql_slave_1 sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
docker exec mysql_slave_2 sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
```

#### Enter into "mysql_master"

```bash
docker exec -it mysql_master bash
```

#### Enter into "mysql_slave"

```bash
docker exec -it mysql_slave_1 bash
docker exec -it mysql_slave_2 bash
```
