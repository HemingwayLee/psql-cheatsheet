CREATE OR REPLACE FUNCTION tmp_func(
  tmp_subtitle VARCHAR(255),
  tmp_title VARCHAR(255),
  tmp_apply_to VARCHAR(255)
)
RETURNS TABLE(
  id INT, 
  subtitle VARCHAR(255),
  title VARCHAR(255),
  result VARCHAR(255),
  apply_to VARCHAR(255)
) AS
$func$
BEGIN
   RETURN QUERY SELECT 
      tmp.id, 
      tmp.subtitle, 
      tmp.title,
      tmp.result,
      tmp.apply_to
    FROM tmp
    WHERE 
      tmp.subtitle = tmp_subtitle
      AND tmp.title = tmp_title
      AND (tmp.apply_to = tmp_apply_to OR tmp.apply_to = 'MAIN');
END
$func$ LANGUAGE plpgsql;
