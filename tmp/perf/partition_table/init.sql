create table if not exists "ORDERBOOK" (
  "ID_ORDER" uuid primary key not null,
  "PRICE" decimal(21, 2) not null,
  "SIZE" decimal(21, 2) not null,
  "IS_SELL" boolean not null,
  "PAIR" varchar(16) not null
);

create table "ORDERBOOK_JPY_LTC" (
  check ("PAIR" = 'JPY_LTC')
) inherits ("ORDERBOOK");

create table "ORDERBOOK_USD_DOG" (
  check ("PAIR" = 'USD_DOG')
) inherits ("ORDERBOOK");

create table "ORDERBOOK_BTC_XRP" (
  check ("PAIR" = 'BTC_XRP')
) inherits ("ORDERBOOK");

create index "IDX_ORDERBOOK_BTC_XRP" on "ORDERBOOK_BTC_XRP" ("PAIR");
create index "IDX_ORDERBOOK_USD_DOG" on "ORDERBOOK_USD_DOG" ("PAIR");
create index "IDX_ORDERBOOK_JPY_LTC" on "ORDERBOOK_JPY_LTC" ("PAIR");

create or replace function "CFN_ORDERBOOK_INSERT"()
returns trigger as $$
begin
  if (NEW."PAIR" = 'BTC_XRP') then
    insert into "ORDERBOOK_BTC_XRP" values (NEW.*);
  elsif (NEW."PAIR" = 'USD_DOG') then
    insert into "ORDERBOOK_USD_DOG" values (NEW.*);
  elsif (NEW."PAIR" = 'JPY_LTC') then
    insert into "ORDERBOOK_JPY_LTC" values (NEW.*);
  else
    raise exception 'Pair not exist...';
  end if;
  return null;
end;
$$
language plpgsql;

create trigger "TRI_ORDERBOOK_INSERT"
  before insert on "ORDERBOOK"
  for each row execute procedure "CFN_ORDERBOOK_INSERT"();
