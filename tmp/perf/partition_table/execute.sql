select * from "ORDERBOOK";
set constraint_exclusion = on; --default is on
explain select * from "ORDERBOOK" where "PAIR" = 'JPY_LTC';

set constraint_exclusion = off;
explain select * from "ORDERBOOK" where "PAIR" = 'JPY_LTC';

select * from "ORDERBOOK_JPY_LTC"