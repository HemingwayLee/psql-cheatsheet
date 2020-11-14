CREATE OR REPLACE FUNCTION totalRec()
RETURNS INT AS $total$
DECLARE
  total INT;
BEGIN
  SELECT COUNT(*) INTO total FROM myapp_person;
  RETURN total;
END
$total$ LANGUAGE plpgsql;

