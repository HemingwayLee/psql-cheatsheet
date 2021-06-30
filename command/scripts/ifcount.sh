#!/bin/bash

sqlCreate="create table abc(id int);" 
sqlInsert="insert into abc(id) values(1);"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlCreate"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlInsert"

COUNT=$(PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -tAc 'select count(*) from abc;')
# echo $COUNT
if [ "$COUNT" -gt "0" ] ; then
  echo " Succeeded"
else
  echo " Failed"
fi 

sqlDrop="drop table abc;"
PGPASSWORD=${POSTGRES_PASSWORD} psql -h ${POSTGRES_HOST} -p 5432 -U postgres -d ${POSTGRES_DB_NAME} -c "$sqlDrop"
