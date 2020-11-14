-- up
create table "PROFILES" (
  "ID" int,
  "NAME" varchar
);

insert into "PROFILES"("ID", "NAME") values(1, 'kenny');
insert into "PROFILES"("ID", "NAME") values(2, 'ken');

--test
DO language plpgsql $$
declare "_VAR" int;
BEGIN
  select "ID" from "PROFILES" where "NAME" = 'ken' into "_VAR";
  RAISE NOTICE 'variable: %', "_VAR";
END
$$;

--down
drop table "PROFILES";

-- \i '/Users/Rosemary/Desktop/code/sql/variable2.sql'