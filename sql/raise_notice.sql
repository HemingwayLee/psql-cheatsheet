DO language plpgsql $$
BEGIN
  RAISE NOTICE 'hello, world!';
  RAISE NOTICE 'hello, world! %', 5566;
END
$$;

-- ref:
-- https://stackoverflow.com/questions/18828127/how-to-raise-a-notice-in-postgresql
