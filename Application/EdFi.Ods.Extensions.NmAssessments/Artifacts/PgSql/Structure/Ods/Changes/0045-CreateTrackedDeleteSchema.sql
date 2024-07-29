DO $$
BEGIN
    IF NOT EXISTS(
        SELECT schema_name
          FROM information_schema.schemata
          WHERE schema_name = 'tracked_deletes_nmassessments'
      )
    THEN
      EXECUTE 'CREATE SCHEMA tracked_deletes_nmassessments AUTHORIZATION postgres';
    END IF;

END
$$;
