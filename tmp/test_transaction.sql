--up
-- Are postgresql functions transactional? yes

create table "TLB" (
  "ID" int primary key not null,
  "NAME" varchar(64) not null
);

create or replace function "CFN_TRANSACTION"()
returns void as
$BODY$
begin
  insert into "TLB"("ID", "NAME") values(1, 'kenny');
  insert into "TLB"("ID", "NAME") values(2, 'james');
  insert into "TLB"("ID", "NAME") values(1, 'chris');
end;
$BODY$
LANGUAGE plpgsql;

--test
select "CFN_TRANSACTION"();
select * from "TLB";

--down
drop function "CFN_TRANSACTION"();
drop table "TLB";

-- \i '/Users/Rosemary/Desktop/code/sql/test_transaction.sql'