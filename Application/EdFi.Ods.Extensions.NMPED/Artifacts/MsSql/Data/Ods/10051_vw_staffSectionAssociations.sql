SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/* � NMPED 2023
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technology Division
 *
 * By:		Collin Neville | App Dev I
 * Email:	Collin.Neville@ped.nm.gov
 * Date:	03-20-2023
 * Desc:	This script creates a staffSectionAssociations view
 *			from the staffSectionAssociations Ed-Fi Resource
 */

CREATE OR ALTER     VIEW [nmped_rpt].[vw_staffSectionAssociations] AS 
SELECT
	--standard school/district columns
	 VDL.EducationOrganizationId_District
	,VDL.DistrictCode
	,VDL.DistrictName
	,VDL.EducationOrganizationId_School
	,VDL.LocationCode
	,VDL.SchoolName	
	,VDL.[DistrictOrgType]
	,VDL.[LocationOrgType]
	,VDL.[SchoolCategory]

	--resource documentation starts
	,S.StaffUSI
	,StaffUniqueId
	,FirstName
	,LastSurname
	,SSA.LocalCourseCode
	,CO.CourseCode AS [StateCourseCode]
	,SSA.SchoolYear
	,SectionIdentifier

	-- Session Dates
	,SESS.BeginDate AS [SessionBeginDate]
	,SESS.EndDate AS [SessionEndDate]

	,SSA.SessionName
	,SSA.BeginDate
	,ClassroomPosition.CodeValue	[ClassroomPositionCode]
	,ClassroomPosition.Description	[ClassroomPositionDescription]
	,SSA.EndDate
	,SSA.HighlyQualifiedTeacher
	,PercentageContribution
	,TeacherStudentDataLinkExclusion

	--table CreateDate/LastModifiedDate
	,SSA.CreateDate										
	,SSA.LastModifiedDate
	,SSA.Id AS [StaffSectionAssociation_Id]
FROM
	edfi.StaffSectionAssociation SSA WITH (NOLOCK)

	INNER JOIN edfi.[Session] SESS
		ON (SESS.SessionName = SSA.SessionName 
		AND SESS.SchoolId = SSA.SchoolId)

	JOIN edfi.Staff S WITH (NOLOCK)
		ON S.StaffUSI = SSA.StaffUSI

	LEFT JOIN edfi.Descriptor ClassroomPosition WITH (NOLOCK)
		ON ClassroomPosition.DescriptorId = SSA.ClassroomPositionDescriptorId

	JOIN nmped_rpt.vw_district_location VDL WITH (NOLOCK)
		ON VDL.EducationOrganizationId_School = SSA.SchoolId

	LEFT JOIN edfi.CourseOffering CO
		ON (CO.LocalCourseCode = SSA.LocalCourseCode
		AND CO.SessionName = SSA.SessionName
		AND CO.SchoolId = SSA.SchoolId)
GO
