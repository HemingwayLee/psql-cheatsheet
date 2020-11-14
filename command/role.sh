#Force createuser to prompt for a password, please put P@ssw0rd
createuser kenny --password

#run SQL script
sqlCreate="create table abc(id int);" 
sqlInsert="insert into abc(id) values(1);"
sqlSelect="select * from abc;" 
sqlDrop="drop table abc;"

PGPASSWORD=P@ssw0rd psql -h 127.0.0.1 -p 5432 -U kenny test -c"$sqlCreate"
PGPASSWORD=P@ssw0rd psql -h 127.0.0.1 -p 5432 -U kenny test -c"$sqlInsert"
PGPASSWORD=P@ssw0rd psql -h 127.0.0.1 -p 5432 -U kenny test -c"$sqlSelect"
PGPASSWORD=P@ssw0rd psql -h 127.0.0.1 -p 5432 -U kenny test -c"$sqlDrop"

dropuser kenny