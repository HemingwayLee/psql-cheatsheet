-- up
create table "PROFILES" (
  "ID" SERIAL NOT NULL PRIMARY KEY,
  "FIRST" VARCHAR(64) NOT NULL,
  "LAST" VARCHAR(64) NOT NULL,
  "COUNTRY_ID" INT NOT NULL
);

create table "COUNTRIES" (
  "ID" SERIAL NOT NULL PRIMARY KEY,
  "NAME" VARCHAR(64) NOT NULL
);

create table "JOINEDTBL" (
  "ID" SERIAL NOT NULL PRIMARY KEY,
  "FIRST" VARCHAR(64) NOT NULL,
  "LAST" VARCHAR(64) NOT NULL,
  "COUNTRY" VARCHAR(64) NOT NULL
);

alter table "PROFILES" add constraint "FK_COUNTRY_PROFILES" FOREIGN KEY("COUNTRY_ID") REFERENCES "COUNTRIES"("ID") ON UPDATE CASCADE ON DELETE CASCADE;

insert into "COUNTRIES" values(DEFAULT, 'China');
insert into "COUNTRIES" values(DEFAULT, 'Japan');

insert into "PROFILES" values(DEFAULT, 'Chris', 'Lee', 1);
insert into "PROFILES" values(DEFAULT, 'Kenny', 'Lee', 1);
insert into "PROFILES" values(DEFAULT, 'James', 'Lee', 2);
insert into "PROFILES" values(DEFAULT, 'Kristof', 'Lee', 2);
insert into "PROFILES" values(DEFAULT, 'Hemingway', 'Lee', 1);

insert into "JOINEDTBL" values(DEFAULT, 'Chris', 'Lee', 'China');
insert into "JOINEDTBL" values(DEFAULT, 'Kenny', 'Lee', 'China');
insert into "JOINEDTBL" values(DEFAULT, 'James', 'Lee', 'Japan');
insert into "JOINEDTBL" values(DEFAULT, 'Kristof', 'Lee', 'Japan');
insert into "JOINEDTBL" values(DEFAULT, 'Hemingway', 'Lee', 'China');

EXPLAIN (ANALYZE ON, BUFFERS ON) select * from "PROFILES" as P inner join "COUNTRIES" as C ON P."COUNTRY_ID" = C."ID";

EXPLAIN (ANALYZE ON, BUFFERS ON) select * from "JOINEDTBL";

-- down
alter table "PROFILES" drop constraint "FK_COUNTRY_PROFILES";
drop table "JOINEDTBL";
drop table "COUNTRIES";
drop table "PROFILES";





