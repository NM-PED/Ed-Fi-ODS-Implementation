/* � NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a staffs view
 *			from the staffs Ed-Fi Resource
 *
 * Alt Id:	001 (Increment value each change)
 * By:		Collin Neville | App Dev I
 * Email:	collin.neville@ped.nm.gov
 * Date:	04/19/2023
 * Alt Desc: Added CTE to the view to grab all Descriptors after noticing significant
 *           performance issues when accessing descriptor fields.
 *
 * Alt Id:	002 (Increment value each change)
 * By:		Jon Hickam | Contractor
 * Email:	jon@redglobeinc.com
 * Date:	12/17/2023
 * Alt Desc: Added staff employment.
 *
 * Alt Id:	003
 * By:		Collin Neville | App Dev 1
 * Email:	collin.neville@ped.nm.gov
 * Date:	01/04/2024
 * Alt Desc: Stuffed multiple emails into one row
 */
 
CREATE OR ALTER         VIEW [nmped_rpt].[vw_staffs] AS 
--Alt Id: 001 - New CTE using control tables for descriptors
WITH cte_Descriptors AS (
	SELECT
		 DescriptorId
		,CodeValue
		,Description
	FROM
		edfi.Descriptor WITH (NOLOCK)
	WHERE
		DescriptorId IN (	SELECT * FROM edfi.VisaDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.TribalAffiliationDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.RaceDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.LanguageDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.LanguageUseDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.StaffIdentificationSystemDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.ElectronicMailTypeDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.CitizenshipStatusDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.LevelOfEducationDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.OldEthnicityDescriptor WITH (NOLOCK)
							UNION
							SELECT * FROM edfi.SexDescriptor WITH (NOLOCK)
	
	)

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
	,StaffUniqueId
	,FirstName
	,LastSurname
--	,personReference not collected
--	,addresses not used
--	,ancestryEthnicOrigins not collected
	,BirthDate
	,CitizenshipStatus.CodeValue					[CitizenshipStatusCode]
	,CitizenshipStatus.Description					[CitizenshipStatusDescription]
--	,credentials not collected

	/* 003 Begin block */ 
	--,ElectronicMailAddress
	--,ElectronicMailType.CodeValue					[ElectronicMailTypeCode]
	--,ElectronicMailType.Description				[ElectronicMailTypeDescription]
	,STUFF(
				(
					SELECT	DISTINCT ', ' + ElectronicMailAddress
					FROM	edfi.StaffElectronicMail SEM2
					WHERE	SEM2.StaffUSI = S.StaffUSI
					FOR	XML PATH ('')
				)
				, 1, 1, ''
		  ) AS 'ElectronicMailAddress'
	,STUFF(
				(
					SELECT	DISTINCT ', ' + EmailType.CodeValue
					FROM	edfi.StaffElectronicMail SEM3
						JOIN edfi.Descriptor EmailType
							ON EmailType.DescriptorId = SEM3.ElectronicMailTypeDescriptorId
					WHERE	SEM3.StaffUSI = S.StaffUSI
					FOR	XML PATH ('')
				)
				, 1, 1, ''
		  ) AS 'ElectronicMailTypeCode'
--	,SEM.DoNotPublishIndicator
--	,SEM.PrimaryEmailAddressIndicator
	/* 003 End block */ 

	,GenerationCodeSuffix
	,HighestCompletedLevelOfEducation.CodeValue		[HighestCompletedLevelOfEducationCode]
	,HighestCompletedLevelOfEducation.Description	[HighestCompletedLevelOfEducationDescription]
	,HighlyQualifiedTeacher
	,HispanicLatinoEthnicity
	,StaffIdentificationSystem.CodeValue			[StaffIdentificationSystemCode]
	,StaffIdentificationSystem.Description			[StaffIdentificationSystemDescription]
	,AssigningOrganizationIdentificationCode
	,IdentificationCode
--	,identifcationDocuments not collected
--	,internationalAddresses not collected
	,Language.CodeValue								[LanguageCode]
	,Language.Description							[LanguageDescription]
	,LanguageUse.CodeValue							[LanguageUseCode]
	,LanguageUse.Description						[LanguageUseDescription]
	,LoginId
	,MaidenName
	,MiddleName
	,OldEthnicity.CodeValue							[OldEthnicityCode]
	,OldEthnicity.Description						[OldEthnicityDescription]
--	,otherNames not collected
--	,personalIdentificationDocuments not collected
	,PersonalTitlePrefix
	,Race.CodeValue									[RaceCode]
	,Race.Description								[RaceDescription]
--	,recognitions not collected
	,Sex.CodeValue									[SexCode]
	,Sex.Description								[SexDescription]
--	,telephones not used
	,TribalAffiliation.CodeValue					[TribalAffiliationCode]
	,TribalAffiliation.Description					[TribalAffiliationDescription]
	,Visa.CodeValue									[VisaCode]
	,Visa.Description								[VisaDescription]
	,YearsOfPriorProfessionalExperience
	,YearsOfPriorTeachingExperience

	--table CreateDate/LastModifiedDate
	,S.CreateDate										
	,S.LastModifiedDate

	/* Alt Id: 002 Start Block*/ 
	,SEOEA.BeginDate								[AssignmentBeginDate]
	,SEOEA.EndDate									[AssignmentEndDate]
	,StaffEmployment.HireDate
	,StaffEmployment.EndDate						[EmploymentEndDate]
	/* Alt Id: 002 End Block*/ 
FROM 
	edfi.Staff S WITH (NOLOCK)

	JOIN edfi.StaffEducationOrganizationAssignmentAssociation SEOEA WITH (NOLOCK)
		ON SEOEA.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.School assignmentSchool WITH (NOLOCK)
		ON SEOEA.EducationOrganizationId = assignmentSchool.SchoolId

	--Alt Id: 002
	JOIN edfi.StaffEducationOrganizationEmploymentAssociation StaffEmployment WITH (NOLOCK)
		ON StaffEmployment.StaffUSI = SEOEA.StaffUSI
		AND (SEOEA.EducationOrganizationId = StaffEmployment.EducationOrganizationId
		OR StaffEmployment.EducationOrganizationId = assignmentSchool.LocalEducationAgencyId)

	LEFT JOIN edfi.StaffElectronicMail SEM WITH (NOLOCK)
		ON SEM.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.StaffIdentificationCode SIC WITH (NOLOCK)
		ON SIC.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.StaffLanguage SL WITH (NOLOCK)
		ON SL.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.StaffLanguageUse SLU WITH (NOLOCK)
		ON SLU.StaffUSI = SL.StaffUSI
		AND SLU.LanguageDescriptorId = SL.LanguageDescriptorId

	LEFT JOIN edfi.StaffRace SR WITH (NOLOCK)
		ON SR.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.StaffTribalAffiliation STA WITH (NOLOCK)
		ON STA.StaffUSI = S.StaffUSI

	LEFT JOIN edfi.StaffVisa SV WITH (NOLOCK)
		ON SV.StaffUSI = S.StaffUSI

-- Alt Id: 001 - Updated joins to Descriptor table to use the CTE instead
	LEFT JOIN cte_Descriptors Visa WITH (NOLOCK)
		ON Visa.DescriptorId = SV.VisaDescriptorId

	LEFT JOIN cte_Descriptors TribalAffiliation WITH (NOLOCK)
		ON TribalAffiliation.DescriptorId = STA.TribalAffiliationDescriptorId

	LEFT JOIN cte_Descriptors Race WITH (NOLOCK)
		ON Race.DescriptorId = SR.RaceDescriptorId

	LEFT JOIN cte_Descriptors Language WITH (NOLOCK)
		ON Language.DescriptorId = SL.LanguageDescriptorId

	LEFT JOIN cte_Descriptors LanguageUse WITH (NOLOCK)
		ON LanguageUse.DescriptorId = SLU.LanguageUseDescriptorId

	LEFT JOIN cte_Descriptors StaffIdentificationSystem WITH (NOLOCK)
		ON StaffIdentificationSystem.DescriptorId = SIC.StaffIdentificationSystemDescriptorId

	LEFT JOIN cte_Descriptors ElectronicMailType WITH (NOLOCK)
		ON ElectronicMailType.DescriptorId = SEM.ElectronicMailTypeDescriptorId

	LEFT JOIN cte_Descriptors CitizenshipStatus WITH (NOLOCK)
		ON CitizenshipStatus.DescriptorId = S.CitizenshipStatusDescriptorId

	LEFT JOIN cte_Descriptors HighestCompletedLevelOfEducation WITH (NOLOCK)
		ON HighestCompletedLevelOfEducation.DescriptorId = S.HighestCompletedLevelOfEducationDescriptorId

	LEFT JOIN cte_Descriptors OldEthnicity WITH (NOLOCK)
		ON OldEthnicity.DescriptorId = S.OldEthnicityDescriptorId

	LEFT JOIN cte_Descriptors Sex WITH (NOLOCK)
		ON Sex.DescriptorId = S.SexDescriptorId
-- Alt Id: 001 - End

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SEOEA.EducationOrganizationId
WHERE
	-- we only want to include codes that are SSN's or NULL values
	(StaffIdentificationSystem.CodeValue = 'SSN' OR StaffIdentificationSystem.CodeValue IS NULL)
GO


