-- up
create table "TOTP_AUDITS" (
  "ID" SERIAL PRIMARY KEY not null,
  "ACCOUNT_NAME" VARCHAR(255) not null,
  "ORIGINAL_TOTP" VARCHAR(17) null,
  "CHANGED_AT" TIMESTAMP not null
);

create or replace function "CFN_AUTH_TOTP_CHANGES"()
  returns trigger as
$BODY$
begin
 if NEW."TOTP" is distinct from OLD."TOTP" then
 insert into "TOTP_AUDITS"("ID", "ACCOUNT_NAME", "ORIGINAL_TOTP", "CHANGED_AT")
 values(DEFAULT, OLD."ACCOUNT_NAME", OLD."TOTP", now());
 end if;

 return NEW;
end;
$BODY$
LANGUAGE plpgsql;

create trigger "TRI_TOTP_CHANGES"
  before update
  on "MR_AUTH_ACCOUNTS"
  for each row
  execute procedure "CFN_AUTH_TOTP_CHANGES"();
