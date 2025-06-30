
-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[nmassessments].[NmStudentAssessment]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD [ChangeVersion] [BIGINT] CONSTRAINT NmStudentAssessment_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [nmassessments].[NmStudentAssessment] DROP CONSTRAINT NmStudentAssessment_DF_ChangeVersion;
ALTER TABLE [nmassessments].[NmStudentAssessment] ADD CONSTRAINT NmStudentAssessment_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


