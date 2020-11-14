--up
create table "TMP"(
  "ID" int,
  "NAME" varchar(255)
);

insert into "TMP" values(1, 'Kenny');

create or replace function "CFN_RETURN"(
  "_PARAM" boolean
) returns table(
  "ID" int,
  "NAME" varchar(255)
) as
$BODY$
begin
  if "_PARAM" then
    return query
    select tmp."ID", tmp."NAME"
    from "TMP" as tmp;
  else
    return query
    select 2, 'Rose'::varchar;
  end if;
end;
$BODY$
LANGUAGE plpgsql;

--test
select "CFN_RETURN"(true);
select "CFN_RETURN"(false);

--down
drop function "CFN_RETURN"(boolean);
drop table "TMP";