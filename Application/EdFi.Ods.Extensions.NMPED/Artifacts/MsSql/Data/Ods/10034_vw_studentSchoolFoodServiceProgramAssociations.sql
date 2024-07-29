/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Kristina Fernandez | App Dev III
 * Email:	Kristina.Fernandez@ped.nm.gov
 * Date:	03.06.2023
 * Desc:	This script creates a studentSchoolFoodServiceProgramAssociation view from the studentSchoolFoodServiceProgramAssociation resource
 *			
 * Alt Id:	001
 * Author:	Collin Neville
 * Date:	12.13.2023
 * Desc:	This change brings in both tables for Eligibility temporarily, 
 *			until all SIS vendors are sending eligibility in one spot
 *			Correct table:		edfi.GeneralStudentProgramAssociationParticipationStatus
 *			Alternate table:	edfi.GeneralStudentProgramAssocaitionProgramParticipationStatus
 *
  * Alt Id:	002
 * Author:	Cody Misplay
 * Date:	06.25.2024
 * Desc:	Updated the CTE for descriptors to obtain the correct field (it previously referenced "DescriptorId")
 *			I also moved the descriptor join for eligibility outside of the block for Alt Id 001 so that change can be backed out without
 *				affecting the original and correct eligibility location.
 *
 */

CREATE OR ALTER     VIEW [nmped_rpt].[vw_studentSchoolFoodServiceProgramAssociations] AS 
WITH cte_Descriptors AS 
(
	SELECT 
		 DescriptorId
		,CodeValue
		,Description

	FROM 
		edfi.Descriptor
	WHERE
		DescriptorId IN ( -- 002 Changes to SELECT statements below.
							SELECT ParticipationStatusDescriptorId FROM edfi.ParticipationStatusDescriptor
							UNION
							SELECT DirectCertificationStatusDescriptorId FROM nmped.DirectCertificationStatusDescriptor
							UNION
							SELECT SchoolFoodServiceProgramServiceDescriptorId FROM edfi.SchoolFoodServiceProgramServiceDescriptor
							UNION
							SELECT ProgramTypeDescriptorId FROM edfi.ProgramTypeDescriptor
						) -- End 002 changes
)
SELECT 
 	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	

	--resource documentation starts
	,S.StudentUSI
	,StudentUniqueId
	,FirstName
	,LastSurname
	,SSFSPA.BeginDate
	,GSPA.EndDate
	,SSFSPA.ProgramName
	,ProgramType.CodeValue										[ProgramTypeCode]
	,ProgramType.Description									[ProgramTypeDescription]
	,DirectCertification
--	,participationStatus not collected
--	,programParticipationStatus not collected

/* 001 Start Block */
	--captures FRL Eligibility
	,COALESCE(Eligibility.CodeValue, Eligibility2.CodeValue)	[FoodServiceEligibilityCode]
	,COALESCE(Eligibility.Description, Eligibility2.Description)[FoodServiceEligibility]
	,COALESCE(GSPAPS.StatusBeginDate, GSPAP.StatusBeginDate)	[StatusBeginDate]
	,COALESCE(GSPAPS.StatusEndDate, GSPAP.StatusEndDate)		[StatusEndDate]
/* 001 End Block */

	--schoolFoodServiceProgramService subcollection
	--captures FRL participation
	,Participation.CodeValue									[FoodServiceParticipationCode]
	,Participation.Description									[FoodServiceParticipation]
	,ServiceBeginDate
	,ServiceEndDate
	--end subcollection
	
	,DirectCertificationStatus.CodeValue						[DirectCertificationStatusCode]
	,DirectCertificationStatus.Description						[DirectCertificationStatusDescription]

	,GSPA.Id
FROM
	edfi.StudentSchoolFoodServiceProgramAssociation SSFSPA WITH (NOLOCK)

	JOIN edfi.GeneralStudentProgramAssociation GSPA WITH (NOLOCK)
		 ON GSPA.StudentUSI = SSFSPA.StudentUSI
		AND GSPA.EducationOrganizationId = SSFSPA.EducationOrganizationId
		AND GSPA.BeginDate = SSFSPA.BeginDate
		AND GSPA.ProgramTypeDescriptorId = SSFSPA.ProgramTypeDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSFSPA.EducationOrganizationId
	
	JOIN edfi.Student S WITH (NOLOCK)
		ON S.StudentUSI = SSFSPA.StudentUSI

	LEFT JOIN edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService SSFSPASFSPS WITH (NOLOCK)
		 ON SSFSPASFSPS.BeginDate = SSFSPA.BeginDate
		AND SSFSPASFSPS.EducationOrganizationId = SSFSPA.EducationOrganizationId
		AND SSFSPASFSPS.ProgramEducationOrganizationId = SSFSPA.ProgramEducationOrganizationId
		AND SSFSPASFSPS.ProgramName = SSFSPA.ProgramName
		AND SSFSPASFSPS.ProgramTypeDescriptorId = SSFSPA.ProgramTypeDescriptorId
		AND SSFSPASFSPS.StudentUSI = SSFSPA.StudentUSI

	LEFT JOIN nmped.StudentSchoolFoodServiceProgramAssociationExtension SSFSPAE WITH (NOLOCK)
		 ON SSFSPAE.BeginDate = SSFSPA.BeginDate
		AND SSFSPAE.EducationOrganizationId = SSFSPA.EducationOrganizationId
		AND SSFSPAE.ProgramEducationOrganizationId = SSFSPA.ProgramEducationOrganizationId
		AND SSFSPAE.ProgramName = SSFSPA.ProgramName
		AND SSFSPAE.ProgramTypeDescriptorId = SSFSPA.ProgramTypeDescriptorId
		AND SSFSPAE.StudentUSI = SSFSPA.StudentUSI

	LEFT JOIN edfi.GeneralStudentProgramAssociationParticipationStatus GSPAPS WITH (NOLOCK)
		 ON GSPAPS.StudentUSI = S.StudentUSI 
		AND GSPAPS.BeginDate = SSFSPA.BeginDate
		AND GSPAPS.EducationOrganizationId = SSFSPA.EducationOrganizationId
		AND GSPAPS.ProgramEducationOrganizationId = SSFSPA.ProgramEducationOrganizationId
		AND GSPAPS.ProgramName = SSFSPA.ProgramName
		AND GSPAPS.ProgramTypeDescriptorId = SSFSPA.ProgramTypeDescriptorId

	LEFT JOIN cte_Descriptors Eligibility WITH (NOLOCK)
		ON Eligibility.DescriptorId = GSPAPS.ParticipationStatusDescriptorId

/* 001 Start Block */
	LEFT JOIN edfi.GeneralStudentProgramAssociationProgramParticipationStatus GSPAP WITH (NOLOCK) --remove when skyward has updated landing point for elig
		 ON GSPAP.StudentUSI = S.StudentUSI 
		AND GSPAP.BeginDate = SSFSPA.BeginDate
		AND GSPAP.EducationOrganizationId = SSFSPA.EducationOrganizationId
		AND GSPAP.ProgramEducationOrganizationId = SSFSPA.ProgramEducationOrganizationId
		AND GSPAP.ProgramName = SSFSPA.ProgramName
		AND GSPAP.ProgramTypeDescriptorId = SSFSPA.ProgramTypeDescriptorId

	LEFT JOIN cte_Descriptors Eligibility2 WITH (NOLOCK) --remove when skyward has updated landing point for elig
		ON Eligibility2.DescriptorId = GSPAP.ParticipationStatusDescriptorId
/* 001 End Block */

	LEFT JOIN cte_Descriptors DirectCertificationStatus WITH (NOLOCK)
		ON DirectCertificationStatus.DescriptorId = SSFSPAE.DirectCertificationStatusDescriptorId

	LEFT JOIN cte_Descriptors Participation WITH (NOLOCK)
		ON Participation.DescriptorId = SSFSPASFSPS.SchoolFoodServiceProgramServiceDescriptorId

	LEFT JOIN cte_Descriptors ProgramType WITH (NOLOCK)
		ON ProgramType.DescriptorId = SSFSPA.ProgramTypeDescriptorId



