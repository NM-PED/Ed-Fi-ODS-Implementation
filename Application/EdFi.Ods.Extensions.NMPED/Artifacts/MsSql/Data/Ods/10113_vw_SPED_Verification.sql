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
 * Desc:	This is the master view to display SPED data in a single row for each actual SPED record.
 *			This view depends on the following three views:
 *			- [nmped_rpt].[vw_SPED_Verification_ProgramServices]
 *			- [nmped_rpt].[vw_SPED_Verification_Disabilities]
 *			- [nmped_rpt].[vw_SPED_Verification_ServiceProviders]
 *			
 * https://edfistg.ped.state.nm.us/v5.3.0_NM_Staging/docs/swagger/index.html?urls.primaryName=Resources
 *
 */

CREATE OR ALTER VIEW [nmped_rpt].[vw_SPED_Verification]
AS 

SELECT DISTINCT
	--standard school/district columns
	 D.EducationOrganizationId_District
	,D.DistrictCode
	,D.DistrictName
	,D.EducationOrganizationId_School
	,D.LocationCode
	,D.SchoolName
	
	--resource documentation starts
	,D.StudentUniqueId
	,D.StudentUSI
	,D.FirstName
	,D.LastSurname
	,D.BeginDate
	,D.ProgramName
	,D.[ProgramTypeCode]
	,D.[ProgramTypeDescription]

	,D.EndDate
	,D.IdeaEligibility
	,D.IEPBeginDate
	,D.IEPEndDate
	,D.IEPReviewDate
	,D.LastEvaluationDate
	,D.MedicallyFragile
	,D.MultiplyDisabled

--	,SSEPA.participationStatus not collected
--	,SSEPA.programParticipationStatuses not collected

	,D.[ReasonExitedCode]
	,D.[ReasonExitedDescription]
	,D.SchoolHoursPerWeek
	,D.ServedOutsideOfRegularSession
	,D.SpecialEducationHoursPerWeek

	--extensions
	,D.[AnnualReviewDelayReasonCode]
	,D.[AnnualReviewDelayReasonDescription]
	,D.[ExpectedDiplomaTypeCode]
	,D.[ExpectedDiplomaTypeDescription]
	,D.[SpecialEducationLevelOfIntegrationCode]
	,D.[SpecialEducationLevelOfIntegrationDescription]
	,D.[PlannedPostGraduateActivityCode]
	,D.[PlannedPostGraduateActivityDescription]
	,D.[PrimaryAreaOfExceptionalityCode]
	,D.[PrimaryAreaOfExceptionalityDescription]
	,D.[SpecialEducationReferralCodeCode]
	,D.[SpecialEducationReferralCodeDescription]
	,D.[TriennialReviewDelayReasonCode]
	,D.[TriennialReviewDelayReasonDescription]
	,D.AlternateInstruction
	,D.BrailleInstruction
	,D.ChildCountEducationOrganizationId
	,D.[SpecialEducationSettingCode]
	,D.[SpecialEducationSettingDescription]
	,D.[GeneralStudentProgramAssociationId]

	-- Disability Info
	,D.[OrderOfDisability]
	,D.[DisabilityCode]
	,D.[DisabilityDescription]
	,D.[DisabilityDeterminationSourceTypeCode]
	,D.[DisabilityDeterminationSourceTypeDescription]
	,D.[DisabilityDiagnosis]
	,D.[DisabilityDesignationCode]
	,D.[DisabilityDesignationDescription]

	-- Service Provider Info
	,SP.[PrimaryProvider]
	,SP.[SpecialEducationStaffUniqueId]
	,SP.[StaffUSI] 

	-- Program Service Info
	,PS.[SpecialEducationProgramServiceCode]
	,PS.[SpecialEducationProgramServiceDescription]
	,PS.[SpecialEducationProgramServiceStaffUniqueId]
	,PS.[SpecialEducationProgramServiceStaffUSI]
	,PS.[PrimaryIndicator]
	,PS.[ServiceBeginDate]
	,PS.[ServiceEndDate]
	,PS.[IntegratedServicesStatus] 
	,PS.[ServiceDuration]

FROM nmped_rpt.vw_SPED_Verification_Disabilities D

-- Join Service Providers
INNER JOIN nmped_rpt.vw_SPED_Verification_ServiceProviders SP
	ON (SP.BeginDate = D.BeginDate
		AND SP.EducationOrganizationId_School = D.EducationOrganizationId_School
		AND SP.EducationOrganizationId_District = D.EducationOrganizationId_District
		AND SP.ProgramName = D.ProgramName
		AND SP.ProgramTypeCode = D.ProgramTypeCode
		AND SP.StudentUSI = D.StudentUSI)
-- Join Program Services
INNER JOIN nmped_rpt.vw_SPED_Verification_ProgramServices PS
	ON (PS.BeginDate = D.BeginDate
		AND PS.EducationOrganizationId_School = D.EducationOrganizationId_School
		AND PS.EducationOrganizationId_District = D.EducationOrganizationId_District
		AND PS.ProgramName = D.ProgramName
		AND PS.ProgramTypeCode = D.ProgramTypeCode
		AND PS.StudentUSI = D.StudentUSI)

GO