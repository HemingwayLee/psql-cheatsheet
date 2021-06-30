#!/bin/bash

sqlCreate="create table abc(id int);" 
sqlInsert="insert into abc(id) values(1);"
sqlSelect="select * from abc;" 
sqlDrop="drop table abc;"

PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlCreate"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlInsert"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlSelect"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlDrop"


