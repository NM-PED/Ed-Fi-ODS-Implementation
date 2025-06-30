DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_nmassessments.itemdescriptioncodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ItemDescriptionCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmassessments.ItemDescriptionCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ItemDescriptionCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmassessments' AND event_object_table = 'itemdescriptioncodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.itemdescriptioncodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmassessments.itemdescriptioncodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmassessments.nmstudentassessment_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.student%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.itemdescriptioncodedescriptorid;

    SELECT INTO dj1 * FROM edfi.student j1 WHERE studentusi = old.studentusi;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.testdescriptiondescriptorid;

    INSERT INTO tracked_changes_nmassessments.nmstudentassessment(
        oldeducationorganizationid, olditemdescriptioncodedescriptorid, olditemdescriptioncodedescriptornamespace, olditemdescriptioncodedescriptorcodevalue, oldstudentusi, oldstudentuniqueid, oldtestdate, oldtestdescriptiondescriptorid, oldtestdescriptiondescriptornamespace, oldtestdescriptiondescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.itemdescriptioncodedescriptorid, dj0.namespace, dj0.codevalue, OLD.studentusi, dj1.studentuniqueid, OLD.testdate, OLD.testdescriptiondescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmassessments' AND event_object_table = 'nmstudentassessment') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.nmstudentassessment 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmassessments.nmstudentassessment_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmassessments.scoringmodelcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ScoringModelCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmassessments.ScoringModelCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ScoringModelCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmassessments' AND event_object_table = 'scoringmodelcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.scoringmodelcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmassessments.scoringmodelcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmassessments.standardachievedcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.StandardAchievedCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmassessments.StandardAchievedCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.StandardAchievedCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmassessments' AND event_object_table = 'standardachievedcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.standardachievedcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmassessments.standardachievedcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmassessments.testdescriptiondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.TestDescriptionDescriptorId, b.codevalue, b.namespace, b.id, 'nmassessments.TestDescriptionDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.TestDescriptionDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmassessments' AND event_object_table = 'testdescriptiondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmassessments.testdescriptiondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmassessments.testdescriptiondescriptor_deleted();
END IF;

END
$$;
