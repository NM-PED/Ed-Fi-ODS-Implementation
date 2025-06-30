DROP TRIGGER IF EXISTS [nmassessments].[nmassessments_ItemDescriptionCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmassessments].[nmassessments_ItemDescriptionCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[ItemDescriptionCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ItemDescriptionCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmassessments.ItemDescriptionCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ItemDescriptionCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[ItemDescriptionCodeDescriptor] ENABLE TRIGGER [nmassessments_ItemDescriptionCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmassessments].[nmassessments_NmStudentAssessment_TR_DeleteTracking]
GO

CREATE TRIGGER [nmassessments].[nmassessments_NmStudentAssessment_TR_DeleteTracking] ON [nmassessments].[NmStudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_nmassessments].[NmStudentAssessment](OldEducationOrganizationId, OldItemDescriptionCodeDescriptorId, OldItemDescriptionCodeDescriptorNamespace, OldItemDescriptionCodeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, OldTestDate, OldTestDescriptionDescriptorId, OldTestDescriptionDescriptorNamespace, OldTestDescriptionDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.ItemDescriptionCodeDescriptorId, j0.Namespace, j0.CodeValue, d.StudentUSI, j1.StudentUniqueId, d.TestDate, d.TestDescriptionDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ItemDescriptionCodeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Student j1
            ON d.StudentUSI = j1.StudentUSI
        INNER JOIN edfi.Descriptor j2
            ON d.TestDescriptionDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [nmassessments].[NmStudentAssessment] ENABLE TRIGGER [nmassessments_NmStudentAssessment_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmassessments].[nmassessments_ScoringModelCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmassessments].[nmassessments_ScoringModelCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[ScoringModelCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ScoringModelCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmassessments.ScoringModelCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ScoringModelCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[ScoringModelCodeDescriptor] ENABLE TRIGGER [nmassessments_ScoringModelCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmassessments].[nmassessments_StandardAchievedCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmassessments].[nmassessments_StandardAchievedCodeDescriptor_TR_DeleteTracking] ON [nmassessments].[StandardAchievedCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.StandardAchievedCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmassessments.StandardAchievedCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StandardAchievedCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[StandardAchievedCodeDescriptor] ENABLE TRIGGER [nmassessments_StandardAchievedCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [nmassessments].[nmassessments_TestDescriptionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [nmassessments].[nmassessments_TestDescriptionDescriptor_TR_DeleteTracking] ON [nmassessments].[TestDescriptionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.TestDescriptionDescriptorId, b.CodeValue, b.Namespace, b.Id, 'nmassessments.TestDescriptionDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TestDescriptionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [nmassessments].[TestDescriptionDescriptor] ENABLE TRIGGER [nmassessments_TestDescriptionDescriptor_TR_DeleteTracking]
GO


