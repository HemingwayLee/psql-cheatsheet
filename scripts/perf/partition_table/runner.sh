dropdb --if-exists perf
createdb --encoding=UTF8 perf

psql -d perf -a -f init.sql

psql -d perf -c"\copy \"ORDERBOOK\" FROM 'data.csv' DELIMITER ',' CSV;"

psql -d perf -a -f execute.sql

psql -d perf -a -f shutdown.sql