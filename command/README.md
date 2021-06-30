# How to run
```
docker-compose build 
docker-compose up
docker exec -it ${container_id} /bin/bash
```

# Connect
```
psql --host xxx.rds.amazonaws.com --port 5432 --username=postgres --password --dbname=postgres
```

```
psql -h xxx.rds.amazonaws.com -p 5432 -U postgres postgres
```


