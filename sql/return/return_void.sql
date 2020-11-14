CREATE OR REPLACE FUNCTION noReturn()
RETURNS VOID AS $$
DECLARE
  total INT;
BEGIN
  SELECT COUNT(*) INTO total FROM myapp_person;
  RAISE NOTICE 'number of row: %', total;
END
$$ LANGUAGE plpgsql;

