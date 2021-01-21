#!/bin/bash

sqlCreate="create table abc(id int);" 
sqlInsert="insert into abc(id) values(1);"
sqlSelect="select * from abc;" 
sqlDrop="drop table abc;"

psql -h 127.0.0.1 -p 5432 -U Rosemary test -c"$sqlCreate"
psql -h 127.0.0.1 -p 5432 -U Rosemary test -c"$sqlInsert"
psql -h 127.0.0.1 -p 5432 -U Rosemary test -c"$sqlSelect"
psql -h 127.0.0.1 -p 5432 -U Rosemary test -c"$sqlDrop"
