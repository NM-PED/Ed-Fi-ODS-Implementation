/* © NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a studentSectionAssociations view
 *			from the studentSectionAssociations Ed-Fi Resource
 
 * Alt Id:	 001
 * By:		 Jesse Kain | IT Contractor
 * Email:	 douglas.kain@ped.nm.gov
 * Date:	 07/12/2023
 * Alt Desc: Added DistOrgType, LocOrgType, and Student Grade Level

* Alt Id:    002
* By:        Jesse Kain | IT Contractor
* Email:     douglas.kain@ped.nm.gov
* Date:      07/12/2023
* Alt Desc: Added Student Middle Initial

* Alt Id:    003
* By:        Collin Neville | IT App Dev 1
* Email:     collin.neville@ped.nm.gov
* Date:      11/17/2023
* Alt Desc: Added State Course Code


* Alt Id:   004
* By:		Jon hickam
* Date		12/13/23
*alt desc:	Add enrollment and exit dates

* Alt Id:   005
* By:		Cody Misplay - cody.misplay@ped.nm.gov
* Date		07/26/2024
*alt desc:	Added LastDay and join to SectionProgram table. Updated descriptors to use control tables instead of namespaces (which can be mixed).

 */

CREATE OR ALTER   VIEW [nmped_rpt].[vw_studentSectionAssociations] AS 
WITH cte_Descriptors AS (
	SELECT
		 DescriptorId
		,CodeValue
		,Description
	FROM 
		edfi.Descriptor WITH (NOLOCK) 
	WHERE -- Alt ID 005
		--Namespace IN ('uri://ed-fi.org/RepeatIdentifierDescriptor'
		--			 ,'uri://ed-fi.org/AttemptStatusDescriptor'
		--			 ,'uri://nmped.org/SpecialProgramCodeDescriptor'
		--			 ,'uri://nmped.org/GradeLevelDescriptor'))
		DescriptorId IN (
			SELECT RepeatIdentifierDescriptorId FROM edfi.RepeatIdentifierDescriptor
			UNION
			SELECT AttemptStatusDescriptorId FROM edfi.AttemptStatusDescriptor
			UNION
			SELECT SpecialProgramCodeDescriptorId FROM nmped.SpecialProgramCodeDescriptor
			UNION
			SELECT GradeLevelDescriptorId FROM edfi.GradeLevelDescriptor
			UNION
			SELECT ProgramTypeDescriptorId FROM edfi.ProgramTypeDescriptor
			)) -- Alt ID 005

SELECT DISTINCT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.DistrictOrgType	-- Alt ID 001							   
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	,VDL.LocationOrgType	-- Alt ID 001	
	,VDL.LastDay			-- Alt ID 005

	--resource documentation starts
	,S.StudentUSI
	,StudentUniqueId
	,FirstName
	,MiddleName
	,LastSurname
	,EntryGradeLevel.CodeValue			[GradeLevel]									  
	,SSA.BeginDate
	,SSA.LocalCourseCode
	,CO.CourseCode						[StateCourseCode] -- AltID 003
	,SSA.SchoolId
	,SSA.SchoolYear
	,SSA.SectionIdentifier

	-- Session Dates
	,SESS.BeginDate AS [SessionBeginDate]
	,SESS.EndDate AS [SessionEndDate]

	,SSA.SessionName
	,AttemptStatus.CodeValue			[AttemptStatusCode]
	,AttemptStatus.[Description]			[AttemptStatusDescription]
	,SSA.EndDate
	,HomeroomIndicator	
	,RepeatIdentifier.CodeValue			[RepeatIdentifierCode]
	,RepeatIdentifier.[Description]		[RepeatIdentifierDescription]
	,TeacherStudentDataLinkExclusion

	,SpecialProgramCode.CodeValue		[SpecialProgramCode]
	,SpecialProgramCode.[Description]	[SpecialProgramDescription]
	,AlternateCreditCourseCode

	,SectionProgram.CodeValue			[SectionProgramCode]
	,SectionProgram.[Description]		[SectionProgramDescription]
	,SP.ProgramName						[SectionProgramName]

	--table CreateDate/LastModifiedDate
	,SSA.CreateDate										
	,SSA.LastModifiedDate
	,SSA.Id AS [StudentSectionAssociation_Id]

	,SSA_School.EntryDate
	,SSA_School.ExitWithdrawDate
FROM
	edfi.StudentSectionAssociation SSA WITH (NOLOCK)

	INNER JOIN edfi.[Session] SESS
		ON (SESS.SessionName = SSA.SessionName 
		AND SESS.SchoolId = SSA.SchoolId)

	INNER JOIN edfi.Student S WITH (NOLOCK) 
		ON S.StudentUSI = SSA.StudentUSI

	-- for student's grade level							
	INNER JOIN edfi.StudentSchoolAssociation SSA_School WITH (NOLOCK)																	  
		ON SSA_School.StudentUSI = SSA.StudentUSI																
		AND SSA_School.SchoolId = SSA.SchoolId	
		
	INNER JOIN nmped.StudentSectionAssociationExtension SSAE WITH (NOLOCK)
		ON SSAE.BeginDate = SSA.BeginDate
		AND SSAE.LocalCourseCode = SSA.LocalCourseCode
		AND SSAE.SchoolId = SSA.SchoolId
		AND SSAE.SchoolYear = SSA.SchoolYear
		AND SSAE.SectionIdentifier = SSA.SectionIdentifier
		AND SSAE.SessionName = SSA.SessionName
		AND SSAE.StudentUSI = SSA.StudentUSI

	INNER JOIN edfi.CourseOffering CO WITH (NOLOCK)
		ON CO.SchoolId = SSA.SchoolId
		AND CO.LocalCourseCode = SSA.LocalCourseCode
		AND CO.SessionName = SSA.SessionName

	LEFT JOIN edfi.SectionProgram SP
		ON SP.LocalCourseCode = SSA.LocalCourseCode
		AND SP.SchoolId = SSA.SchoolId
		AND SP.SchoolYear = SSA.SchoolYear
		AND SP.SectionIdentifier = SSA.SectionIdentifier
		AND SP.SessionName = SSA.SessionName

	INNER JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId

	LEFT JOIN cte_Descriptors AttemptStatus WITH (NOLOCK)
		ON AttemptStatus.DescriptorId = SSA.AttemptStatusDescriptorId

	LEFT JOIN cte_Descriptors RepeatIdentifier WITH (NOLOCK)
		ON RepeatIdentifier.DescriptorId = SSA.RepeatIdentifierDescriptorId

	LEFT JOIN cte_Descriptors SpecialProgramCode WITH (NOLOCK)
		ON SpecialProgramCode.DescriptorId = SSAE.SpecialProgramCodeDescriptorId
	-- student's grade level					 
	LEFT JOIN cte_Descriptors EntryGradeLevel																  
		ON EntryGradeLevel.DescriptorId = SSA_School.EntryGradeLevelDescriptorId	
		
	LEFT JOIN cte_Descriptors SectionProgram
		ON SectionProgram.DescriptorId = SP.ProgramTypeDescriptorId
GO

