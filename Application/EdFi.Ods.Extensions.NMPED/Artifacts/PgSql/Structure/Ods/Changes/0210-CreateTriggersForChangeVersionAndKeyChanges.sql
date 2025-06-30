DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'localeducationagencytransportation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.localeducationagencytransportation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'staffdevelopment') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.staffdevelopment
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'staffeducationorganizationvacancy') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.staffeducationorganizationvacancy
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'studentcteprogramassociationcredential') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.studentcteprogramassociationcredential
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'studenteducationorganizationaward') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.studenteducationorganizationaward
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'studentspecialeducationassociationevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.studentspecialeducationassociationevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'studentspecialeducationprogramassociationiepdates') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.studentspecialeducationprogramassociationiepdates
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclemileage') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.vehiclemileage
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclesnapshot') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON nmped.vehiclesnapshot
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
