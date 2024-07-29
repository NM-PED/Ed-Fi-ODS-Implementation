SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET XACT_ABORT ON  

BEGIN TRANSACTION

-- ===========================================================
/* Author:		Cody Misplay
-- Create date: 06/16/2023
-- Description:	Seed script to populate NMPED Course data in Ed-Fi
--	This script contains the following sections
--    001: Dynamic SQL Declaration and Initialization
--    002: Course (List) Load
--    003: CourseOfferedGradeLevel Load
--    004: CourseLevelCharacteristic Load
--
--	Alt: 001 - 06/28/2024 Cody Misplay
--		Updated to use NovaDB.dbo.CourseList and subsequent tables/views to populate the temp tables directly.
--		MAKE SURE TO USE THE SchoolYear VARIABLE BELOW SINCE IT WILL BE USED TO QUERY NovaDB!!!
*/
-- ===========================================================

-- ===========================================================
-- 001: Dynamic SQL: Declaration and Initialization - Copy this section if you need to run any subsection by itself
-- ===========================================================
DECLARE 
	-- CourseCodeList variables (CodeType and Repetitive Descriptions)
	 @CodeType_1	NVARCHAR(255) = 'uri://nmped.org/GradeLevelDescriptor'
	,@CodeType_2	NVARCHAR(255) = 'uri://nmped.org/AcademicSubjectDescriptor'
	,@CodeType_3A	NVARCHAR(255) = 'uri://ed-fi.org/CourseLevelCharacteristicDescriptor'
	,@CodeType_3B	NVARCHAR(255) = 'uri://nmped.org/CourseLevelCharacteristicDescriptor'
	
	-- Dynamic SQL Variables
	,@DynSQL		NVARCHAR(MAX) = ''
	,@DynSQL_Sel	NVARCHAR(MAX) = '' -- For CodeList table
	,@Cnt			INT = 1
	
	,@EdOrgId		INT = 35000000
	,@SchoolYear	INT = 2025

	-- Placeholder Variables for our Dynamic SQL
	,@IntValue1		INT
	,@CourseCode	NVARCHAR(50)	-- Used in every table
	,@CourseTitle	NVARCHAR(255)	-- Only medium string used
	,@CourseDesc	NVARCHAR(MAX)	-- Descriptions for courses are large
	,@CodeValue1	NVARCHAR(50)

SET @DynSql_Sel = 
	'SELECT TOP 1 [DescriptorId] 
	 FROM [edfi].[Descriptor] WITH (NOLOCK) 
	 WHERE 1 = 1 ';

-- 001: Dynamic SQL: Declaration and Initialization section End

-- ===========================================================
/* 002: Course (List) Load Begin - Commented code retrieves lines for insert statement below.
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025;
DECLARE @EdOrgId INT = 35000000;
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END +
'''' + CourseCode + ''', @EdOrgId, ''' + CourseTitle + ''', 1,''' + AcademicSubjectCode + ''',''' +
REPLACE(CourseDescription, '''','''''') + ''')' AS [DynamicSQL]

FROM NovaDB.dbo.vw_Courses
WHERE SchoolYear = @SchoolYear

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_Course_Val;

CREATE TABLE #Temp_Course_Val(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[EdOrgId]				INT					NOT NULL
	,[CourseCode]			NVARCHAR(50)		NOT NULL
	,[CodeValue1]			NVARCHAR(50) 		NOT NULL
	,[CourseTitle]			NVARCHAR(255) 		NOT NULL
	,[CourseDescription]	NVARCHAR(MAX)		NOT NULL
	,[IntValue1]			INT					NOT NULL
);

INSERT INTO #Temp_Course_Val(
	 [CourseCode]
	,[EdOrgId]
	,[CourseTitle]
	,[IntValue1]
	,[CodeValue1]
	,[CourseDescription]
) 
SELECT [CourseCode]
	,[EdOrgId]
	,[CourseTitle]
	,[IntValue1]
	,[CodeValue1]
	,[CourseDescription]
FROM (
-- Alt 001 Block Begin
SELECT CourseCode,
	   @EdOrgId,
	   CourseTitle, 
	   1,
	   AcademicSubjectCode,
	   CourseDescription
FROM NovaDB.dbo.vw_Courses
WHERE SchoolYear = @SchoolYear
--Alt 001 Block End
)
AS CourseList (
	 [CourseCode]
	,[EdOrgId]
	,[CourseTitle]
	,[IntValue1]
	,[CodeValue1]
	,[CourseDescription]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_Course_Val))
BEGIN

	SELECT 
		 @CourseCode  			= [CourseCode]
		,@EdOrgId				= [EdOrgId]
		,@CourseTitle 			= [CourseTitle]
		,@IntValue1 			= [IntValue1]
		,@CodeValue1 			= [CodeValue1]
		,@CourseDesc  			= REPLACE([CourseDescription], '''','''''')
	FROM #Temp_Course_Val
	WHERE [AutoKey] = @Cnt;

	SET @DynSQL = 
		'INSERT INTO [edfi].[Course]( 
			 [CourseCode] 
			,[EducationOrganizationId]
			,[CourseTitle] 
			,[NumberOfParts] 
			,[AcademicSubjectDescriptorId] 
			,[CourseDescription] 
			,[CreateDate]
			,[LastModifiedDate]
		)VALUES( 
			  ''' + @CourseCode  + ''' 
			, ' + CAST(@EdOrgId AS NVARCHAR(10))   + '
			, ''' + @CourseTitle  + ''' 
			, ' + CAST(@IntValue1 AS NVARCHAR(10))   + '
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_2 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''') 
			, ''' + @CourseDesc  + ''' 
			, GETDATE(), GETDATE()	
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_Course_Val;

-- 002: Course (List) Load End

-- ===========================================================
/* 003: CourseOfferedGradeLevel Load Begin - SQL to generate this list should be placed in comments below
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025;
DECLARE @EdOrgId INT = 35000000;
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END +
'''' + CourseCode + ''', @EdOrgId, ''' + 
(SELECT CodeValue FROM NovaDB.dbo.CourseCodeList WHERE Id = GradeLevelId) + ''')' AS [DynamicSQL]
FROM NovaDB.dbo.CourseGradeLevel
WHERE SchoolYear = @SchoolYear

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_Course_Grade;

CREATE TABLE #Temp_Course_Grade(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[EdOrgId]				INT					NOT NULL
	,[CourseCode]			NVARCHAR(50)		NOT NULL
	,[CodeValue1]			NVARCHAR(50) 		NOT NULL
);

INSERT INTO #Temp_Course_Grade(
	 [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
) 
SELECT [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
FROM (
-- Alt 001 Block Begin
SELECT CourseCode,
	   @EdOrgId,
	   CodeValue
FROM NovaDB.dbo.CourseGradeLevel 
INNER JOIN NovaDB.dbo.CourseCodeList 
ON Id = GradeLevelId
WHERE SchoolYear = @SchoolYear
--Alt 001 Block End

)
AS CourseList (
	 [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_Course_Grade))

BEGIN

	SELECT 
		 @CourseCode  			= [CourseCode]
		,@EdOrgId	  			= [EdOrgId]
		,@CodeValue1 			= [CodeValue1]
	FROM #Temp_Course_Grade
	WHERE [AutoKey] = @Cnt;

	SET @DynSQL = 
		'INSERT INTO [edfi].[CourseOfferedGradeLevel]( 
			 [EducationOrganizationId] 
			,[CourseCode] 
			,[GradeLevelDescriptorId] 
			,[CreateDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @CourseCode  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] = ''' + @CodeType_1 + ''' AND [CodeValue] = ''' + @CodeValue1 + ''') 
			, GETDATE()
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_Course_Grade;

-- 003: CourseOfferedGradeLevel Load End

-- ===========================================================
/* 004: CourseLevelCharacteristic Load Begin - SQL to generate this list should be placed in comments below
-- NovaDB -- Deprecated but left here for reference. Can be removed after confirmation that the new Alt 001 update works
DECLARE @SchoolYear INT = 2025;
DECLARE @EdOrgId INT = 35000000;
SELECT CASE WHEN row_number() OVER(ORDER BY SchoolYear) = 1 THEN '(' ELSE ',(' END +
'''' + CourseCode + ''', @EdOrgId, ''' + 
(SELECT CodeValue FROM NovaDB.dbo.CourseCodeList WHERE Id = CharacteristicId) + ''')' AS [DynamicSQL]
FROM NovaDB.dbo.CourseCharacteristic
WHERE SchoolYear = @SchoolYear

*/
-- ===========================================================
DROP TABLE IF EXISTS #Temp_Course_Char;

CREATE TABLE #Temp_Course_Char(
	 [AutoKey]				INT IDENTITY(1,1)	NOT NULL
	,[EdOrgId]				INT					NOT NULL
	,[CourseCode]			NVARCHAR(50)		NOT NULL
	,[CodeValue1]			NVARCHAR(50) 		NOT NULL
);

INSERT INTO #Temp_Course_Char(
	 [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
) 
SELECT [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
FROM (
--Alt 001 Block Begin
SELECT CourseCode,
	   @EdOrgId,
	   CodeValue
FROM NovaDB.dbo.CourseCharacteristic
INNER JOIN NovaDB.dbo.CourseCodeList 
ON Id = CharacteristicId
WHERE SchoolYear = @SchoolYear
--Alt 001 Block End
)
AS CourseList (
	 [CourseCode]
	,[EdOrgId]
	,[CodeValue1]
)

WHILE(@Cnt <= (SELECT COUNT(*) FROM #Temp_Course_Char))

BEGIN

	SELECT 
		 @CourseCode  			= [CourseCode]
		,@EdOrgId	  			= [EdOrgId]
		,@CodeValue1 			= [CodeValue1]
	FROM #Temp_Course_Char
	WHERE [AutoKey] = @Cnt;

	SET @DynSQL = 
		'INSERT INTO [edfi].[CourseLevelCharacteristic]( 
			 [EducationOrganizationId]
			,[CourseCode] 
			,[CourseLevelCharacteristicDescriptorId] 
			,[CreateDate]
		)VALUES( 
			  ' + CAST(@EdOrgId AS NVARCHAR(10))  + ' 
			, ''' + @CourseCode  + ''' 
			, (' + @DynSQL_Sel + ' AND [Namespace] IN (''' + @CodeType_3A + ''',''' + @CodeType_3B + ''')  AND [CodeValue] = ''' + @CodeValue1 + ''') 
			, GETDATE()
		);'

	EXEC(@DynSQL);

	SET @Cnt += 1;

END

SET @Cnt = 1;

DROP TABLE IF EXISTS #Temp_Course_Char;

COMMIT TRANSACTION
-- 004: CourseLevelCharacteristic Load End
