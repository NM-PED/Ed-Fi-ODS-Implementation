
-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[LocalEducationAgencyTransportation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD [ChangeVersion] [BIGINT] CONSTRAINT LocalEducationAgencyTransportation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] DROP CONSTRAINT LocalEducationAgencyTransportation_DF_ChangeVersion;
ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ADD CONSTRAINT LocalEducationAgencyTransportation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StaffDevelopment]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StaffDevelopment] ADD [ChangeVersion] [BIGINT] CONSTRAINT StaffDevelopment_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StaffDevelopment] DROP CONSTRAINT StaffDevelopment_DF_ChangeVersion;
ALTER TABLE [nmped].[StaffDevelopment] ADD CONSTRAINT StaffDevelopment_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StaffEducationOrganizationVacancy]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StaffEducationOrganizationVacancy] ADD [ChangeVersion] [BIGINT] CONSTRAINT StaffEducationOrganizationVacancy_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StaffEducationOrganizationVacancy] DROP CONSTRAINT StaffEducationOrganizationVacancy_DF_ChangeVersion;
ALTER TABLE [nmped].[StaffEducationOrganizationVacancy] ADD CONSTRAINT StaffEducationOrganizationVacancy_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentCTEProgramAssociationCredential]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentCTEProgramAssociationCredential_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] DROP CONSTRAINT StudentCTEProgramAssociationCredential_DF_ChangeVersion;
ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ADD CONSTRAINT StudentCTEProgramAssociationCredential_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentEducationOrganizationAward]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentEducationOrganizationAward_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StudentEducationOrganizationAward] DROP CONSTRAINT StudentEducationOrganizationAward_DF_ChangeVersion;
ALTER TABLE [nmped].[StudentEducationOrganizationAward] ADD CONSTRAINT StudentEducationOrganizationAward_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentSpecialEducationAssociationEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentSpecialEducationAssociationEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] DROP CONSTRAINT StudentSpecialEducationAssociationEvent_DF_ChangeVersion;
ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ADD CONSTRAINT StudentSpecialEducationAssociationEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[StudentSpecialEducationProgramAssociationIEPDates]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationIEPDates] ADD [ChangeVersion] [BIGINT] CONSTRAINT StudentSpecialEducationProgramAssociationIEPDates_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationIEPDates] DROP CONSTRAINT StudentSpecialEducationProgramAssociationIEPDates_DF_ChangeVersion;
ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationIEPDates] ADD CONSTRAINT StudentSpecialEducationProgramAssociationIEPDates_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleMileage]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[VehicleMileage] ADD [ChangeVersion] [BIGINT] CONSTRAINT VehicleMileage_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[VehicleMileage] DROP CONSTRAINT VehicleMileage_DF_ChangeVersion;
ALTER TABLE [nmped].[VehicleMileage] ADD CONSTRAINT VehicleMileage_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmped].[VehicleSnapshot]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmped].[VehicleSnapshot] ADD [ChangeVersion] [BIGINT] CONSTRAINT VehicleSnapshot_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmped].[VehicleSnapshot] DROP CONSTRAINT VehicleSnapshot_DF_ChangeVersion;
ALTER TABLE [nmped].[VehicleSnapshot] ADD CONSTRAINT VehicleSnapshot_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


