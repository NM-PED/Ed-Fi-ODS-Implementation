DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_nmped.annualreviewdelayreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.AnnualReviewDelayReasonDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.AnnualReviewDelayReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.AnnualReviewDelayReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'annualreviewdelayreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.annualreviewdelayreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.annualreviewdelayreasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.bepprogramlanguagedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.BEPProgramLanguageDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.BEPProgramLanguageDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.BEPProgramLanguageDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'bepprogramlanguagedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.bepprogramlanguagedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.bepprogramlanguagedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.datacollectionperioddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.DataCollectionPeriodDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.DataCollectionPeriodDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.DataCollectionPeriodDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'datacollectionperioddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.datacollectionperioddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.datacollectionperioddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.dentalexaminationverificationcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.DentalExaminationVerificationCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.DentalExaminationVerificationCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.DentalExaminationVerificationCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'dentalexaminationverificationcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.dentalexaminationverificationcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.dentalexaminationverificationcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.directcertificationstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.DirectCertificationStatusDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.DirectCertificationStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.DirectCertificationStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'directcertificationstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.directcertificationstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.directcertificationstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.expecteddiplomatypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ExpectedDiplomaTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.ExpectedDiplomaTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ExpectedDiplomaTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'expecteddiplomatypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.expecteddiplomatypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.expecteddiplomatypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.fostercustodialauthoritydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.FosterCustodialAuthorityDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.FosterCustodialAuthorityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.FosterCustodialAuthorityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'fostercustodialauthoritydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.fostercustodialauthoritydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.fostercustodialauthoritydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.genderidentitydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.GenderIdentityDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.GenderIdentityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.GenderIdentityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'genderidentitydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.genderidentitydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.genderidentitydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.industrycredentialdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.IndustryCredentialDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.IndustryCredentialDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.IndustryCredentialDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'industrycredentialdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.industrycredentialdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.industrycredentialdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.levelofeducationinstitutiondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.LevelOfEducationInstitutionDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.LevelOfEducationInstitutionDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.LevelOfEducationInstitutionDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'levelofeducationinstitutiondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.levelofeducationinstitutiondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.levelofeducationinstitutiondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.levelofintegrationdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.LevelOfIntegrationDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.LevelOfIntegrationDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.LevelOfIntegrationDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'levelofintegrationdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.levelofintegrationdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.levelofintegrationdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.localeducationagencytransportation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.categorydescriptor01transportationcategorydescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.categorydescriptor02transportationcategorydescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.transportationsetcodedescriptorid;

    INSERT INTO tracked_changes_nmped.localeducationagencytransportation(
        oldcategorydescriptor01transportationcategorydescriptorid, oldcategorydescriptor01transportationcategorydescriptornamespace, oldcategorydescriptor01transportationcategorydescriptorcodevalue, oldcategorydescriptor02transportationcategorydescriptorid, oldcategorydescriptor02transportationcategorydescriptornamespace, oldcategorydescriptor02transportationcategorydescriptorcodevalue, oldlocaleducationagencyid, oldtransportationsetcodedescriptorid, oldtransportationsetcodedescriptornamespace, oldtransportationsetcodedescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.categorydescriptor01transportationcategorydescriptorid, dj0.namespace, dj0.codevalue, OLD.categorydescriptor02transportationcategorydescriptorid, dj1.namespace, dj1.codevalue, OLD.localeducationagencyid, OLD.transportationsetcodedescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'localeducationagencytransportation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.localeducationagencytransportation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.localeducationagencytransportation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.medalertdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.MedAlertDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.MedAlertDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.MedAlertDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'medalertdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.medalertdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.medalertdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.mepprojecttypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.MEPProjectTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.MEPProjectTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.MEPProjectTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'mepprojecttypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.mepprojecttypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.mepprojecttypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.mileagetypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.MileageTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.MileageTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.MileageTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'mileagetypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.mileagetypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.mileagetypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.militaryfamilydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.MilitaryFamilyDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.MilitaryFamilyDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.MilitaryFamilyDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'militaryfamilydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.militaryfamilydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.militaryfamilydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.nmpedclassperioddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.NMPEDClassPeriodDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.NMPEDClassPeriodDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.NMPEDClassPeriodDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'nmpedclassperioddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.nmpedclassperioddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.nmpedclassperioddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.participationinformationdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ParticipationInformationDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.ParticipationInformationDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ParticipationInformationDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'participationinformationdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.participationinformationdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.participationinformationdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.plannedpostgraduateactivitydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PlannedPostGraduateActivityDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.PlannedPostGraduateActivityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PlannedPostGraduateActivityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'plannedpostgraduateactivitydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.plannedpostgraduateactivitydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.plannedpostgraduateactivitydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.prekclasstypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PreKClassTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.PreKClassTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PreKClassTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'prekclasstypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.prekclasstypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.prekclasstypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.primaryareaofexceptionalitydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PrimaryAreaOfExceptionalityDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.PrimaryAreaOfExceptionalityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PrimaryAreaOfExceptionalityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'primaryareaofexceptionalitydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.primaryareaofexceptionalitydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.primaryareaofexceptionalitydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.programdeliverymethoddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ProgramDeliveryMethodDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.ProgramDeliveryMethodDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ProgramDeliveryMethodDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'programdeliverymethoddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.programdeliverymethoddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.programdeliverymethoddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.programintensitydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ProgramIntensityDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.ProgramIntensityDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ProgramIntensityDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'programintensitydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.programintensitydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.programintensitydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.restrainttypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RestraintTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.RestraintTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RestraintTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'restrainttypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.restrainttypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.restrainttypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.roadtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RoadTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.RoadTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RoadTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'roadtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.roadtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.roadtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.specialeducationeventreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationEventReasonDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.SpecialEducationEventReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationEventReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'specialeducationeventreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.specialeducationeventreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.specialeducationeventreasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.specialeducationeventtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationEventTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.SpecialEducationEventTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationEventTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'specialeducationeventtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.specialeducationeventtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.specialeducationeventtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.specialeducationnoncompliancereasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationNonComplianceReasonDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.SpecialEducationNonComplianceReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationNonComplianceReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'specialeducationnoncompliancereasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.specialeducationnoncompliancereasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.specialeducationnoncompliancereasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.specialeducationreferralcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialEducationReferralCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.SpecialEducationReferralCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialEducationReferralCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'specialeducationreferralcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.specialeducationreferralcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.specialeducationreferralcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.specialprogramcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SpecialProgramCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.SpecialProgramCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SpecialProgramCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'specialprogramcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.specialprogramcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.specialprogramcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.staffdevelopment_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.staff%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.staff j0 WHERE staffusi = old.staffusi;

    INSERT INTO tracked_changes_nmped.staffdevelopment(
        oldeducationorganizationid, oldstaffusi, oldstaffuniqueid, oldstartdate,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.staffusi, dj0.staffuniqueid, OLD.startdate, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'staffdevelopment') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.staffdevelopment 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.staffdevelopment_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.staffdevelopmentactivitycodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.StaffDevelopmentActivityCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.StaffDevelopmentActivityCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.StaffDevelopmentActivityCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'staffdevelopmentactivitycodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.staffdevelopmentactivitycodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.staffdevelopmentactivitycodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.staffdevelopmentpurposecodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.StaffDevelopmentPurposeCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.StaffDevelopmentPurposeCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.StaffDevelopmentPurposeCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'staffdevelopmentpurposecodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.staffdevelopmentpurposecodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.staffdevelopmentpurposecodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.staffeducationorganizationvacancy_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.datacollectionperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.vacancygroupdescriptorid;

    INSERT INTO tracked_changes_nmped.staffeducationorganizationvacancy(
        olddatacollectionperioddescriptorid, olddatacollectionperioddescriptornamespace, olddatacollectionperioddescriptorcodevalue, oldlocaleducationagencyid, oldschoolyear, oldvacancygroupdescriptorid, oldvacancygroupdescriptornamespace, oldvacancygroupdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.datacollectionperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.localeducationagencyid, OLD.schoolyear, OLD.vacancygroupdescriptorid, dj1.namespace, dj1.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'staffeducationorganizationvacancy') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.staffeducationorganizationvacancy 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.staffeducationorganizationvacancy_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.studentawardtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.StudentAwardTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.StudentAwardTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.StudentAwardTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'studentawardtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.studentawardtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.studentawardtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.studentcteprogramassociationcredential_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.industrycredentialdescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.programdeliverymethoddescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.programtypedescriptorid;

    SELECT INTO dj3 * FROM edfi.student j3 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_nmped.studentcteprogramassociationcredential(
        oldbegindate, oldcredentialearneddate, oldeducationorganizationid, oldindustrycredentialdescriptorid, oldindustrycredentialdescriptornamespace, oldindustrycredentialdescriptorcodevalue, oldprogramdeliverymethoddescriptorid, oldprogramdeliverymethoddescriptornamespace, oldprogramdeliverymethoddescriptorcodevalue, oldprogrameducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.credentialearneddate, OLD.educationorganizationid, OLD.industrycredentialdescriptorid, dj0.namespace, dj0.codevalue, OLD.programdeliverymethoddescriptorid, dj1.namespace, dj1.codevalue, OLD.programeducationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj2.namespace, dj2.codevalue, OLD.studentusi, dj3.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'studentcteprogramassociationcredential') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.studentcteprogramassociationcredential 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.studentcteprogramassociationcredential_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.studenteducationorganizationaward_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.studentawardlanguagedescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.studentawardtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.student j2 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_nmped.studenteducationorganizationaward(
        oldawarddate, oldeducationorganizationid, oldschoolyear, oldstudentawardlanguagedescriptorid, oldstudentawardlanguagedescriptornamespace, oldstudentawardlanguagedescriptorcodevalue, oldstudentawardtypedescriptorid, oldstudentawardtypedescriptornamespace, oldstudentawardtypedescriptorcodevalue, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.awarddate, OLD.educationorganizationid, OLD.schoolyear, OLD.studentawardlanguagedescriptorid, dj0.namespace, dj0.codevalue, OLD.studentawardtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.studentusi, dj2.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'studenteducationorganizationaward') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.studenteducationorganizationaward 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.studenteducationorganizationaward_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.studentspecialeducationassociationevent_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.programtypedescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.specialeducationeventtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.student j2 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_nmped.studentspecialeducationassociationevent(
        oldbegindate, oldeducationorganizationid, oldeventdate, oldprogrameducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue, oldspecialeducationeventtypedescriptorid, oldspecialeducationeventtypedescriptornamespace, oldspecialeducationeventtypedescriptorcodevalue, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.educationorganizationid, OLD.eventdate, OLD.programeducationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.specialeducationeventtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.studentusi, dj2.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'studentspecialeducationassociationevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.studentspecialeducationassociationevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.studentspecialeducationassociationevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.studentspecialeducationprogramassociationiepdates_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.programtypedescriptorid;

    SELECT INTO dj1 * FROM edfi.student j1 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_nmped.studentspecialeducationprogramassociationiepdates(
        oldbegindate, oldeducationorganizationid, oldiepbegindate, oldprogrameducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.educationorganizationid, OLD.iepbegindate, OLD.programeducationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.studentusi, dj1.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'studentspecialeducationprogramassociationiepdates') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.studentspecialeducationprogramassociationiepdates 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.studentspecialeducationprogramassociationiepdates_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.transportationcategorydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.TransportationCategoryDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.TransportationCategoryDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.TransportationCategoryDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'transportationcategorydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.transportationcategorydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.transportationcategorydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.transportationsetcodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.TransportationSetCodeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.TransportationSetCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.TransportationSetCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'transportationsetcodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.transportationsetcodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.transportationsetcodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.triennialreviewdelayreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.TriennialReviewDelayReasonDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.TriennialReviewDelayReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.TriennialReviewDelayReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'triennialreviewdelayreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.triennialreviewdelayreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.triennialreviewdelayreasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vacancygroupdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VacancyGroupDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VacancyGroupDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VacancyGroupDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vacancygroupdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vacancygroupdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vacancygroupdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehiclebodymanufacturerdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VehicleBodyManufacturerDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VehicleBodyManufacturerDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VehicleBodyManufacturerDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclebodymanufacturerdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehiclebodymanufacturerdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehiclebodymanufacturerdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehiclechassismanufacturerdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VehicleChassisManufacturerDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VehicleChassisManufacturerDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VehicleChassisManufacturerDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclechassismanufacturerdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehiclechassismanufacturerdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehiclechassismanufacturerdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehiclefueltypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VehicleFuelTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VehicleFuelTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VehicleFuelTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclefueltypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehiclefueltypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehiclefueltypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehiclemileage_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.mileagetypedescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.roadtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.vehicleroutedescriptorid;

    INSERT INTO tracked_changes_nmped.vehiclemileage(
        oldlocaleducationagencyid, oldmileagetypedescriptorid, oldmileagetypedescriptornamespace, oldmileagetypedescriptorcodevalue, oldreportingdate, oldroadtypedescriptorid, oldroadtypedescriptornamespace, oldroadtypedescriptorcodevalue, oldvehicleid, oldvehicleroutedescriptorid, oldvehicleroutedescriptornamespace, oldvehicleroutedescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.localeducationagencyid, OLD.mileagetypedescriptorid, dj0.namespace, dj0.codevalue, OLD.reportingdate, OLD.roadtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.vehicleid, OLD.vehicleroutedescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclemileage') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehiclemileage 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehiclemileage_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehicleroutedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VehicleRouteDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VehicleRouteDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VehicleRouteDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehicleroutedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehicleroutedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehicleroutedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehiclesnapshot_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_nmped.vehiclesnapshot(
        oldlocaleducationagencyid, oldschoolyear, oldvehicleid, oldvehicleidentificationnumber,
        id, discriminator, changeversion)
    VALUES (
        OLD.localeducationagencyid, OLD.schoolyear, OLD.vehicleid, OLD.vehicleidentificationnumber, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehiclesnapshot') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehiclesnapshot 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehiclesnapshot_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_nmped.vehicletypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.VehicleTypeDescriptorId, b.codevalue, b.namespace, b.id, 'nmped.VehicleTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.VehicleTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'nmped' AND event_object_table = 'vehicletypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON nmped.vehicletypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_nmped.vehicletypedescriptor_deleted();
END IF;

END
$$;
