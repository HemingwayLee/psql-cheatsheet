dropdb --if-exists perf
createdb --encoding=UTF8 perf

psql -d perf -a -f init.sql

psql -d perf -c"\copy \"ORDERBOOK\" FROM 'data.csv' DELIMITER ',' CSV;"

#if we don't do this, it will not update
# if we do this, it will takes a lot of time...
psql -d perf -c"refresh materialized view \"ORDERBOOK_IDX_VIEW_SELL\";"
psql -d perf -c"refresh materialized view \"ORDERBOOK_IDX_VIEW_BUY\";"

psql -d perf -c"select * from \"ORDERBOOK\";"
psql -d perf -c"select * from \"ORDERBOOK_IDX_VIEW_SELL\" order by \"PRICE\" desc;"
psql -d perf -c"select * from \"ORDERBOOK_IDX_VIEW_BUY\" order by \"PRICE\" desc;"

psql -d perf -a -f shutdown.sql