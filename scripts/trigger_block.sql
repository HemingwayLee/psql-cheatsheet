-- up
create table "PROFILES" (
  "ID" SERIAL PRIMARY KEY NOT NULL,
  "NAME" VARCHAR(64) NOT NULL
);

create or replace function "CFN_PROFILES_NAME_CHANGES"()
  returns trigger as
$BODY$
begin
  raise notice 'after insert';
  perform pg_sleep(12);
  return null;
end;
$BODY$
LANGUAGE plpgsql;

create trigger "TRI_NAME_CHANGES"
  after insert
  on "PROFILES"
  for each row
  execute procedure "CFN_PROFILES_NAME_CHANGES"();

insert into "PROFILES" values(DEFAULT, 'James');
insert into "PROFILES" values(DEFAULT, 'Kenny');

-- down
drop trigger if exists "TRI_NAME_CHANGES" on "PROFILES";
drop function if exists "CFN_PROFILES_NAME_CHANGES"();
drop table if exists "PROFILES";


-- \i '/Users/Rosemary/Desktop/code/sql/trigger_block.sql'