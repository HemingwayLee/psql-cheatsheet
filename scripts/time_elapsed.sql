-- up
create table if not exists "TMP"(
  "ID" int,
  "NAME" varchar(255),
  "LOGIN_TIMES" int,
  "IS_BLOCK" boolean
);
create index if not exists "IDX_LOGIN_TIMES" on "TMP" ("LOGIN_TIMES");
truncate table "TMP";

-- test
do language plpgsql $$
  declare "_COUNT" int;
  declare "_START_TIME" timestamp;
begin
  select timeofday()::timestamp into "_START_TIME";
    select 30000 into "_COUNT";

    while "_COUNT" > 0 loop
      insert into "TMP"
      values(
        default,
        substr(md5(random()::text), 0, 15),
        random() * 9 + 1,
        false
      );

      "_COUNT" = "_COUNT" - 1;
    end loop;

  raise notice 'Total time for inserting data: %', (timeofday()::timestamp - "_START_TIME");
end;
$$;

-- down
drop table "TMP";


-- now() returns the start time of the current transaction; their values do not change during the transaction