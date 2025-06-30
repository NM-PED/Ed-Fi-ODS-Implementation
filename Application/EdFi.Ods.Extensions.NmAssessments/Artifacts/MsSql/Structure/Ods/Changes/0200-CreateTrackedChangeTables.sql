IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'tracked_changes_nmassessments')
EXEC sys.sp_executesql N'CREATE SCHEMA [tracked_changes_nmassessments]'
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[tracked_changes_nmassessments].[NmStudentAssessment]'))
CREATE TABLE [tracked_changes_nmassessments].[NmStudentAssessment]
(
       OldEducationOrganizationId [INT] NOT NULL,
       OldItemDescriptionCodeDescriptorId [INT] NOT NULL,
       OldItemDescriptionCodeDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldItemDescriptionCodeDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       OldStudentUSI [INT] NOT NULL,
       OldStudentUniqueId [NVARCHAR](32) NOT NULL,
       OldTestDate [DATE] NOT NULL,
       OldTestDescriptionDescriptorId [INT] NOT NULL,
       OldTestDescriptionDescriptorNamespace [NVARCHAR](255) NOT NULL,
       OldTestDescriptionDescriptorCodeValue [NVARCHAR](50) NOT NULL,
       NewEducationOrganizationId [INT] NULL,
       NewItemDescriptionCodeDescriptorId [INT] NULL,
       NewItemDescriptionCodeDescriptorNamespace [NVARCHAR](255) NULL,
       NewItemDescriptionCodeDescriptorCodeValue [NVARCHAR](50) NULL,
       NewStudentUSI [INT] NULL,
       NewStudentUniqueId [NVARCHAR](32) NULL,
       NewTestDate [DATE] NULL,
       NewTestDescriptionDescriptorId [INT] NULL,
       NewTestDescriptionDescriptorNamespace [NVARCHAR](255) NULL,
       NewTestDescriptionDescriptorCodeValue [NVARCHAR](50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator [NVARCHAR](128) NULL,
       CreateDate DateTime2 NOT NULL DEFAULT (getutcdate()),
       CONSTRAINT PK_NmStudentAssessment PRIMARY KEY CLUSTERED (ChangeVersion)
)
