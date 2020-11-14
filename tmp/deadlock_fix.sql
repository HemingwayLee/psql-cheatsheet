create table if not exists "RESULTS"(
  "NAME" varchar(16)
);


create or replace function "CFN_CONCURRENT"(
  "_SLEEP" int,
  "_INPUT" varchar(16)
) returns void as
$BODY$
  declare "_NAME" varchar(16);
begin
  lock table "MY_TABLE" in exclusive mode;
  lock table "RESULTS" in exclusive mode;

  create table if not exists "MY_TABLE"(
    "NAME" varchar(16)
  );

  raise notice 'insert % into table', "_INPUT";
  insert into "MY_TABLE" values("_INPUT");

  raise notice 'go to sleep...';
  perform pg_sleep("_SLEEP");

  insert into "RESULTS"
  select "NAME" from "MY_TABLE";

  -- this line create deadlock...
  truncate table "MY_TABLE";

end;
$BODY$
LANGUAGE plpgsql;