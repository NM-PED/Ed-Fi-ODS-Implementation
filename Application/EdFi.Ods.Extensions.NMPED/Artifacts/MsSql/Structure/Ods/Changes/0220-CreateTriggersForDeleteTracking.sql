DROP TRIGGER IF EXISTS [nmped].[nmped_AnnualReviewDelayReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_AnnualReviewDelayReasonDescriptor_TR_DeleteTracking] ON [nmped].[AnnualReviewDelayReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AnnualReviewDelayReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.AnnualReviewDelayReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AnnualReviewDelayReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[AnnualReviewDelayReasonDescriptor] ENABLE TRIGGER [nmped_AnnualReviewDelayReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_BEPProgramLanguageDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_BEPProgramLanguageDescriptor_TR_DeleteTracking] ON [nmped].[BEPProgramLanguageDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.BEPProgramLanguageDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.BEPProgramLanguageDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BEPProgramLanguageDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[BEPProgramLanguageDescriptor] ENABLE TRIGGER [nmped_BEPProgramLanguageDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_DataCollectionPeriodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_DataCollectionPeriodDescriptor_TR_DeleteTracking] ON [nmped].[DataCollectionPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.DataCollectionPeriodDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.DataCollectionPeriodDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DataCollectionPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DataCollectionPeriodDescriptor] ENABLE TRIGGER [nmped_DataCollectionPeriodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_DentalExaminationVerificationCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_DentalExaminationVerificationCodeDescriptor_TR_DeleteTracking] ON [nmped].[DentalExaminationVerificationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.DentalExaminationVerificationCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.DentalExaminationVerificationCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DentalExaminationVerificationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DentalExaminationVerificationCodeDescriptor] ENABLE TRIGGER [nmped_DentalExaminationVerificationCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_DirectCertificationStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_DirectCertificationStatusDescriptor_TR_DeleteTracking] ON [nmped].[DirectCertificationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.DirectCertificationStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.DirectCertificationStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DirectCertificationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[DirectCertificationStatusDescriptor] ENABLE TRIGGER [nmped_DirectCertificationStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_ExpectedDiplomaTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_ExpectedDiplomaTypeDescriptor_TR_DeleteTracking] ON [nmped].[ExpectedDiplomaTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ExpectedDiplomaTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.ExpectedDiplomaTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ExpectedDiplomaTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ExpectedDiplomaTypeDescriptor] ENABLE TRIGGER [nmped_ExpectedDiplomaTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_FosterCustodialAuthorityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_FosterCustodialAuthorityDescriptor_TR_DeleteTracking] ON [nmped].[FosterCustodialAuthorityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.FosterCustodialAuthorityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.FosterCustodialAuthorityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FosterCustodialAuthorityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[FosterCustodialAuthorityDescriptor] ENABLE TRIGGER [nmped_FosterCustodialAuthorityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_GenderIdentityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_GenderIdentityDescriptor_TR_DeleteTracking] ON [nmped].[GenderIdentityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.GenderIdentityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.GenderIdentityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GenderIdentityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[GenderIdentityDescriptor] ENABLE TRIGGER [nmped_GenderIdentityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_IndustryCredentialDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_IndustryCredentialDescriptor_TR_DeleteTracking] ON [nmped].[IndustryCredentialDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.IndustryCredentialDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.IndustryCredentialDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IndustryCredentialDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[IndustryCredentialDescriptor] ENABLE TRIGGER [nmped_IndustryCredentialDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_LevelOfEducationInstitutionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_LevelOfEducationInstitutionDescriptor_TR_DeleteTracking] ON [nmped].[LevelOfEducationInstitutionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.LevelOfEducationInstitutionDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.LevelOfEducationInstitutionDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfEducationInstitutionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[LevelOfEducationInstitutionDescriptor] ENABLE TRIGGER [nmped_LevelOfEducationInstitutionDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_LevelOfIntegrationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_LevelOfIntegrationDescriptor_TR_DeleteTracking] ON [nmped].[LevelOfIntegrationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.LevelOfIntegrationDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.LevelOfIntegrationDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfIntegrationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[LevelOfIntegrationDescriptor] ENABLE TRIGGER [nmped_LevelOfIntegrationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_LocalEducationAgencyTransportation_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_LocalEducationAgencyTransportation_TR_DeleteTracking] ON [nmped].[LocalEducationAgencyTransportation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[LocalEducationAgencyTransportation](OldCategoryDescriptor01TransportationCategoryDescriptorId, OldCategoryDescriptor01TransportationCategoryDescriptorNamespace, OldCategoryDescriptor01TransportationCategoryDescriptorCodeValue, OldCategoryDescriptor02TransportationCategoryDescriptorId, OldCategoryDescriptor02TransportationCategoryDescriptorNamespace, OldCategoryDescriptor02TransportationCategoryDescriptorCodeValue, OldLocalEducationAgencyId, OldTransportationSetCodeDescriptorId, OldTransportationSetCodeDescriptorNamespace, OldTransportationSetCodeDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.CategoryDescriptor01TransportationCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.CategoryDescriptor02TransportationCategoryDescriptorId, j1.Namespace, j1.CodeValue, d.LocalEducationAgencyId, d.TransportationSetCodeDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.CategoryDescriptor01TransportationCategoryDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.CategoryDescriptor02TransportationCategoryDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TransportationSetCodeDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [nmped].[LocalEducationAgencyTransportation] ENABLE TRIGGER [nmped_LocalEducationAgencyTransportation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_MedAlertDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_MedAlertDescriptor_TR_DeleteTracking] ON [nmped].[MedAlertDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.MedAlertDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.MedAlertDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedAlertDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MedAlertDescriptor] ENABLE TRIGGER [nmped_MedAlertDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_MEPProjectTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_MEPProjectTypeDescriptor_TR_DeleteTracking] ON [nmped].[MEPProjectTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.MEPProjectTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.MEPProjectTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MEPProjectTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MEPProjectTypeDescriptor] ENABLE TRIGGER [nmped_MEPProjectTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_MileageTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_MileageTypeDescriptor_TR_DeleteTracking] ON [nmped].[MileageTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.MileageTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.MileageTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MileageTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MileageTypeDescriptor] ENABLE TRIGGER [nmped_MileageTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_MilitaryFamilyDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_MilitaryFamilyDescriptor_TR_DeleteTracking] ON [nmped].[MilitaryFamilyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.MilitaryFamilyDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.MilitaryFamilyDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MilitaryFamilyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[MilitaryFamilyDescriptor] ENABLE TRIGGER [nmped_MilitaryFamilyDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_NMPEDClassPeriodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_NMPEDClassPeriodDescriptor_TR_DeleteTracking] ON [nmped].[NMPEDClassPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.NMPEDClassPeriodDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.NMPEDClassPeriodDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NMPEDClassPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[NMPEDClassPeriodDescriptor] ENABLE TRIGGER [nmped_NMPEDClassPeriodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_ParticipationInformationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_ParticipationInformationDescriptor_TR_DeleteTracking] ON [nmped].[ParticipationInformationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ParticipationInformationDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.ParticipationInformationDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParticipationInformationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ParticipationInformationDescriptor] ENABLE TRIGGER [nmped_ParticipationInformationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_PlannedPostGraduateActivityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_PlannedPostGraduateActivityDescriptor_TR_DeleteTracking] ON [nmped].[PlannedPostGraduateActivityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PlannedPostGraduateActivityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.PlannedPostGraduateActivityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PlannedPostGraduateActivityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PlannedPostGraduateActivityDescriptor] ENABLE TRIGGER [nmped_PlannedPostGraduateActivityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_PreKClassTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_PreKClassTypeDescriptor_TR_DeleteTracking] ON [nmped].[PreKClassTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PreKClassTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.PreKClassTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PreKClassTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PreKClassTypeDescriptor] ENABLE TRIGGER [nmped_PreKClassTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_PrimaryAreaOfExceptionalityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_PrimaryAreaOfExceptionalityDescriptor_TR_DeleteTracking] ON [nmped].[PrimaryAreaOfExceptionalityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PrimaryAreaOfExceptionalityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.PrimaryAreaOfExceptionalityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PrimaryAreaOfExceptionalityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[PrimaryAreaOfExceptionalityDescriptor] ENABLE TRIGGER [nmped_PrimaryAreaOfExceptionalityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_ProgramDeliveryMethodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_ProgramDeliveryMethodDescriptor_TR_DeleteTracking] ON [nmped].[ProgramDeliveryMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ProgramDeliveryMethodDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.ProgramDeliveryMethodDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramDeliveryMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ProgramDeliveryMethodDescriptor] ENABLE TRIGGER [nmped_ProgramDeliveryMethodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_ProgramIntensityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_ProgramIntensityDescriptor_TR_DeleteTracking] ON [nmped].[ProgramIntensityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ProgramIntensityDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.ProgramIntensityDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramIntensityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[ProgramIntensityDescriptor] ENABLE TRIGGER [nmped_ProgramIntensityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_RestraintTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_RestraintTypeDescriptor_TR_DeleteTracking] ON [nmped].[RestraintTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RestraintTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.RestraintTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[RestraintTypeDescriptor] ENABLE TRIGGER [nmped_RestraintTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_RoadTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_RoadTypeDescriptor_TR_DeleteTracking] ON [nmped].[RoadTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RoadTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.RoadTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RoadTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[RoadTypeDescriptor] ENABLE TRIGGER [nmped_RoadTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_SpecialEducationEventReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_SpecialEducationEventReasonDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationEventReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationEventReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.SpecialEducationEventReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationEventReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationEventReasonDescriptor] ENABLE TRIGGER [nmped_SpecialEducationEventReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_SpecialEducationEventTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_SpecialEducationEventTypeDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationEventTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.SpecialEducationEventTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationEventTypeDescriptor] ENABLE TRIGGER [nmped_SpecialEducationEventTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_SpecialEducationNonComplianceReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_SpecialEducationNonComplianceReasonDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationNonComplianceReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationNonComplianceReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.SpecialEducationNonComplianceReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationNonComplianceReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationNonComplianceReasonDescriptor] ENABLE TRIGGER [nmped_SpecialEducationNonComplianceReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_SpecialEducationReferralCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_SpecialEducationReferralCodeDescriptor_TR_DeleteTracking] ON [nmped].[SpecialEducationReferralCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialEducationReferralCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.SpecialEducationReferralCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationReferralCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialEducationReferralCodeDescriptor] ENABLE TRIGGER [nmped_SpecialEducationReferralCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_SpecialProgramCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_SpecialProgramCodeDescriptor_TR_DeleteTracking] ON [nmped].[SpecialProgramCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SpecialProgramCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.SpecialProgramCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialProgramCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[SpecialProgramCodeDescriptor] ENABLE TRIGGER [nmped_SpecialProgramCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StaffDevelopment_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StaffDevelopment_TR_DeleteTracking] ON [nmped].[StaffDevelopment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StaffDevelopment](OldEducationOrganizationId, OldStaffUSI, OldStaffUniqueId, OldStartDate, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.StaffUSI, j0.StaffUniqueId, d.StartDate, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j0
            ON d.StaffUSI = j0.StaffUSI
END
GO

ALTER TABLE [nmped].[StaffDevelopment] ENABLE TRIGGER [nmped_StaffDevelopment_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StaffDevelopmentActivityCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StaffDevelopmentActivityCodeDescriptor_TR_DeleteTracking] ON [nmped].[StaffDevelopmentActivityCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.StaffDevelopmentActivityCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.StaffDevelopmentActivityCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffDevelopmentActivityCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StaffDevelopmentActivityCodeDescriptor] ENABLE TRIGGER [nmped_StaffDevelopmentActivityCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StaffDevelopmentPurposeCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StaffDevelopmentPurposeCodeDescriptor_TR_DeleteTracking] ON [nmped].[StaffDevelopmentPurposeCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.StaffDevelopmentPurposeCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.StaffDevelopmentPurposeCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffDevelopmentPurposeCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StaffDevelopmentPurposeCodeDescriptor] ENABLE TRIGGER [nmped_StaffDevelopmentPurposeCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StaffEducationOrganizationVacancy_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StaffEducationOrganizationVacancy_TR_DeleteTracking] ON [nmped].[StaffEducationOrganizationVacancy] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StaffEducationOrganizationVacancy](OldDataCollectionPeriodDescriptorId, OldDataCollectionPeriodDescriptorNamespace, OldDataCollectionPeriodDescriptorCodeValue, OldLocalEducationAgencyId, OldSchoolYear, OldVacancyGroupDescriptorId, OldVacancyGroupDescriptorNamespace, OldVacancyGroupDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.DataCollectionPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.LocalEducationAgencyId, d.SchoolYear, d.VacancyGroupDescriptorId, j1.Namespace, j1.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.DataCollectionPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.VacancyGroupDescriptorId = j1.DescriptorId
END
GO

ALTER TABLE [nmped].[StaffEducationOrganizationVacancy] ENABLE TRIGGER [nmped_StaffEducationOrganizationVacancy_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StudentAwardTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StudentAwardTypeDescriptor_TR_DeleteTracking] ON [nmped].[StudentAwardTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.StudentAwardTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.StudentAwardTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentAwardTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[StudentAwardTypeDescriptor] ENABLE TRIGGER [nmped_StudentAwardTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StudentCTEProgramAssociationCredential_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StudentCTEProgramAssociationCredential_TR_DeleteTracking] ON [nmped].[StudentCTEProgramAssociationCredential] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StudentCTEProgramAssociationCredential](OldBeginDate, OldCredentialEarnedDate, OldEducationOrganizationId, OldIndustryCredentialDescriptorId, OldIndustryCredentialDescriptorNamespace, OldIndustryCredentialDescriptorCodeValue, OldProgramDeliveryMethodDescriptorId, OldProgramDeliveryMethodDescriptorNamespace, OldProgramDeliveryMethodDescriptorCodeValue, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.CredentialEarnedDate, d.EducationOrganizationId, d.IndustryCredentialDescriptorId, j0.Namespace, j0.CodeValue, d.ProgramDeliveryMethodDescriptorId, j1.Namespace, j1.CodeValue, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j2.Namespace, j2.CodeValue, d.StudentUSI, j3.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.IndustryCredentialDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.ProgramDeliveryMethodDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.ProgramTypeDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Student j3
            ON d.StudentUSI = j3.StudentUSI
END
GO

ALTER TABLE [nmped].[StudentCTEProgramAssociationCredential] ENABLE TRIGGER [nmped_StudentCTEProgramAssociationCredential_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StudentEducationOrganizationAward_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StudentEducationOrganizationAward_TR_DeleteTracking] ON [nmped].[StudentEducationOrganizationAward] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StudentEducationOrganizationAward](OldAwardDate, OldEducationOrganizationId, OldSchoolYear, OldStudentAwardLanguageDescriptorId, OldStudentAwardLanguageDescriptorNamespace, OldStudentAwardLanguageDescriptorCodeValue, OldStudentAwardTypeDescriptorId, OldStudentAwardTypeDescriptorNamespace, OldStudentAwardTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.AwardDate, d.EducationOrganizationId, d.SchoolYear, d.StudentAwardLanguageDescriptorId, j0.Namespace, j0.CodeValue, d.StudentAwardTypeDescriptorId, j1.Namespace, j1.CodeValue, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.StudentAwardLanguageDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.StudentAwardTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI
END
GO

ALTER TABLE [nmped].[StudentEducationOrganizationAward] ENABLE TRIGGER [nmped_StudentEducationOrganizationAward_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StudentSpecialEducationAssociationEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationAssociationEvent_TR_DeleteTracking] ON [nmped].[StudentSpecialEducationAssociationEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StudentSpecialEducationAssociationEvent](OldBeginDate, OldEducationOrganizationId, OldEventDate, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldSpecialEducationEventTypeDescriptorId, OldSpecialEducationEventTypeDescriptorNamespace, OldSpecialEducationEventTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.EducationOrganizationId, d.EventDate, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j0.Namespace, j0.CodeValue, d.SpecialEducationEventTypeDescriptorId, j1.Namespace, j1.CodeValue, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.SpecialEducationEventTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI
END
GO

ALTER TABLE [nmped].[StudentSpecialEducationAssociationEvent] ENABLE TRIGGER [nmped_StudentSpecialEducationAssociationEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_StudentSpecialEducationProgramAssociationIEPDates_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_StudentSpecialEducationProgramAssociationIEPDates_TR_DeleteTracking] ON [nmped].[StudentSpecialEducationProgramAssociationIEPDates] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[StudentSpecialEducationProgramAssociationIEPDates](OldBeginDate, OldEducationOrganizationId, OldIEPBeginDate, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.EducationOrganizationId, d.IEPBeginDate, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j0.Namespace, j0.CodeValue, d.StudentUSI, j1.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Student j1
            ON d.StudentUSI = j1.StudentUSI
END
GO

ALTER TABLE [nmped].[StudentSpecialEducationProgramAssociationIEPDates] ENABLE TRIGGER [nmped_StudentSpecialEducationProgramAssociationIEPDates_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_TransportationCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_TransportationCategoryDescriptor_TR_DeleteTracking] ON [nmped].[TransportationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.TransportationCategoryDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.TransportationCategoryDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TransportationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TransportationCategoryDescriptor] ENABLE TRIGGER [nmped_TransportationCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_TransportationSetCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_TransportationSetCodeDescriptor_TR_DeleteTracking] ON [nmped].[TransportationSetCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.TransportationSetCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.TransportationSetCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TransportationSetCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TransportationSetCodeDescriptor] ENABLE TRIGGER [nmped_TransportationSetCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_TriennialReviewDelayReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_TriennialReviewDelayReasonDescriptor_TR_DeleteTracking] ON [nmped].[TriennialReviewDelayReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.TriennialReviewDelayReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.TriennialReviewDelayReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TriennialReviewDelayReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[TriennialReviewDelayReasonDescriptor] ENABLE TRIGGER [nmped_TriennialReviewDelayReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VacancyGroupDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VacancyGroupDescriptor_TR_DeleteTracking] ON [nmped].[VacancyGroupDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VacancyGroupDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VacancyGroupDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VacancyGroupDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VacancyGroupDescriptor] ENABLE TRIGGER [nmped_VacancyGroupDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleBodyManufacturerDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleBodyManufacturerDescriptor_TR_DeleteTracking] ON [nmped].[VehicleBodyManufacturerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VehicleBodyManufacturerDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VehicleBodyManufacturerDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleBodyManufacturerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleBodyManufacturerDescriptor] ENABLE TRIGGER [nmped_VehicleBodyManufacturerDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleChassisManufacturerDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleChassisManufacturerDescriptor_TR_DeleteTracking] ON [nmped].[VehicleChassisManufacturerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VehicleChassisManufacturerDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VehicleChassisManufacturerDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleChassisManufacturerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleChassisManufacturerDescriptor] ENABLE TRIGGER [nmped_VehicleChassisManufacturerDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleFuelTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleFuelTypeDescriptor_TR_DeleteTracking] ON [nmped].[VehicleFuelTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VehicleFuelTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VehicleFuelTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleFuelTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleFuelTypeDescriptor] ENABLE TRIGGER [nmped_VehicleFuelTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleMileage_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleMileage_TR_DeleteTracking] ON [nmped].[VehicleMileage] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[VehicleMileage](OldLocalEducationAgencyId, OldMileageTypeDescriptorId, OldMileageTypeDescriptorNamespace, OldMileageTypeDescriptorCodeValue, OldReportingDate, OldRoadTypeDescriptorId, OldRoadTypeDescriptorNamespace, OldRoadTypeDescriptorCodeValue, OldVehicleId, OldVehicleRouteDescriptorId, OldVehicleRouteDescriptorNamespace, OldVehicleRouteDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.LocalEducationAgencyId, d.MileageTypeDescriptorId, j0.Namespace, j0.CodeValue, d.ReportingDate, d.RoadTypeDescriptorId, j1.Namespace, j1.CodeValue, d.VehicleId, d.VehicleRouteDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.MileageTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.RoadTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.VehicleRouteDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleMileage] ENABLE TRIGGER [nmped_VehicleMileage_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleRouteDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleRouteDescriptor_TR_DeleteTracking] ON [nmped].[VehicleRouteDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VehicleRouteDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VehicleRouteDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleRouteDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleRouteDescriptor] ENABLE TRIGGER [nmped_VehicleRouteDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleSnapshot_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleSnapshot_TR_DeleteTracking] ON [nmped].[VehicleSnapshot] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmped].[VehicleSnapshot](OldLocalEducationAgencyId, OldSchoolYear, OldVehicleId, OldVehicleIdentificationNumber, Id, Discriminator, ChangeVersion)
    SELECT d.LocalEducationAgencyId, d.SchoolYear, d.VehicleId, d.VehicleIdentificationNumber, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [nmped].[VehicleSnapshot] ENABLE TRIGGER [nmped_VehicleSnapshot_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmped].[nmped_VehicleTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmped].[nmped_VehicleTypeDescriptor_TR_DeleteTracking] ON [nmped].[VehicleTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.VehicleTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmped.VehicleTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VehicleTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmped].[VehicleTypeDescriptor] ENABLE TRIGGER [nmped_VehicleTypeDescriptor_TR_DeleteTracking]
GO


