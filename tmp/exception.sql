--up
create or replace function "CFN_TEST_EXCEPTION"(
  "_PARAM" int
) returns boolean as
$BODY$
begin
  if (5 / "_PARAM" = 1) then
    return true;
  else
    return false;
  end if;
exception
  when division_by_zero then
    raise notice 'divided by zero';
    return false;
end;
$BODY$
LANGUAGE plpgsql;

--test
select "CFN_TEST_EXCEPTION"(5);
select "CFN_TEST_EXCEPTION"(0);

--down
drop function "CFN_TEST_EXCEPTION"(int);