-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='localeducationagencytransportation' AND column_name='changeversion') THEN
ALTER TABLE nmped.LocalEducationAgencyTransportation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.LocalEducationAgencyTransportation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='staffdevelopment' AND column_name='changeversion') THEN
ALTER TABLE nmped.StaffDevelopment ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StaffDevelopment ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='staffeducationorganizationvacancy' AND column_name='changeversion') THEN
ALTER TABLE nmped.StaffEducationOrganizationVacancy ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StaffEducationOrganizationVacancy ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='studentcteprogramassociationcredential' AND column_name='changeversion') THEN
ALTER TABLE nmped.StudentCTEProgramAssociationCredential ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StudentCTEProgramAssociationCredential ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='studenteducationorganizationaward' AND column_name='changeversion') THEN
ALTER TABLE nmped.StudentEducationOrganizationAward ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StudentEducationOrganizationAward ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='studentspecialeducationassociationevent' AND column_name='changeversion') THEN
ALTER TABLE nmped.StudentSpecialEducationAssociationEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StudentSpecialEducationAssociationEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='studentspecialeducationprogramassociationiepdates' AND column_name='changeversion') THEN
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationIEPDates ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.StudentSpecialEducationProgramAssociationIEPDates ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='vehiclemileage' AND column_name='changeversion') THEN
ALTER TABLE nmped.VehicleMileage ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.VehicleMileage ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='nmped' AND table_name='vehiclesnapshot' AND column_name='changeversion') THEN
ALTER TABLE nmped.VehicleSnapshot ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE nmped.VehicleSnapshot ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

END
$$;
