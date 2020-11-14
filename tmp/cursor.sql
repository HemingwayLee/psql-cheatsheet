--up
create table "STUDENTS"(
  "ID" int,
  "EMAIL" varchar(255)
);

insert into "STUDENTS" values(1, 'abc@mail.com');
insert into "STUDENTS" values(2, 'ggyy@mail.com');

-- test
do language plpgsql $$
  declare "_REC" record;
  declare "_CUR" cursor for select * from "STUDENTS";
begin
  open "_CUR";
  loop
    fetch "_CUR" into "_REC";
    exit when not found;
    raise notice 'Email: %', "_REC"."EMAIL";
  end loop;
  close "_CUR";
end
$$;

--down
drop table "STUDENTS";