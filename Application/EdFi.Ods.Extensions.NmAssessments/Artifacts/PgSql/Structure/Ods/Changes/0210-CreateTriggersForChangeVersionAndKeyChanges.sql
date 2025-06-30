DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmassessments' AND event_object_table = 'nmstudentassessment') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmassessments.nmstudentassessment
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
