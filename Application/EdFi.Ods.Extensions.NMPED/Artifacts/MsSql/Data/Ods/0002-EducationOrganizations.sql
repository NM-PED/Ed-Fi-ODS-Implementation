SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET XACT_ABORT ON  

BEGIN TRANSACTION

-- ===========================================================
/* Author:		Cody Misplay
-- Create date: 06/16/2023
-- Description:	Seed script to build EducationOrganizationExtension table and populate all EdOrg/LEA/School data in Ed-Fi
--	This script contains the following sections
--    001: nmped.EducationOrganizationExtension Table Build
--    002: Dynamic SQL Declaration and Initialization
--    003: EducationOrganization and Extension Load
--    004: LocalEducationAgency Load
--    005: School Load
--    006: EducationOrganizationAddress Load
--	  007: EducationOrganizationCategory, SchoolCategory, SchoolGradeLevel Load
--
--	Alt: 001 - 06/28/2024 Cody Misplay
--		Updated to use NovaDB.dbo.EdOrg and subsequent tables/views to populate the temp tables directly.
--		MAKE SURE TO USE THE SchoolYear VARIABLE BELOW SINCE IT WILL BE USED TO QUERY NovaDB!!!
*/
-- ===========================================================

-- 001: nmped.EducationOrganizationExtension Table Build Begin
-- Drop the table if it exists
DROP TABLE IF EXISTS [nmped].[EducationOrganizationExtension];

-- Create extension table in NMPED schema (
CREATE TABLE [nmped].[EducationOrganizationExtension](
	[EducationOrganizationId] INT NOT NULL,
	[NCESNumber] VARCHAR(20) NULL,
	[PhoneNumber] VARCHAR(20) NULL,
	[LastStatusDate] DATE NULL,
	[OpenDate] DATE NULL,
	[CloseDate] DATE NULL,
	[PreviousSchoolId] INT NULL,
	[PreviousDistrictId] INT NULL,
	[PersistentlyDangerousStatus] BIT NOT NULL,
	[AlternativeLocation] BIT NOT NULL,
	[BoardingSchoolIndicator] BIT NOT NULL,
	[VirtualLocationStatusDescriptorId] INT NULL,
	[LunchProgramTypeDescriptorId] INT NULL,
	[MagnetLocationIndicator] BIT NOT NULL,
	[CreateDate] DATETIME2(7) NOT NULL,
	[LastModifiedDate] DATETIME2(7) NOT NULL,
 CONSTRAINT [EducationOrganizationExt_PK] PRIMARY KEY CLUSTERED 
(
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_PersistentlyDangerousStatus]  DEFAULT (0) FOR [PersistentlyDangerousStatus]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_AlternativeLocation]  DEFAULT (0) FOR [AlternativeLocation]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_BoardingSchoolIndicator]  DEFAULT (0) FOR [BoardingSchoolIndicator]
GO

ALTER TABLE [nmped].[EducationOrganizationExtension] ADD  CONSTRAINT [EducationOrganizationEx_DF_MagnetLocationIndicator]  DEFAULT (0) FOR [MagnetLocationIndicator]
GO

-- 001: nmped.EducationOrganizationExtension Table Build End

-- ===========================================================
-- Dynamic SQL: Declaration and Initialization - Copy this section if you need to run any subsection by itself
-- ===========================================================
DECLARE 
	-- Descriptor Namespace variables (CodeType and Repetitive Descriptions)
	 @CodeType_1	NVARCHAR(255) = 'uri://ed-fi.org/AddressTypeDescriptor'						-- EducationOrganizationAddress isn't needed for initial load
	,@CodeType_2	NVARCHAR(255) = 'uri://ed-fi.org/LocaleDescriptor'							-- EducationOrganizationAddress isn't needed for initial load
	,@CodeType_3	NVARCHAR(255) = 'uri://ed-fi.org/OperationalStatusDescriptor'				-- EducationOrganization field used in initial load
	,@CodeType_4	NVARCHAR(255) = 'uri://ed-fi.org/StateAbbreviationDescriptor'				-- EducationOrganizationAddress isn't needed for initial load
	,@CodeType_5	NVARCHAR(255) = 'uri://ed-fi.org/TitleIPartASchoolDesignationDescriptor'	-- School field
	,@CodeType_6	NVARCHAR(255) = 'uri://nmped.org/AdministrativeFundingControlDescriptor'	-- School field
	,@CodeType_7	NVARCHAR(255) = 'uri://nmped.org/CharterStatusDescriptor'					-- LocalEducationAgency AND School field
	,@CodeType_8	NVARCHAR(255) = 'uri://nmped.org/EducationOrganizationCategoryDescriptor'	-- EducationOrganizationCategory field
	,@CodeType_9	NVARCHAR(255) = 'uri://nmped.org/LocalEducationAgencyCategoryDescriptor'	-- LocalEducationAgency field
	,@CodeType10	NVARCHAR(255) = 'uri://nmped.org/LunchProgramTypeDescriptor'				-- EdOrg Extension field
	,@CodeType11	NVARCHAR(255) = 'uri://nmped.org/VirtualLocationStatusDescriptor'			-- EdOrg Extension field
	,@CodeType12	NVARCHAR(255) = 'uri://nmped.org/SchoolCategoryDescriptor'					-- SchoolCategory field
	,@CodeType13	NVARCHAR(255) = 'uri://nmped.org/GradeLevelDescriptor'						-- SchoolGradeLevel field
	,@CodeType14	NVARCHAR(255) = 'uri://nmped.org/SchoolTypeDescriptor'						-- EdFacts SchoolType field
	
	-- Dynamic SQL Variables
	,@DynSQL		NVARCHAR(MAX) = ''
	,@DynSQL_Sel	NVARCHAR(MAX) = '' -- For CodeList table
	,@Cnt			INT = 1
	
	-- Constants
	,@SchoolYear	INT = 2025
	
	-- Placeholder Variables for our Dynamic SQL
	,@IntValue1		INT
	,@IntValue2		INT
	,@BitValue1		BIT
	,@BitValue2		BIT
	,@BitValue3		BIT
	,@BitValue4		BIT
	,@EdOrgId		INT				-- Used in every table
	,@StringVal1	NVARCHAR(50)	-- Several small strings needed
	,@StringVal2	NVARCHAR(50)
	,@StringVal3	NVARCHAR(50)
	,@StringVal4	NVARCHAR(50)
	,@StringVal5	NVARCHAR(50)
	,@StringMid1	NVARCHAR(150)	-- Medium strings like NameOfInstitution, Discriminator, and StreetNumberName
	,@StringMid2	NVARCHAR(150)	-- Same as above
	,@StringMid3	NVARCHAR(150)	-- Added for ShortNameOfInstitution, too many strings in EdOrg!
	,@StringBig1	NVARCHAR(255)	-- Website is largest string field
	,@CodeValue1	NVARCHAR(50)
	,@CodeValue2	NVARCHAR(50)
	,@CodeValue3	NVARCHAR(50)
	,@CodeValue4	NVARCHAR(50)

SET @DynSql_Sel = 
	'SELECT TOP 1 [DescriptorId] 
	 FROM [edfi].[Descriptor] WITH (NOLOCK) 
	 WHERE 1 = 1 ';

-- 002: End of Declaration and Initialization section

-- ===========================================================
/* 003: EducationOrganization and Extension Load - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025
SELECT CASE WHEN row_number() OVER(ORDER BY VDL.SchoolYear) = 1 THEN '(' ELSE ',(' END +
CAST(EdOrgId AS VARCHAR(20)) + ',''' + 
REPLACE(NameOfInstitution,'''','''''') + ''',''' + 
REPLACE(ShortNameOfInstitution,'''','''''') + ''',' +
CASE WHEN WebSite IS NULL THEN 'NULL' ELSE '''' + WebSite + '''' END + ',''' + OperationalStatusDescription + ''',''' + Discriminator + ''',' +
CASE WHEN NCESNumber IS NULL THEN 'NULL' ELSE '''' + NCESNumber + '''' END + ',' + 
CASE WHEN PhoneNumber IS NULL THEN 'NULL' ELSE '''' + PhoneNumber + '''' END + ',' + 
CASE WHEN LastStatusDate IS NULL THEN 'NULL' ELSE '''' + CAST(CAST(LastStatusDate AS DATE) AS VARCHAR(12)) + '''' END + ',' + 
CASE WHEN OpenDate IS NULL THEN 'NULL' ELSE '''' + CAST(CAST(OpenDate AS DATE) AS VARCHAR(12)) + '''' END + ',' + 
CASE WHEN CloseDate IS NULL THEN 'NULL' ELSE '''' + CAST(CAST(CloseDate AS DATE) AS VARCHAR(12)) + '''' END + ',' + 
CASE WHEN PreviousSchoolId IS NULL THEN 'NULL' ELSE CAST(PreviousSchoolId AS VARCHAR(10)) END + ',' + 
CASE WHEN PreviousDistrictId IS NULL THEN 'NULL' ELSE CAST(PreviousDistrictId AS VARCHAR(10)) END + ',' + CAST(PersistentlyDangerousStatus AS VARCHAR(1)) + ',' +
CAST(AlternativeLocation AS VARCHAR(1)) + ',' + CAST(BoardingSchoolIndicator AS VARCHAR(1)) + ',' + 
CASE WHEN VirtualLocationStatusCode IS NULL THEN 'NULL' ELSE '''' + VirtualLocationStatusCode + '''' END + ',' +
CASE WHEN LunchProgramTypeCode IS NULL THEN 'NULL' ELSE '''' + LunchProgramTypeCode + '''' END + 
',' + CAST(MagnetLocationIndicator AS VARCHAR(1)) + 
')' AS [DynamicSQL]
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997'))
ORDER BY EdOrgId

*/
-- ===========================================================
-- SEA Insert First
INSERT INTO [edfi].[EducationOrganization]
           ([EducationOrganizationId]
           ,[NameOfInstitution]
		   ,[ShortNameOfInstitution]
           ,[OperationalStatusDescriptorId]
		   ,[Discriminator]
           ,[CreateDate]
           ,[LastModifiedDate])
     VALUES
	 (35000000,'New Mexico Public Education Department','NMPED',(SELECT TOP 1 DescriptorId from edfi.Descriptor WITH (NOLOCK) WHERE [Namespace] = 'uri://ed-fi.org/OperationalStatusDescriptor' AND CodeValue = 'Active'), 'edfi.StateEducationAgency' ,GETDATE(),GETDATE());

INSERT INTO [edfi].[StateEducationAgency]
           ([StateEducationAgencyId])
     VALUES
           (35000000);

-- LEA Inserts
DROP TABLE IF EXISTS #Temp_EdOrg_Val;

CREATE TABLE #Temp_EdOrg_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[EdOrgId]				INT					NOT NULL	-- EdOrgId
	,[StringMid1]			NVARCHAR(150) 		NOT NULL 	-- NameOfInstitution
	,[StringMid2]			NVARCHAR(150)		NULL		-- ShortNameOfInstitution
	,[StringBig1]			NVARCHAR(255) 		NULL 		-- Website
	,[CodeValue1]			NVARCHAR(50)		NOT NULL	-- OperationalStatus
	,[StringMid3]			NVARCHAR(150)		NULL		-- Discriminator
	,[StringVal1]			NVARCHAR(50)		NULL		-- NCESNumber
	,[StringVal2]			NVARCHAR(50)		NULL		-- PhoneNumber
	,[StringVal3]			NVARCHAR(50)		NULL		-- LastStatusDate
	,[StringVal4]			NVARCHAR(50)		NULL		-- OpenDate
	,[StringVal5]			NVARCHAR(50)		NULL		-- CloseDate
	,[IntValue1]			INT					NULL		-- PreviousSchoolId
	,[IntValue2]			INT					NULL		-- PreviousDistrictId
	,[BitValue1]			BIT					NOT NULL	-- PersistentlyDangerousStatus
	,[BitValue2]			BIT					NOT NULL	-- AlternativeLocation
	,[BitValue3]			BIT					NOT NULL	-- BoardingSchoolIndicator
	,[CodeValue2]			NVARCHAR(50)		NULL		-- VirtualLocationStatus
	,[CodeValue3]			NVARCHAR(50)		NULL		-- LunchProgramType
	,[BitValue4]			BIT					NOT NULL	-- MagnetLocationIndicator
);

INSERT INTO #Temp_EdOrg_Val(
	 [EdOrgId]
	,[StringMid1]
	,[StringMid2]
	,[StringBig1]
	,[CodeValue1]
	,[StringMid3]
	,[StringVal1]
	,[StringVal2]
	,[StringVal3]
	,[StringVal4]
	,[StringVal5]
	,[IntValue1]
	,[IntValue2]
	,[BitValue1]
	,[BitValue2]
	,[BitValue3]
	,[CodeValue2]
	,[CodeValue3]
	,[BitValue4]
) 
SELECT [EdOrgId]
	,[StringMid1]
	,[StringMid2]
	,[StringBig1]
	,[CodeValue1]
	,[StringMid3]
	,[StringVal1]
	,[StringVal2]
	,[StringVal3]
	,[StringVal4]
	,[StringVal5]
	,[IntValue1]
	,[IntValue2]
	,[BitValue1]
	,[BitValue2]
	,[BitValue3]
	,[CodeValue2]
	,[CodeValue3]
	,[BitValue4]
FROM (
--Alt 001 Block Begin

SELECT EdOrgId, 
	   NameOfInstitution, 
	   ShortNameOfInstitution, 
	   WebSite, 
	   OperationalStatusDescription, 
	   Discriminator, 
	   NCESNumber, 
	   PhoneNumber,
	   LastStatusDate,
	   OpenDate,
	   CloseDate,
	   PreviousSchoolId,
	   PreviousDistrictId,
	   PersistentlyDangerousStatus,
	   AlternativeLocation,
	   BoardingSchoolIndicator,
	   VirtualLocationStatusCode,
	   LunchProgramTypeCode,
	   MagnetLocationIndicator
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997'))
--Alt 001 Block End
)
AS EdOrgs (
	 [EdOrgId]
	,[StringMid1]
	,[StringMid2]
	,[StringBig1]
	,[CodeValue1]
	,[StringMid3]
	,[StringVal1]
	,[StringVal2]
	,[StringVal3]
	,[StringVal4]
	,[StringVal5]
	,[IntValue1]
	,[IntValue2]
	,[BitValue1]
	,[BitValue2]
	,[BitValue3]
	,[CodeValue2]
	,[CodeValue3]
	,[BitValue4]
)

-- First time through we load the EducationOrganization table
WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrg_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [EdOrgId]
	,@StringMid1 			= REPLACE([StringMid1], '''', '''''')
	,@StringMid2			= REPLACE([StringMid2], '''', '''''')
	,@StringBig1 			= [StringBig1]
	,@CodeValue1 			= [CodeValue1]
	,@StringMid3 			= [StringMid3]
	FROM #Temp_EdOrg_Val
	WHERE [AutoKey] = @Cnt;

	SET @DynSQL = 
		'INSERT INTO [edfi].[EducationOrganization]( 
			 [EducationOrganizationId]			
			,[NameOfInstitution]
			,[ShortNameOfInstitution]
			,[Website]
			,[OperationalStatusDescriptorId]
			,[Discriminator]
			,[CreateDate]
			,[LastModifiedDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringMid1  + ''' 
			, ''' + @StringMid2  + ''' 
			, ' + CASE WHEN @StringBig1 IS NULL THEN 'NULL' ELSE '''' + @StringBig1  + '''' END + '
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_3 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')			
			, ''' + @StringMid3  + ''' 
			, GETDATE(), GETDATE()	
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

-- Now we load the EdOrg Extension table
WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrg_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [EdOrgId]
	,@StringVal1 			= [StringVal1]
	,@StringVal2 			= [StringVal2]
	,@StringVal3 			= [StringVal3]
	,@StringVal4 			= [StringVal4]
	,@StringVal5 			= [StringVal5]
	,@IntValue1 			= [IntValue1]
	,@IntValue2 			= [IntValue2]
	,@BitValue1 			= [BitValue1]
	,@BitValue2 			= [BitValue2]
	,@BitValue3 			= [BitValue3]
	,@CodeValue2 			= [CodeValue2]
	,@CodeValue3 			= [CodeValue3]
	,@BitValue4				= [BitValue4]
	FROM #Temp_EdOrg_Val
	WHERE [AutoKey] = @Cnt;
	
	SET @DynSQL = 
		'INSERT INTO [nmped].[EducationOrganizationExtension]( 
			 [EducationOrganizationId]			
			,[NCESNumber]
			,[PhoneNumber]
			,[LastStatusDate]
			,[OpenDate]
			,[CloseDate]
			,[PreviousSchoolId]
			,[PreviousDistrictId]
			,[PersistentlyDangerousStatus]
			,[AlternativeLocation]
			,[BoardingSchoolIndicator]
			,[VirtualLocationStatusDescriptorId]
			,[LunchProgramTypeDescriptorId]
			,[MagnetLocationIndicator]
			,[CreateDate]
			,[LastModifiedDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ' + CASE WHEN @StringVal1 IS NULL THEN 'NULL' ELSE '''' + @StringVal1  + '''' END + '
			, ' + CASE WHEN @StringVal2 IS NULL THEN 'NULL' ELSE '''' + @StringVal2  + '''' END + '
			, ' + CASE WHEN @StringVal3 IS NULL THEN 'NULL' ELSE '''' + @StringVal3  + '''' END + '
			, ' + CASE WHEN @StringVal4 IS NULL THEN 'NULL' ELSE '''' + @StringVal4  + '''' END + '
			, ' + CASE WHEN @StringVal5 IS NULL THEN 'NULL' ELSE '''' + @StringVal5  + '''' END + ' 
			, ' + CASE WHEN @IntValue1 IS NULL THEN 'NULL' ELSE CAST(@IntValue1 AS NVARCHAR(10)) END  + '
			, ' + CASE WHEN @IntValue2 IS NULL THEN 'NULL' ELSE CAST(@IntValue2 AS NVARCHAR(10)) END  + '
			, ' + CAST(@BitValue1 AS NVARCHAR(10))  + '
			, ' + CAST(@BitValue2 AS NVARCHAR(10))  + '
			, ' + CAST(@BitValue3 AS NVARCHAR(10))  + '
			, (' + CASE WHEN @CodeValue2 IS NULL THEN 'NULL' ELSE
				@DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType11 + ''' AND [CodeValue] = ''' + @CodeValue2 + '''' END + ')
			, (' + CASE WHEN @CodeValue3 IS NULL THEN 'NULL' ELSE
				@DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType10 + ''' AND [CodeValue] = ''' + @CodeValue3 + '''' END + ')
			, ' + CAST(@BitValue4 AS NVARCHAR(10))  + '
			, GETDATE(), GETDATE()	
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrg_Val;

-- 003: EducationOrganization and Extension Load End

-- ===========================================================
/* 004: LocalEducationAgency Load Begin - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END +
CAST(DistrictId AS VARCHAR(20)) + ',''' + DistrictCategoryCode + ''',''' + DistrictCharterStatusCode + ''')' AS DynamicSQL
FROM NovaDB.dbo.vw_EdOrgDistricts D
WHERE SchoolYear = @SchoolYear
AND DistrictId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_EdOrgDistrict_Val;

CREATE TABLE #Temp_EdOrgDistrict_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[DistrictId]			INT					NOT NULL	-- EdOrgId/DistrictId
	,[CodeValue1]			NVARCHAR(50)		NOT NULL	-- DistrictCategoryId
	,[CodeValue2]			NVARCHAR(50)		NULL		-- CharterStatusId

);

INSERT INTO #Temp_EdOrgDistrict_Val(
	 [DistrictId]
	,[CodeValue1]
	,[CodeValue2]
) 
SELECT [DistrictId]
	,[CodeValue1]
	,[CodeValue2]
FROM (
--Alt 001 Block Begin

SELECT DistrictId,
	   DistrictCategoryCode,
	   DistrictCharterStatusCode
FROM NovaDB.dbo.vw_EdOrgDistricts D
WHERE SchoolYear = @SchoolYear
AND DistrictId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))
--Alt 001 Block End
)
AS EdOrgDistrict (
	 [DistrictId]
	,[CodeValue1]
	,[CodeValue2]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrgDistrict_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [DistrictId]
	,@CodeValue1 			= [CodeValue1]
	,@CodeValue2			= [CodeValue2]
	FROM #Temp_EdOrgDistrict_Val
	WHERE [AutoKey] = @Cnt;
	
	SET @DynSQL = 
		'INSERT INTO [edfi].[LocalEducationAgency]( 
			 [LocalEducationAgencyId]
			,[LocalEducationAgencyCategoryDescriptorId]
			,[CharterStatusDescriptorId]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_9 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')			
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_7 + ''' AND [CodeValue] = ''' + @CodeValue2 + ''')
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrgDistrict_Val;

-- 004: LocalEducationAgency Load End

-- ===========================================================
/* 005: School Load Begin - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END +
CAST(SchoolId AS VARCHAR(20)) + ',''' + CharterStatusCode + ''',' + 
CASE WHEN TitleICode IS NULL THEN 'NULL' ELSE '''' + TitleICode + '''' END + ',''' + AdminFundingCode + ''',' +
CAST(DistrictId AS VARCHAR(20)) + ',''' + SchoolTypeCode + ''')' AS DynamicSQL
FROM NovaDB.dbo.vw_EdOrgSchools
WHERE SchoolYear = @SchoolYear
AND SchoolId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_EdOrgSchool_Val;

CREATE TABLE #Temp_EdOrgSchool_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[SchoolId]				INT					NOT NULL	-- EdOrgId/SchoolId
	,[CodeValue1]			NVARCHAR(50)		NOT NULL	-- CharterStatusId
	,[CodeValue2]			NVARCHAR(50)		NULL		-- TitleIPartA
	,[CodeValue3]			NVARCHAR(50)		NULL		-- AdminFundingControl/Sizing
	,[DistrictId]			INT					NOT NULL	-- DistrictId
	,[CodeValue4]			NVARCHAR(50)		NULL		-- SchoolType
);

INSERT INTO #Temp_EdOrgSchool_Val(
	 [SchoolId]
	,[CodeValue1]
	,[CodeValue2]
	,[CodeValue3]
	,[DistrictId]
	,[CodeValue4]
) 
SELECT [SchoolId]
	,[CodeValue1]
	,[CodeValue2]
	,[CodeValue3]
	,[DistrictId]
	,[CodeValue4]
FROM (
--Alt 001 Block Begin

SELECT SchoolId,
	   CharterStatusCode,
	   TitleICode,
	   AdminFundingCode,
	   DistrictId,
	   SchoolTypeCode
FROM NovaDB.dbo.vw_EdOrgSchools
WHERE SchoolYear = @SchoolYear
AND SchoolId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))
--Alt 001 Block End
)
AS EdOrgSchool (
	 [SchoolId]
	,[CodeValue1]
	,[CodeValue2]
	,[CodeValue3]
	,[DistrictId]
	,[CodeValue4]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrgSchool_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [SchoolId]
	,@CodeValue1 			= [CodeValue1]
	,@CodeValue2 			= [CodeValue2]
	,@CodeValue3 			= [CodeValue3]
	,@IntValue1 			= [DistrictId]
	,@CodeValue4			= [CodeValue4]
	FROM #Temp_EdOrgSchool_Val
	WHERE [AutoKey] = @Cnt;
	
	SET @DynSQL = 
		'INSERT INTO [edfi].[School]( 
			 [SchoolId]
			,[CharterStatusDescriptorId]
			,[TitleIPartASchoolDesignationDescriptorId]
			,[AdministrativeFundingControlDescriptorId]
			,[LocalEducationAgencyId]
			,[SchoolTypeDescriptorId]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_7 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')			
			, (' + CASE WHEN @CodeValue2 IS NULL THEN 'NULL' ELSE
				@DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_5 + ''' AND [CodeValue] = ''' + @CodeValue2 + '''' END + ')
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_6 + ''' AND [CodeValue] = ''' + @CodeValue3 + ''')
			, ' + CAST(@IntValue1 AS NVARCHAR(10))  + '
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType14 + ''' AND [CodeValue] = ''' + @CodeValue4 + ''')	
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrgSchool_Val;

-- 005: School Load End

-- ===========================================================
/* 006: EducationOrganizationAddress Load Begin - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END + 
'''' + AddressTypeCode + ''',''' + City + ''',' + CAST(EdOrgId AS VARCHAR(20)) + ',''' + PostalCode + ''',''' + 
StateAbbreviationCode + ''',''' + StreetNumberName + ''',' + 
CASE WHEN ApartmentRoomSuiteNumber IS NULL THEN 'NULL' ELSE '''' + ApartmentRoomSuiteNumber + '''' END + ',' +
CASE WHEN BuildingSiteNumber IS NULL THEN 'NULL' ELSE '''' + BuildingSiteNumber + '''' END + ',' +
CASE WHEN NameOfCounty IS NULL THEN 'NULL' ELSE '''' + NameOfCounty + '''' END + ',' +
CASE WHEN Latitude IS NULL THEN 'NULL' ELSE '''' + Latitude + '''' END + ',' +
CASE WHEN Longitude IS NULL THEN 'NULL' ELSE '''' + Longitude + '''' END + ',' +
CASE WHEN LocaleCode IS NULL THEN 'NULL' ELSE '''' + LocaleCode + '''' END + ')' AS [DynamicSQL]
FROM NovaDB.dbo.vw_EdOrgAddresses
WHERE SchoolYear = @SchoolYear
AND EdOrgId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_EdOrgAddress_Val;

CREATE TABLE #Temp_EdOrgAddress_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[CodeValue1]			NVARCHAR(50)		NOT NULL	-- AddressType
	,[StringVal1]			NVARCHAR(50)		NULL		-- City
	,[EdOrgId]				INT					NOT NULL	-- EdOrgId
	,[StringVal2]			NVARCHAR(50)		NULL		-- PostalCode
	,[CodeValue2]			NVARCHAR(50)		NULL		-- StateAbbreviation
	,[StringMid1]			NVARCHAR(150) 		NOT NULL 	-- StreetNumberName
	,[StringMid2]			NVARCHAR(50)		NULL		-- ApartmentRoomSuiteNumber
	,[StringVal3]			NVARCHAR(50)		NULL		-- BuildingSiteNumber
	,[StringMid3]			NVARCHAR(150)		NULL		-- NameOfCounty
	,[StringVal4]			NVARCHAR(50)		NULL		-- Latitude
	,[StringVal5]			NVARCHAR(50)		NULL		-- Longitude
	,[CodeValue3]			NVARCHAR(50)		NULL		-- Locale	
	
);

INSERT INTO #Temp_EdOrgAddress_Val(
	 [CodeValue1]
	,[StringVal1]
	,[EdOrgId]
	,[StringVal2]
	,[CodeValue2]
	,[StringMid1]
	,[StringMid2]
	,[StringVal3]
	,[StringMid3]
	,[StringVal4]
	,[StringVal5]
	,[CodeValue3]
) 
SELECT [CodeValue1]
	,[StringVal1]
	,[EdOrgId]
	,[StringVal2]
	,[CodeValue2]
	,[StringMid1]
	,[StringMid2]
	,[StringVal3]
	,[StringMid3]
	,[StringVal4]
	,[StringVal5]
	,[CodeValue3]
FROM (
--Alt 001 Block Begin

SELECT AddressTypeCode,
	   City,
	   EdOrgId,
	   PostalCode,
	   StateAbbreviationCode,
	   StreetNumberName,
	   ApartmentRoomSuiteNumber,
	   BuildingSiteNumber,
	   NameOfCounty,
	   Latitude,
	   Longitude,
	   LocaleCode
FROM NovaDB.dbo.vw_EdOrgAddresses
WHERE SchoolYear = @SchoolYear
AND EdOrgId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))
--Alt 001 Block End

)
AS EdOrgAddress (
	 [CodeValue1]
	,[StringVal1]
	,[EdOrgId]
	,[StringVal2]
	,[CodeValue2]
	,[StringMid1]
	,[StringMid2]
	,[StringVal3]
	,[StringMid3]
	,[StringVal4]
	,[StringVal5]
	,[CodeValue3]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrgAddress_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [EdOrgId]
	,@CodeValue1			= [CodeValue1]			
	,@StringVal1			= [StringVal1]
	,@StringVal2			= [StringVal2]
	,@CodeValue2			= [CodeValue2]
	,@StringMid1			= [StringMid1]
	,@StringMid2			= [StringMid2]
	,@StringVal3			= [StringVal3]
	,@StringMid3			= [StringMid3]
	,@StringVal4			= [StringVal4]
	,@StringVal5			= [StringVal5]
	,@CodeValue3			= [CodeValue3]
	FROM #Temp_EdOrgAddress_Val
	WHERE [AutoKey] = @Cnt;
	
	SET @DynSQL = 
		'INSERT INTO [edfi].[EducationOrganizationAddress]( 
			 [AddressTypeDescriptorId]
			,[City]
			,[EducationOrganizationId]
			,[PostalCode]
			,[StateAbbreviationDescriptorId]
			,[StreetNumberName]
			,[ApartmentRoomSuiteNumber]
			,[BuildingSiteNumber]
			,[NameOfCounty]
			,[Latitude]
			,[Longitude]
			,[LocaleDescriptorId]
			,[CreateDate]
		)VALUES( 
			(' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_1 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')
			, ''' + @StringVal1  + ''' 
			, ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @StringVal2  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_4 + ''' AND [CodeValue] = ''' + @CodeValue2 + ''')			
			, ''' + @StringMid1  + ''' 
			, ' + CASE WHEN @StringMid2 IS NULL THEN 'NULL' ELSE '''' + @StringMid2  + '''' END + '
			, ' + CASE WHEN @StringVal3 IS NULL THEN 'NULL' ELSE '''' + @StringVal3  + '''' END + '
			, ' + CASE WHEN @StringMid3 IS NULL THEN 'NULL' ELSE '''' + @StringMid3  + '''' END + '
			, ' + CASE WHEN @StringVal4 IS NULL THEN 'NULL' ELSE '''' + @StringVal4  + '''' END + '
			, ' + CASE WHEN @StringVal5 IS NULL THEN 'NULL' ELSE '''' + @StringVal5  + '''' END + ' 
			, (' + CASE WHEN @CodeValue3 IS NULL THEN 'NULL' ELSE
				@DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_2 + ''' AND [CodeValue] = ''' + @CodeValue3 + '''' END + ')
			, GETDATE()
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrgAddress_Val;

-- 006: EducationOrganizationAddress Load End

-- ===========================================================
/* 007: EducationOrganizationCategory, SchoolCategory, SchoolGradeLevel Load Begin - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END + 
CAST(EdOrgId AS VARCHAR(20)) + ',''' + 
(SELECT CodeValue + ''',''' + CodeType + '''' FROM NovaDB.dbo.EdOrgCodeList WHERE Id = EOC.CharacteristicId) +
')' AS [DynamicSQL], row_number() OVER(ORDER BY SchoolYear) [ROWS]
FROM NovaDB.dbo.EdOrgCharacteristic EOC
WHERE SchoolYear = @SchoolYear 
AND EOC.EdOrgId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))
ORDER BY [ROWS]

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_EdOrgCharacteristic_Val;

CREATE TABLE #Temp_EdOrgCharacteristic_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[EdOrgId]				INT					NOT NULL	-- EdOrgId
	,[CodeValue1]			NVARCHAR(50)		NOT NULL	-- Characteristic
	,[CodeValue2]			NVARCHAR(50)		NULL		-- CharacteristicType
);

INSERT INTO #Temp_EdOrgCharacteristic_Val(
	 [EdOrgId]
	,[CodeValue1]
	,[CodeValue2]
) 
SELECT [EdOrgId]
	,[CodeValue1]
	,[CodeValue2]
FROM (
--Alt 001 Block Begin

SELECT EdOrgId,
	   EOCL.CodeValue,
	   EOCL.CodeType
FROM NovaDB.dbo.EdOrgCharacteristic EOC
INNER JOIN NovaDB.dbo.EdOrgCodeList EOCL
ON EOCL.Id = EOC.CharacteristicId
WHERE SchoolYear = @SchoolYear 
AND EOC.EdOrgId IN (
SELECT EO.EdOrgId
FROM NovaDB.dbo.vw_district_location VDL
LEFT JOIN NovaDB.dbo.vw_EdOrgs EO WITH (NOLOCK) 
	ON (EO.EdOrgId = VDL.EdOrgId_School 
		AND EO.SchoolYear = VDL.SchoolYear)
WHERE EO.SchoolYear = @SchoolYear
AND VDL.LocationStatus IN ('Active','New','Reopened','Changed')
AND VDL.DistrictCategory IN ('State District','State Charter','State Supported')
AND (VDL.LocationCategory IN ('Public','Charter','Off-Site','Central Office','State Supported','Home School')
	OR (VDL.LocationCode = '997')))
--Alt 001 Block End
)
AS EdOrgCharacteristic (
	 [EdOrgId]
	,[CodeValue1]
	,[CodeValue2]
)

-- Start with EducationOrganizationCategory
WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_EdOrgCharacteristic_Val))
BEGIN

	SELECT 
	 @EdOrgId	 			= [EdOrgId]
	,@CodeValue1 			= [CodeValue1]
	,@CodeValue2 			= [CodeValue2]
	FROM #Temp_EdOrgCharacteristic_Val
	WHERE [AutoKey] = @Cnt;
	
	IF @CodeValue2 = 'EducationOrganizationCategoryDescriptor'
		BEGIN

		SET @DynSQL = 
			'INSERT INTO [edfi].[EducationOrganizationCategory]( 
				 [EducationOrganizationId]			
				,[EducationOrganizationCategoryDescriptorId]
				,[CreateDate]
			)VALUES( 
				  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
				, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_8 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')
				, GETDATE()	
			);'
			
		END
		
	IF @CodeValue2 = 'SchoolCategoryDescriptor'
		BEGIN
		
		SET @DynSQL = 
		'INSERT INTO [edfi].[SchoolCategory]( 
			 [SchoolId]			
			,[SchoolCategoryDescriptorId]
			,[CreateDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType12 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')
			, GETDATE()
		);'
		
		END
		
	IF @CodeValue2 = 'GradeLevelDescriptor'
		BEGIN
		
		SET @DynSQL = 
		'INSERT INTO [edfi].[SchoolGradeLevel]( 
			 [SchoolId]			
			,[GradeLevelDescriptorId]
			,[CreateDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType13 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''')
			, GETDATE()	
		);'
		
		END

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_EdOrgCharacteristic_Val;

COMMIT TRANSACTION
-- 007: EducationOrganizationCategory, SchoolCategory, SchoolGradeLevel Load End
