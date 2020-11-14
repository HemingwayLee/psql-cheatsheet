-- up
create table "PROFILES" (
  "ID" SERIAL PRIMARY KEY NOT NULL,
  "NAME" VARCHAR(64) NOT NULL
);

create table "PROFILES_AUDITS" (
  "ID" SERIAL PRIMARY KEY NOT NULL,
  "PROFILE_ID" INT NOT NULL,
  "NAME_OLD" VARCHAR(64) NOT NULL,
  "NAME_NEW" VARCHAR(64) NOT NULL,
  "CHANGED_AT" TIMESTAMP NOT NULL
);

create or replace function "CFN_PROFILES_NAME_CHANGES"()
  returns trigger as
$BODY$
begin
 if NEW."NAME" <> OLD."NAME" then
 insert into "PROFILES_AUDITS"("ID", "PROFILE_ID", "NAME_OLD", "NAME_NEW", "CHANGED_AT")
 values(DEFAULT, OLD."ID", OLD."NAME", NEW."NAME", now());
 end if;

 return NEW;
end;
$BODY$
LANGUAGE plpgsql;

create trigger "TRI_NAME_CHANGES"
  before update
  on "PROFILES"
  for each row
  execute procedure "CFN_PROFILES_NAME_CHANGES"();

insert into "PROFILES" values(DEFAULT, 'James');
insert into "PROFILES" values(DEFAULT, 'Kenny');

-- down
drop trigger if exists "TRI_NAME_CHANGES" on "PROFILES";
drop function if exists "CFN_PROFILES_NAME_CHANGES"();
drop table if exists "PROFILES_AUDITS";
drop table if exists "PROFILES";
