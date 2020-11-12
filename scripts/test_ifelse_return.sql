--up
create or replace function "CFN_TEST_IFELSE"(
  "_PARAM" varchar
) returns boolean as
$BODY$
begin
  if "_PARAM" = 'ABC' then
    return true;
  else
    return false;
  end if;
end;
$BODY$
LANGUAGE plpgsql;

--test
select "CFN_TEST_IFELSE"('ABC');
select "CFN_TEST_IFELSE"('DEF');

--down
drop function "CFN_TEST_IFELSE"(varchar);

-- \i '/Users/Rosemary/Desktop/code/sql/ifelse_return.sql'