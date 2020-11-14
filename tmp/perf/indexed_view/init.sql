create table if not exists "ORDERBOOK" (
  "ID_ORDER" uuid primary key not null,
  "PRICE" decimal(21, 2) not null,
  "SIZE" decimal(21, 2) not null,
  "IS_SELL" boolean not null,
  "PAIR" varchar(16) not null
);

create index "IDX_ORDERBOOK_PRICE" on "ORDERBOOK" ("IS_SELL", "PRICE");

create materialized view if not exists "ORDERBOOK_IDX_VIEW_SELL" as
  select
    "PRICE",
    (
      select sum("SIZE") from "ORDERBOOK" as iorder
      where iorder."PRICE" <= ooder."PRICE"
    ) as "TOTAL"
  from "ORDERBOOK" as ooder
  where "IS_SELL" is true group by "PRICE";

create unique index "ORDERBOOK_IDX_VIEW_SELL_PRICE" 
  on "ORDERBOOK_IDX_VIEW_SELL" ("PRICE");


create materialized view if not exists "ORDERBOOK_IDX_VIEW_BUY" as
  select
    "PRICE",
    (
      select sum("SIZE") from "ORDERBOOK" as iorder
      where iorder."PRICE" >= ooder."PRICE"
    ) as "TOTAL"
  from "ORDERBOOK" as ooder
  where "IS_SELL" is false group by "PRICE";

create unique index "ORDERBOOK_IDX_VIEW_BUY_PRICE" 
  on "ORDERBOOK_IDX_VIEW_BUY" ("PRICE");
