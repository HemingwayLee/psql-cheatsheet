drop trigger if exists "TRI_ORDERBOOK_INSERT" on "ORDERBOOK";
drop function if exists "CFN_ORDERBOOK_INSERT"();

drop index if exists "IDX_ORDERBOOK_BTC_XRP";
drop index if exists "IDX_ORDERBOOK_USD_DOG";
drop index if exists "IDX_ORDERBOOK_JPY_LTC";

drop table if exists "ORDERBOOK_JPY_LTC";
drop table if exists "ORDERBOOK_USD_DOG";
drop table if exists "ORDERBOOK_BTC_XRP";
drop table if exists "ORDERBOOK";