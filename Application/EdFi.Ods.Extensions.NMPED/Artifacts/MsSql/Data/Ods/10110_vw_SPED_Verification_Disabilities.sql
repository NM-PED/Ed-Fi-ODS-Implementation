/*
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * BASED ON THE VIEW WRITTEN BY COLLIN WHO IS MOST AWESOME - THIS VIEW IS ONLY TO BE USED BY THE VERIFICATION REPORT SO IT ONLY RETURNS ONE ROW PER STUDENT SPED RECORD
 *
 * By:		Cody Misplay | App Dev III
 * Email:	Cody.Misplay@ped.nm.gov
 * Date:	12-06-2023
 * Desc:	One of three subcollection scripts used to display single rows of student SPED data.
 *			
 * https://edfistg.ped.state.nm.us/v5.3.0_NM_Staging/docs/swagger/index.html?urls.primaryName=Resources
 *
 */

CREATE OR ALTER VIEW [nmped_rpt].[vw_SPED_Verification_Disabilities]
AS 

WITH cte_Descriptors AS (
SELECT [DescriptorId]
	   ,[Namespace]
	   ,[CodeValue]
	   ,[ShortDescription]
	   ,[Description]
FROM edfi.Descriptor WITH (NOLOCK)
WHERE DescriptorId IN ( -- Control Table Query
SELECT * FROM edfi.ProgramTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.DisabilityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.DisabilityDeterminationSourceTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.DisabilityDesignationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.ReasonExitedDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SpecialEducationSettingDescriptor WITH (NOLOCK)
UNION
SELECT * FROM edfi.SpecialEducationProgramServiceDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.AnnualReviewDelayReasonDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.ExpectedDiplomaTypeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.LevelOfIntegrationDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.PlannedPostGraduateActivityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.PrimaryAreaOfExceptionalityDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.SpecialEducationReferralCodeDescriptor WITH (NOLOCK)
UNION
SELECT * FROM nmped.TriennialReviewDelayReasonDescriptor WITH (NOLOCK))
)

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName
	
	--resource documentation starts
	,S.StudentUniqueId
	,S.StudentUSI
	,S.FirstName
	,S.LastSurname
	,SSEPA.BeginDate
	,SSEPA.ProgramName
	,ProgramType.CodeValue								AS	[ProgramTypeCode]
	,ProgramType.[Description]							AS	[ProgramTypeDescription]

	,GSPA.EndDate
	,SSEPA.IdeaEligibility
	,SSEPA.IEPBeginDate
	,SSEPA.IEPEndDate
	,SSEPA.IEPReviewDate
	,SSEPA.LastEvaluationDate
	,SSEPA.MedicallyFragile
	,SSEPA.MultiplyDisabled

--	,SSEPA.participationStatus not collected
--	,SSEPA.programParticipationStatuses not collected

	,ReasonExited.CodeValue								AS	[ReasonExitedCode]
	,ReasonExited.[Description]							AS	[ReasonExitedDescription]
	,SSEPA.SchoolHoursPerWeek
	,GSPA.ServedOutsideOfRegularSession
	,SSEPA.SpecialEducationHoursPerWeek

	--extensions
	,AnnualReviewDelayReason.CodeValue					AS	[AnnualReviewDelayReasonCode]
	,AnnualReviewDelayReason.[Description]				AS	[AnnualReviewDelayReasonDescription]
	,ExpectedDiplomaType.CodeValue						AS	[ExpectedDiplomaTypeCode]
	,ExpectedDiplomaType.[Description]					AS	[ExpectedDiplomaTypeDescription]
	,SpecialEducationLevelOfIntegration.CodeValue		AS	[SpecialEducationLevelOfIntegrationCode]
	,SpecialEducationLevelOfIntegration.[Description]	AS	[SpecialEducationLevelOfIntegrationDescription]
	,PlannedPostGraduateActivity.CodeValue				AS	[PlannedPostGraduateActivityCode]
	,PlannedPostGraduateActivity.[Description]			AS	[PlannedPostGraduateActivityDescription]
	,PrimaryAreaOfExceptionality.CodeValue				AS	[PrimaryAreaOfExceptionalityCode]
	,PrimaryAreaOfExceptionality.[Description]			AS	[PrimaryAreaOfExceptionalityDescription]
	,SpecialEducationReferralCode.CodeValue				AS	[SpecialEducationReferralCodeCode]
	,SpecialEducationReferralCode.[Description]			AS	[SpecialEducationReferralCodeDescription]
	,TriennialReviewDelayReason.CodeValue				AS	[TriennialReviewDelayReasonCode]
	,TriennialReviewDelayReason.[Description]			AS	[TriennialReviewDelayReasonDescription]
	,SSEPAE.AlternateInstruction
	,SSEPAE.BrailleInstruction
	,SSEPAE.ChildCountEducationOrganizationId
	,SpecialEducationSetting.CodeValue					AS	[SpecialEducationSettingCode]
	,SpecialEducationSetting.[Description]				AS	[SpecialEducationSettingDescription]

	,GSPA.Id AS [GeneralStudentProgramAssociationId]

	--disability subcollection
	,STRING_AGG(SSEPAD.OrderOfDisability, ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability) AS [OrderOfDisability]
	,STRING_AGG(ISNULL(Disability.CodeValue,'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)								AS	[DisabilityCode]
	,STRING_AGG(ISNULL(Disability.[Description],'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)						AS	[DisabilityDescription]
	,STRING_AGG(ISNULL(DisabilityDeterminationSourceType.CodeValue,'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)		AS	[DisabilityDeterminationSourceTypeCode]
	,STRING_AGG(ISNULL(DisabilityDeterminationSourceType.[Description],'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)	AS	[DisabilityDeterminationSourceTypeDescription]
	,STRING_AGG(ISNULL(SSEPAD.DisabilityDiagnosis,'None'), ';')	WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)						AS	[DisabilityDiagnosis]
	,STRING_AGG(ISNULL(DisabilityDesignation.CodeValue,'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)					AS	[DisabilityDesignationCode]
	,STRING_AGG(ISNULL(DisabilityDesignation.[Description],'None'), ';') WITHIN GROUP (ORDER BY SSEPAD.OrderOfDisability)				AS	[DisabilityDesignationDescription]
	-- end 

FROM 
	edfi.StudentSpecialEducationProgramAssociation SSEPA WITH (NOLOCK)

	JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
		ON GSPA.BeginDate = SSEPA.BeginDate
		AND GSPA.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND GSPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND GSPA.ProgramName = SSEPA.ProgramName
		AND GSPA.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND GSPA.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN nmped.StudentSpecialEducationProgramAssociationExtension SSEPAE WITH (NOLOCK)
		ON SSEPAE.BeginDate = SSEPA.BeginDate
		AND SSEPAE.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPAE.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPAE.ProgramName = SSEPA.ProgramName
		AND SSEPAE.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPAE.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationDisability SSEPAD WITH (NOLOCK)
		ON SSEPAD.BeginDate = SSEPA.BeginDate
		AND SSEPAD.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPAD.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPAD.ProgramName = SSEPA.ProgramName
		AND SSEPAD.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPAD.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation SSEPADD WITH (NOLOCK)
		ON SSEPADD.BeginDate = SSEPA.BeginDate
		AND SSEPADD.EducationOrganizationId = SSEPA.EducationOrganizationId
		AND SSEPADD.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
		AND SSEPADD.ProgramName = SSEPA.ProgramName
		AND SSEPADD.ProgramTypeDescriptorId = SSEPA.ProgramTypeDescriptorId
		AND SSEPADD.StudentUSI = SSEPA.StudentUSI 

	LEFT JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSEPA.StudentUSI

	LEFT JOIN cte_Descriptors ProgramType
		ON ProgramType.DescriptorId = SSEPA.ProgramTypeDescriptorId

	LEFT JOIN cte_Descriptors Disability
		ON Disability.DescriptorId = SSEPAD.DisabilityDescriptorId

	LEFT JOIN cte_Descriptors DisabilityDeterminationSourceType
		ON DisabilityDeterminationSourceType.DescriptorId = SSEPAD.DisabilityDeterminationSourceTypeDescriptorId

	LEFT JOIN cte_Descriptors DisabilityDesignation
		ON DisabilityDesignation.DescriptorId = SSEPADD.DisabilityDesignationDescriptorId

	LEFT JOIN cte_Descriptors ReasonExited
		ON ReasonExited.DescriptorId = GSPA.ReasonExitedDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationSetting
		ON SpecialEducationSetting.DescriptorId = SSEPA.SpecialEducationSettingDescriptorId

	LEFT JOIN cte_Descriptors AnnualReviewDelayReason
		ON AnnualReviewDelayReason.DescriptorId = SSEPAE.AnnualReviewDelayReasonDescriptorId

	LEFT JOIN cte_Descriptors ExpectedDiplomaType
		ON ExpectedDiplomaType.DescriptorId = SSEPAE.ExpectedDiplomaTypeDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationLevelOfIntegration
		ON SpecialEducationLevelOfIntegration.DescriptorId = SSEPAE.SpecialEducationLevelOfIntegrationDescriptorId

	LEFT JOIN cte_Descriptors PlannedPostGraduateActivity
		ON PlannedPostGraduateActivity.DescriptorId = SSEPAE.PlannedPostGraduateActivityDescriptorId

	LEFT JOIN cte_Descriptors PrimaryAreaOfExceptionality
		ON PrimaryAreaOfExceptionality.DescriptorId = SSEPAE.PrimaryAreaOfExceptionalityDescriptorId

	LEFT JOIN cte_Descriptors SpecialEducationReferralCode
		ON SpecialEducationReferralCode.DescriptorId = SSEPAE.SpecialEducationReferralCodeDescriptorId

	LEFT JOIN cte_Descriptors TriennialReviewDelayReason
		ON TriennialReviewDelayReason.DescriptorId = SSEPAE.TriennialReviewDelayReasonDescriptorId

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSEPA.EducationOrganizationId

GROUP BY VDL.EducationOrganizationId_District
		,VDL.DistrictCode
		,VDL.DistrictName
		,VDL.EducationOrganizationId_School
		,VDL.LocationCode
		,VDL.SchoolName
		,S.StudentUniqueId
		,S.StudentUSI
		,S.FirstName
		,S.LastSurname
		,SSEPA.BeginDate
		,SSEPA.ProgramName
		,ProgramType.CodeValue
		,ProgramType.[Description]
		,GSPA.EndDate
		,SSEPA.IdeaEligibility
		,SSEPA.IEPBeginDate
		,SSEPA.IEPEndDate
		,SSEPA.IEPReviewDate
		,SSEPA.LastEvaluationDate
		,SSEPA.MedicallyFragile
		,SSEPA.MultiplyDisabled
		,ReasonExited.CodeValue							
		,ReasonExited.[Description]						
		,SSEPA.SchoolHoursPerWeek
		,GSPA.ServedOutsideOfRegularSession
		,SSEPA.SpecialEducationHoursPerWeek
		,AnnualReviewDelayReason.CodeValue
		,AnnualReviewDelayReason.[Description]
		,ExpectedDiplomaType.CodeValue					
		,ExpectedDiplomaType.[Description]				
		,SpecialEducationLevelOfIntegration.CodeValue		
		,SpecialEducationLevelOfIntegration.[Description]	
		,PlannedPostGraduateActivity.CodeValue				
		,PlannedPostGraduateActivity.[Description]			
		,PrimaryAreaOfExceptionality.CodeValue				
		,PrimaryAreaOfExceptionality.[Description]			
		,SpecialEducationReferralCode.CodeValue				
		,SpecialEducationReferralCode.[Description]			
		,TriennialReviewDelayReason.CodeValue				
		,TriennialReviewDelayReason.[Description]			
		,SSEPAE.AlternateInstruction
		,SSEPAE.BrailleInstruction
		,SSEPAE.ChildCountEducationOrganizationId
		,SpecialEducationSetting.CodeValue				
		,SpecialEducationSetting.[Description]
		,GSPA.Id 
			
GO

