drop index "ORDERBOOK_IDX_VIEW_BUY_PRICE";
drop materialized view if exists "ORDERBOOK_IDX_VIEW_BUY";
drop index "ORDERBOOK_IDX_VIEW_SELL_PRICE";
drop materialized view if exists "ORDERBOOK_IDX_VIEW_SELL";
drop index "IDX_ORDERBOOK_PRICE";
drop table if exists "ORDERBOOK";