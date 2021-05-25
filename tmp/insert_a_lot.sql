-- up
CREATE TABLE IF NOT EXISTS tmp(
  id SERIAL,
  subtitle VARCHAR(255),
  title VARCHAR(255),
  result VARCHAR(255),
  apply_to VARCHAR(255)
);
CREATE INDEX IF NOT EXISTS idx_title_tmp ON tmp (subtitle, title);
TRUNCATE TABLE tmp;

-- test
DO LANGUAGE plpgsql $$
  DECLARE _row_count INT;
  DECLARE _data_count INT;
  DECLARE _supporting_count INT;
  DECLARE _start_time TIMESTAMP;
  DECLARE _subtitle VARCHAR(255);
  DECLARE _title VARCHAR(255);
  DECLARE _result VARCHAR(255);
BEGIN
  SELECT timeofday()::TIMESTAMP INTO _start_time;

    SELECT 29000 INTO _data_count;
    WHILE _data_count > 0 LOOP
      SELECT substr(md5(random()::text), 0, 15) INTO _subtitle;
      SELECT substr(md5(random()::text), 0, 15) INTO _title;
      SELECT substr(md5(random()::text), 0, 15) INTO _result;

      INSERT INTO tmp
      VALUES(
        default,
        _subtitle,
        _title,
        _result,
        'MAIN'
      );

      SELECT 100 INTO _supporting_count;
      WHILE _supporting_count > 0 LOOP
        IF random() > 0.75 THEN
          INSERT INTO tmp
          VALUES(
            default,
            _subtitle,
            _title,
            substr(md5(random()::text), 0, 15),
            _supporting_count::TEXT
          );
        END IF;
        _supporting_count = _supporting_count - 1;
      END LOOP;

      _data_count = _data_count - 1;
    END LOOP;
  RAISE NOTICE 'Total time for setup: %', (timeofday()::TIMESTAMP - _start_time);


  -- SELECT timeofday()::TIMESTAMP INTO _start_time;
  --   SELECT COUNT(*) FROM tmp INTO _row_count;
  --   RAISE NOTICE 'Total row count: %', (_row_count);
  -- RAISE NOTICE 'Total time for query: %', (timeofday()::TIMESTAMP - _start_time);
END;
$$;

-- down
-- DROP TABLE tmp;


-- now() returns the start time of the current transaction; their values do not change during the transaction

