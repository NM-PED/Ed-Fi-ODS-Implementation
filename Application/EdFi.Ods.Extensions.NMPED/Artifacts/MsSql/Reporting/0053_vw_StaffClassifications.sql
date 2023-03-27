/* © NMPED 2023
* 300 Don Gaspar Ave.
* Santa Fe, NM 87501
* Information Technology Division
* By: Cody Misplay | Code Monkey III
* Email: cody.misplay@ped.nm.gov
* Date: 03/20/2023 (Happy Equinox!)
* Desc: This view displays Staff Assignments (Classifications) including two forms of Identification
* The view incorporates data from the following tables:
* - edfi.Staff
* - edfi.StaffEducationOrganizationAssignmentAssociation
* - edfi.StaffIdentificationCode (twice)
* - edfi.Descriptor (twice)
* - edfi.EducationOrganization (twice)
*
* The view is partially based on a view created by Jon Hickam * Email:	jon@redglobeinc.com
* 
* --I left this here for easy reference when updated--
* Alt Id: 001 (Increment value each change)
* By: 'Updaters Name' | 'Creators Title'
* Email: 'Updaters Email'
* Date: 'Date Updated'
* Alt Desc: 'Description of the change'
*/
CREATE OR ALTER VIEW [nmped_rpt].[vw_StaffClassifications]
AS


WITH cte_StaffIdentification AS (
SELECT  SIC.StaffUSI
		,SIC.AssigningOrganizationIdentificationCode
		,StaffIdSystem.CodeValue AS [StaffIdSystem]
		,SIC.IdentificationCode
FROM edfi.StaffIdentificationCode SIC WITH (NOLOCK)
LEFT JOIN edfi.Descriptor StaffIdSystem WITH (NOLOCK) ON (StaffIdSystem.DescriptorId = SIC.StaffIdentificationSystemDescriptorId)
WHERE StaffIdSystem.CodeValue IN ('SSN', 'Professional Certificate')
)

SELECT 
	 S.StaffUniqueId
	 ,S.StaffUSI
	 ,Employer.EducationOrganizationId AS [EmployerId]
	 ,Employer.NameOfInstitution AS [EmployerName]
	 ,SUBSTRING(CAST(SEOAA.EducationOrganizationId AS VARCHAR(10)), 3, 3) AS [DistrictCode]
	 ,District.NameOfInstitution AS [DistrictName]
	 ,District.EducationOrganizationId AS [DistrictId]
	 ,S.FirstName
	 ,S.MiddleName 
	 ,S.LastSurname AS [LastName]
	 ,S.BirthDate
	 ,EmploymentStatusDescriptor.CodeValue AS [EmploymentStatusCode]
	 ,EmploymentStatusDescriptor.ShortDescription AS [EmploymentStatusDescription]
	 ,SEOAA.FullTimeEquivalency AS [FTE]
	 ,StaffClassificationDescriptor.CodeValue AS [StaffClassificationCode]
	 ,StaffClassificationDescriptor.ShortDescription AS [StaffClassificationDescription]
	 ,SEOAA.BeginDate
	 ,SEOAA.EmploymentHireDate AS [HireDate]
	 ,SEOAA.EndDate
	,ID_SSN.IdentificationCode AS [StaffId]
	,ID_Cert.IdentificationCode AS [CertNum]
	FROM
	edfi.Staff S WITH (NOLOCK)
	RIGHT JOIN edfi.StaffEducationOrganizationAssignmentAssociation SEOAA WITH (NOLOCK)
		ON (S.StaffUSI = SEOAA.StaffUSI)
    LEFT JOIN edfi.EducationOrganization Employer WITH (NOLOCK)
		ON (Employer.EducationOrganizationId = SEOAA.EducationOrganizationId)
	LEFT JOIN edfi.EducationOrganization District WITH (NOLOCK)
		ON (District.EducationOrganizationId = SUBSTRING(CAST(SEOAA.EducationOrganizationId AS VARCHAR(10)), 1, 5) + '000'
		AND District.Discriminator = 'edfi.LocalEducationAgency')
	LEFT JOIN edfi.Descriptor EmploymentStatusDescriptor WITH (NOLOCK)
		ON (EmploymentStatusDescriptor.DescriptorId = SEOAA.EmploymentStatusDescriptorId)
	LEFT JOIN edfi.Descriptor staffClassificationDescriptor  WITH (NOLOCK)
		ON (StaffClassificationDescriptor.DescriptorId = SEOAA.StaffClassificationDescriptorId)
	LEFT JOIN cte_StaffIdentification ID_SSN
		ON (ID_SSN.StaffUSI = SEOAA.StaffUSI AND ID_SSN.StaffIdSystem = 'SSN')
	LEFT JOIN cte_StaffIdentification ID_Cert
		ON (ID_Cert.StaffUSI = SEOAA.StaffUSI AND ID_Cert.StaffIdSystem = 'Professional Certificate')

GO