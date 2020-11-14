DO language plpgsql $$
declare "_VAR" int;
BEGIN
  select 5 into "_VAR";
  RAISE NOTICE 'variable: %', "_VAR";
END
$$;

-- \i '/Users/Rosemary/Desktop/code/sql/variable.sql'