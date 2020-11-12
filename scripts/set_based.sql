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
  --cursor
  declare "_REC" record;
  declare "_CUR" cursor for select * from "TMP";
begin
  
  select 300000 into "_COUNT";
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

  select timeofday()::timestamp into "_START_TIME";
    update "TMP"
    set "IS_BLOCK" = true
    where "LOGIN_TIMES" > 9;
  raise notice 'Total time for set-based approach: %', (timeofday()::timestamp - "_START_TIME");

  select timeofday()::timestamp into "_START_TIME";
    open "_CUR";
    loop
      fetch "_CUR" into "_REC";
      exit when not found;
      if "_REC"."LOGIN_TIMES" > 9 then
        update "TMP" set "IS_BLOCK" = true where "ID" = "_REC"."ID";
      end if;
    end loop;
    close "_CUR";
  raise notice 'Total time for procedural approach: %', (timeofday()::timestamp - "_START_TIME");

end;
$$;

-- down
drop table "TMP";


-- now() returns the start time of the current transaction; their values do not change during the transaction