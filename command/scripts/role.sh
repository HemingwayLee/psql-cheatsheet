#!/bin/bash

# Force createuser to prompt for a password, put P@ssw0rd
PGPASSWORD=${POSTGRES_PASSWORD} createuser kenny -P -h ${POSTGRES_HOST} -p 5432 -U postgres

# run SQL script
sqlCreate="create table abc(id int);" 
sqlInsert="insert into abc(id) values(1);"
sqlSelect="select * from abc;" 
sqlDrop="drop table abc;"

PGPASSWORD=P@ssw0rd psql -h ${POSTGRES_HOST} -p 5432 -U kenny -d ${POSTGRES_DB_NAME} -c"$sqlCreate"
PGPASSWORD=P@ssw0rd psql -h ${POSTGRES_HOST} -p 5432 -U kenny -d ${POSTGRES_DB_NAME} -c"$sqlInsert"
PGPASSWORD=P@ssw0rd psql -h ${POSTGRES_HOST} -p 5432 -U kenny -d ${POSTGRES_DB_NAME} -c"$sqlSelect"
PGPASSWORD=P@ssw0rd psql -h ${POSTGRES_HOST} -p 5432 -U kenny -d ${POSTGRES_DB_NAME} -c"$sqlDrop"

PGPASSWORD=${POSTGRES_PASSWORD} dropuser kenny -h ${POSTGRES_HOST} -p 5432 -U postgres
