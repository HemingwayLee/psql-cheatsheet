-- up
create table "MIGRATION_AUDITS" (
  "ID" SERIAL PRIMARY KEY not null,
  "ACCOUNT_NAME" VARCHAR(255) not null,
  "ORIGINAL_MRE_ACCOUNT" UUID null,
  "ORIGINAL_MIGRATED_AT" TIMESTAMP null,
  "CHANGED_AT" TIMESTAMP not null
);

create or replace function "CFN_AUTH_MIGRATION_CHANGES"()
  returns trigger as
$BODY$
begin
 if NEW."ID_MR_EXCHANGE_ACCOUNT" is null and NEW."MIGRATED_AT" is null then
 insert into "MIGRATION_AUDITS" (
  "ID",
  "ACCOUNT_NAME",
  "ORIGINAL_MRE_ACCOUNT",
  "ORIGINAL_MIGRATED_AT",
  "CHANGED_AT")
 values (
  DEFAULT,
  OLD."ACCOUNT_NAME",
  OLD."ID_MR_EXCHANGE_ACCOUNT",
  OLD."MIGRATED_AT",
  now());
 end if;

 return NEW;
end;
$BODY$
LANGUAGE plpgsql;

create trigger "TRI_MIGRATION_CHANGES"
  before update
  on "MR_AUTH_ACCOUNTS"
  for each row
  execute procedure "CFN_AUTH_MIGRATION_CHANGES"();
