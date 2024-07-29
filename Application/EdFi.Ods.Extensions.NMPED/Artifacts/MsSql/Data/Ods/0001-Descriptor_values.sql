/* NMPED
 * 300 Don Gaspar Ave.
 * Santa Fe, NM 87501
 * Information Technical Department
 * https://webnew.ped.state.nm.us/
 * By: Cody | App Dev III
 * Date: 09/14/2023
 * Notes: This script seeds the [edfi].[Descriptor] table
 *		with NMPED descriptors.
 * 
 * Alt Id: 001
 * Alt By: Tong | DBA II
 * Alt Date: 06/13/2024
 * Alt Title: Clean up / Re-Organization / Re-Write
 * Alt Desc: cleaning up, reorganizing and rewritting
 *		script so that its easier to read and modify.
 *		Comment header was added, original script did
 *		not have one.  Please refer to original script
 *		for comparisons.
 *
 * Alt Id: 002
 * Alt By: Tong | DBA II
 * Alt Date: 06/13/2024
 * Alt Title: Grade Level and Sex Descriptor
 * Alt Desc: Grade level and Sex Descriptor control tables
 *		were not populated. Grade leve flag to insert into 
 *		control table was set to false and sex descriptor
 *		was referencing an ed-fi namespace instead of nmped.
 *
 * *** 0001-Descriptor_values v1.0.0 ***
 * *** 0001-Descriptor_values v2.0.0 ***
 * *** 0001-Descriptor_values v2.0.1 ***
 */

/* Prep
 * -------*/
SET XACT_ABORT ON  

BEGIN TRANSACTION

BEGIN

	DECLARE
		 @DynSQL		NVARCHAR(MAX)
		,@Cnt			INT			  = 1
		,@Schema		NVARCHAR(5)
		,@Table			NVARCHAR(255)
		,@Column		NVARCHAR(255)
		,@Namespace		NVARCHAR(255)
		,@SchoolYear	SMALLINT	   = 2025 --Set the school year descriptors to import here

	DROP TABLE IF EXISTS #List_Descriptor_Tbl

	CREATE TABLE #List_Descriptor_Tbl(
		 [AutoKey]			INT IDENTITY(1,1)	NOT NULL
		,[D_Main_Tbl]		BIT					NOT NULL	--Flag to delete [edfi].[Descriptor] according to namspace
		,[D_Ctrl_Tbl]		BIT					NOT NULL	--Flag to delete control table
		,[I_Ctrl_Tbl]		BIT					NOT NULL	--Flag to insert into control table
		,[Schema]			NVARCHAR(5)			NOT NULL
		,[Table]			NVARCHAR(255)		NOT NULL
		,[Column]			NVARCHAR(255)		NOT NULL
		,[Namespace]		NVARCHAR(255)		NOT NULL
	);

END

INSERT INTO #List_Descriptor_Tbl(
	 [D_Main_Tbl]	--Flag to delete [edfi].[Descriptor] according to namspace
	,[D_Ctrl_Tbl]	--Flag to delete control table
	,[I_Ctrl_Tbl]	--Flag to insert into control table
	,[Schema]
	,[Table]
	,[Column]
	,[Namespace]
)VALUES
	 (1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/AcademicSubjectDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/AdministrativeFundingControlDescriptor')
	,(1 ,0 ,0	,''		,''												,''	,'uri://ed-fi.org/AttendanceEventCategoryDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/BehaviorDescriptor')
	,(0	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/CourseLevelCharacteristicDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/DiplomaTypeDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/DisabilityDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/DisciplineDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/EducationalEnvironmentDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/EmploymentStatusDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/EntryTypeDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/ExitWithdrawTypeDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/GradeLevelDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/IndustryCredentialDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/InternetAccessTypeInResidenceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/InternetPerformanceInResidenceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/LanguageDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/LevelOfEducationDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/LocalEducationAgencyCategoryDescriptor')
	,(1 ,0 ,0	,''		,''												,''	,'uri://ed-fi.org/MediumOfInstructionDescriptor')
	,(1	,1 ,0	,'edfi'	,'PrimaryLearningDeviceAccessDescriptor'		,''	,'uri://ed-fi.org/PrimaryLearningDeviceAccessDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/PrimaryLearningDeviceAwayFromSchoolDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/ProgramTypeDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/RaceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/SchoolCategoryDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/SchoolFoodServiceProgramServiceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/SeparationReasonDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/ServiceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/SpecialEducationProgramServiceDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/SpecialEducationSettingDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/StaffClassificationDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/StudentCharacteristicDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/TribalAffiliationDescriptor')
	,(1	,0 ,0	,''		,''												,''	,'uri://ed-fi.org/VisaDescriptor')
	
	
	,(1	,1 ,1	,'edfi'	,'AcademicSubjectDescriptor'					,'AcademicSubjectDescriptorID'						,'uri://nmped.org/AcademicSubjectDescriptor')
	,(1	,1 ,1	,'edfi'	,'AdministrativeFundingControlDescriptor'		,'AdministrativeFundingControlDescriptorId'			,'uri://nmped.org/AdministrativeFundingControlDescriptor')
	,(1 ,1 ,1	,'nmped','AnnualReviewDelayReasonDescriptor'			,'AnnualReviewDelayReasonDescriptorId'				,'uri://nmped.org/AnnualReviewDelayReasonDescriptor')
	,(1	,1 ,1	,'edfi'	,'AttendanceEventCategoryDescriptor'			,'AttendanceEventCategoryDescriptorid'				,'uri://nmped.org/AttendanceEventCategoryDescriptor')
	,(1	,1 ,1	,'edfi'	,'BehaviorDescriptor'							,'BehaviorDescriptorId'								,'uri://nmped.org/BehaviorDescriptor')
	,(0	,0 ,1	,'edfi'	,'CalendarEventDescriptor'						,'CalendarEventDescriptorId'						,'uri://nmped.org/CalendarEventDescriptor')
	,(0	,1 ,1	,'edfi'	,'CharterStatusDescriptor'						,'CharterStatusDescriptorId'						,'uri://nmped.org/CharterStatusDescriptor')
	,(0	,0 ,1	,'edfi'	,'CourseLevelCharacteristicDescriptor'			,'CourseLevelCharacteristicDescriptorId'			,'uri://nmped.org/CourseLevelCharacteristicDescriptor')
	,(1 ,1, 1	,'nmped','DentalExaminationVerificationCodeDescriptor'	,'DentalExaminationVerificationCodeDescriptorId'	,'uri://nmped.org/DentalExaminationVerificationCodeDescriptor')
	,(1	,1 ,1	,'edfi'	,'DiplomaTypeDescriptor'						,'DiplomaTypeDescriptorId'							,'uri://nmped.org/DiplomaTypeDescriptor')
	,(0	,0 ,1	,'nmped','DirectCertificationStatusDescriptor'			,'DirectCertificationStatusDescriptorId'			,'uri://nmped.org/DirectCertificationStatusDescriptor')
	,(1	,1 ,1	,'edfi'	,'DisabilityDescriptor'							,'DisabilityDescriptorId'							,'uri://nmped.org/DisabilityDescriptor')
	,(1	,1 ,1	,'edfi'	,'DisciplineDescriptor'							,'DisciplineDescriptorId'							,'uri://nmped.org/DisciplineDescriptor')
	,(0	,1 ,1	,'edfi'	,'EducationOrganizationCategoryDescriptor'		,'EducationOrganizationCategoryDescriptorId'		,'uri://nmped.org/EducationOrganizationCategoryDescriptor')
	,(1	,1 ,1	,'edfi'	,'EducationalEnvironmentDescriptor'				,'EducationalEnvironmentDescriptorId'				,'uri://nmped.org/EducationalEnvironmentDescriptor') 
	,(0 ,1 ,1	,'edfi'	,'EmploymentStatusDescriptor'					,'EmploymentStatusDescriptorid'						,'uri://nmped.org/EmploymentStatusDescriptor')
	,(1	,1 ,1	,'edfi'	,'EntryTypeDescriptor'							,'EntryTypeDescriptorId'							,'uri://nmped.org/EntryTypeDescriptor')
	,(1	,1 ,1	,'edfi'	,'ExitWithdrawTypeDescriptor'					,'ExitWithdrawTypeDescriptorId'						,'uri://nmped.org/ExitWithdrawTypeDescriptor')
	,(1	,1 ,1	,'nmped','ExpectedDiplomaTypeDescriptor'				,'ExpectedDiplomaTypeDescriptorId'					,'uri://nmped.org/ExpectedDiplomaTypeDescriptor')
	,(1	,1 ,1	,'nmped','GenderIdentityDescriptor'						,'GenderIdentityDescriptorId'						,'uri://nmped.org/GenderIdentityDescriptor')
	--,(1	,1 ,0	,'edfi'	,'GradeLevelDescriptor'							,'GradeLevelDescriptorId'							,'uri://nmped.org/GradeLevelDescriptor')	--Alt Id: 002
	,(1	,1 ,1	,'edfi'	,'GradeLevelDescriptor'							,'GradeLevelDescriptorId'							,'uri://nmped.org/GradeLevelDescriptor')		--Alt Id: 002
	,(1	,1 ,1	,'nmped','IndustryCredentialDescriptor'					,'IndustryCredentialDescriptorId'					,'uri://nmped.org/IndustryCredentialDescriptor')
	,(1	,1 ,1	,'edfi'	,'InternetAccessTypeInResidenceDescriptor'		,'InternetAccessTypeInResidenceDescriptorId'		,'uri://nmped.org/InternetAccessTypeInResidenceDescriptor')
	,(1	,1 ,1	,'edfi'	,'InternetPerformanceInResidenceDescriptor'		,'InternetPerformanceInResidenceDescriptorId'		,'uri://nmped.org/InternetPerformanceInResidenceDescriptor')
	,(1	,1 ,1	,'edfi'	,'LanguageDescriptor'							,'LanguageDescriptorId'								,'uri://nmped.org/LanguageDescriptor')
	,(1	,1 ,1	,'edfi'	,'LevelOfEducationDescriptor'					,'LevelOfEducationDescriptorid'						,'uri://nmped.org/LevelOfEducationDescriptor')
	,(0	,0 ,1	,'nmped','LevelOfEducationInstitutionDescriptor'		,'LevelOfEducationInstitutionDescriptorId'			,'uri://nmped.org/LevelOfEducationInstitutionDescriptor')
	,(0	,0 ,1	,'nmped','LevelOfIntegrationDescriptor'					,'LevelOfIntegrationDescriptorId'					,'uri://nmped.org/LevelOfIntegrationDescriptor')
	,(1	,1 ,1	,'edfi'	,'LimitedEnglishProficiencyDescriptor'			,'LimitedEnglishProficiencyDescriptorId'			,'uri://nmped.org/LimitedEnglishProficiencyDescriptor')
	,(1	,1 ,1	,'edfi'	,'LocalEducationAgencyCategoryDescriptor'		,'LocalEducationAgencyCategoryDescriptorId'			,'uri://nmped.org/LocalEducationAgencyCategoryDescriptor')
	,(0	,0 ,0	,''		,''												,''													,'uri://nmped.org/LunchProgramTypeDescriptor')
	,(1	,1 ,1	,'edfi'	,'MediumOfInstructionDescriptor'				,'MediumOfInstructionDescriptorid'					,'uri://nmped.org/MediumOfInstructionDescriptor')
	,(1 ,1 ,1	,'nmped','MileageTypeDescriptor'						,'MileageTypeDescriptorId'							,'uri://nmped.org/MileageTypeDescriptor')
	,(1 ,1 ,1	,'nmped','MilitaryFamilyDescriptor'						,'MilitaryFamilyDescriptorId'						,'uri://nmped.org/MilitaryFamilyDescriptor')
	,(0	,0 ,1	,'nmped','NMPEDClassPeriodDescriptor'					,'NMPEDClassPeriodDescriptorId'						,'uri://nmped.org/NMPEDClassPeriodDescriptor')
	,(1	,0 ,0	,''		,''												,''													,'uri://nmped.org/NonComplianceReasonDescriptor')
	,(0	,0 ,1	,'edfi'	,'OperationalStatusDescriptor'					,'OperationalStatusDescriptorId'					,'uri://nmped.org/OperationalStatusDescriptor')
	,(0	,0 ,1	,'nmped','ParticipationInformationDescriptor'			,'ParticipationInformationDescriptorId'				,'uri://nmped.org/ParticipationInformationDescriptor')
	,(1 ,1 ,1	,'nmped','PlannedPostGraduateActivityDescriptor'		,'PlannedPostGraduateActivityDescriptorId'			,'uri://nmped.org/PlannedPostGraduateActivityDescriptor')
	,(1 ,1 ,1	,'nmped','PreKClassTypeDescriptor'						,'PreKClassTypeDescriptorId'						,'uri://nmped.org/PreKClassTypeDescriptor')
	,(1 ,1 ,1	,'nmped','PrimaryAreaOfExceptionalityDescriptor'		,'PrimaryAreaOfExceptionalityDescriptorId'			,'uri://nmped.org/PrimaryAreaOfExceptionalityDescriptor')
	,(1	,1 ,1	,'edfi'	,'PrimaryLearningDeviceAwayFromSchoolDescriptor','PrimaryLearningDeviceAwayFromSchoolDescriptorid'	,'uri://nmped.org/PrimaryLearningDeviceAwayFromSchoolDescriptor')
	,(1 ,1 ,1	,'edfi', 'PrimaryLearningDeviceAccessDescriptor'		,'PrimaryLearningDeviceAccessDescriptorid'			,'uri://nmped.org/PrimaryLearningDeviceAccessDescriptor')
	,(0	,0 ,1	,'nmped','ProgramDeliveryMethodDescriptor'				,'ProgramDeliveryMethodDescriptorId'				,'uri://nmped.org/ProgramDeliveryMethodDescriptor')
	,(0	,0 ,1	,'nmped','ProgramIntensityDescriptor'					,'ProgramIntensityDescriptorId'						,'uri://nmped.org/ProgramIntensityDescriptor')
	,(1	,1 ,1	,'edfi'	,'ProgramTypeDescriptor'						,'ProgramTypeDescriptorID'							,'uri://nmped.org/ProgramTypeDescriptor')
	,(1	,1 ,1	,'edfi'	,'RaceDescriptor'								,'RaceDescriptorid'									,'uri://nmped.org/RaceDescriptor')
	,(1 ,1 ,1	,'nmped','RoadTypeDescriptor'							,'RoadTypeDescriptorId'								,'uri://nmped.org/RoadTypeDescriptor')
	,(1	,1 ,1	,'edfi'	,'SchoolCategoryDescriptor'						,'SchoolCategoryDescriptorID'						,'uri://nmped.org/SchoolCategoryDescriptor')
	,(1	,1 ,1	,'edfi'	,'SchoolFoodServiceProgramServiceDescriptor'	,'SchoolFoodServiceProgramServiceDescriptorId'		,'uri://nmped.org/SchoolFoodServiceProgramServiceDescriptor')
	,(0	,1 ,1	,'edfi'	,'SchoolTypeDescriptor'							,'SchoolTypeDescriptorId'							,'uri://nmped.org/SchoolTypeDescriptor')
	,(1	,1 ,1	,'edfi'	,'SeparationReasonDescriptor'					,'SeparationReasonDescriptorId'						,'uri://nmped.org/SeparationReasonDescriptor')
	,(1	,1 ,1	,'edfi'	,'ServiceDescriptor'							,'ServiceDescriptorId'								,'uri://nmped.org/ServiceDescriptor')
	--,(1 ,1, 1	,'edfi'	,'SexDescriptor'								,'SexDescriptorid'									,'uri://ed-fi.org/SexDescriptor')	--Alt Id: 002
	,(1 ,1, 1	,'edfi'	,'SexDescriptor'								,'SexDescriptorid'									,'uri://nmped.org/SexDescriptor')	--Alt Id: 002
	--Service Provider Type Descriptor Removed 22-23
	--,(0 ,0 ,1	,'nmped'	,'ServiceProviderTypeDescriptor'	,'ServiceProviderTypeDescriptorId'				,'uri://nmped.org/ServiceProviderTypeDescriptor')

	--Service Setting Descriptor Removed 22-23
	--,(0 ,0 ,1	,'nmped'	,'ServiceSettingDescriptor'			,'ServiceSettingDescriptorId'					,'uri://nmped.org/ServiceSettingDescriptor')

	,(1	,1 ,1	,'nmped','SpecialEducationEventReasonDescriptor'		,'SpecialEducationEventReasonDescriptorId'			,'uri://nmped.org/SpecialEducationEventReasonDescriptor')
	,(1	,1 ,1	,'nmped','SpecialEducationEventTypeDescriptor'			,'SpecialEducationEventTypeDescriptorid'			,'uri://nmped.org/SpecialEducationEventTypeDescriptor')
	,(1	,1 ,1	,'nmped','SpecialEducationNonComplianceReasonDescriptor','SpecialEducationNonComplianceReasonDescriptorId'	,'uri://nmped.org/SpecialEducationNonComplianceReasonDescriptor')
	,(1	,1 ,1	,'edfi'	,'SpecialEducationProgramServiceDescriptor'		,'SpecialEducationProgramServiceDescriptorId'		,'uri://nmped.org/SpecialEducationProgramServiceDescriptor')
	,(1	,1 ,1	,'nmped','SpecialEducationReferralCodeDescriptor'		,'SpecialEducationReferralCodeDescriptorId'			,'uri://nmped.org/SpecialEducationReferralCodeDescriptor')
	,(1	,1 ,1	,'edfi'	,'SpecialEducationSettingDescriptor'			,'SpecialEducationSettingDescriptorId'				,'uri://nmped.org/SpecialEducationSettingDescriptor')
	,(0	,0 ,1	,'nmped','SpecialProgramCodeDescriptor'					,'SpecialProgramCodeDescriptorId'					,'uri://nmped.org/SpecialProgramCodeDescriptor')
	,(1	,1 ,1	,'edfi'	,'StaffClassificationDescriptor'				,'StaffClassificationDescriptorId'					,'uri://nmped.org/StaffClassificationDescriptor')
	,(1 ,1 ,1	,'nmped','StaffDevelopmentActivityCodeDescriptor'		,'StaffDevelopmentActivityCodeDescriptorId'			,'uri://nmped.org/StaffDevelopmentActivityCodeDescriptor')
	,(1 ,1 ,1	,'nmped','StaffDevelopmentPurposeCodeDescriptor'		,'StaffDevelopmentPurposeCodeDescriptorId'			,'uri://nmped.org/StaffDevelopmentPurposeCodeDescriptor')
	,(0	,0 ,1	,'edfi'	,'StaffIdentificationSystemDescriptor'			,'StaffIdentificationSystemDescriptorId'			,'uri://nmped.org/StaffIdentificationSystemDescriptor')
	,(0	,1 ,1	,'edfi'	,'StudentCharacteristicDescriptor'				,'StudentCharacteristicDescriptorId'				,'uri://nmped.org/StudentCharacteristicDescriptor')
	,(1 ,1 ,1	,'nmped','StudentAwardTypeDescriptor'					,'StudentAwardTypeDescriptorId'						,'uri://nmped.org/StudentAwardTypeDescriptor')
	,(1 ,1 ,1	,'nmped','TransportationSetCodeDescriptor'				,'TransportationSetCodeDescriptorId'				,'uri://nmped.org/TransportationSetCodeDescriptor')
	,(1 ,1 ,1	,'nmped','TransportationCategoryDescriptor'				,'TransportationCategoryDescriptorId'				,'uri://nmped.org/TransportationCategoryDescriptor')
	,(1 ,1 ,1   ,'nmped','TriennialReviewDelayReasonDescriptor'			,'TriennialReviewDelayReasonDescriptorId'			,'uri://nmped.org/TriennialReviewDelayReasonDescriptor')
	,(1	,0 ,1	,'edfi'	,'TribalAffiliationDescriptor'					,'TribalAffiliationDescriptorId'					,'uri://nmped.org/TribalAffiliationDescriptor')
	,(1	,1 ,1	,'nmped','VehicleBodyManufacturerDescriptor'			,'VehicleBodyManufacturerDescriptorId'				,'uri://nmped.org/VehicleBodyManufacturerDescriptor')
	,(1 ,1 ,1	,'nmped','VehicleChassisManufacturerDescriptor'			,'VehicleChassisManufacturerDescriptorId'			,'uri://nmped.org/VehicleChassisManufacturerDescriptor')
	,(1	,1 ,1	,'nmped','VehicleFuelTypeDescriptor'					,'VehicleFuelTypeDescriptorId'						,'uri://nmped.org/VehicleFuelType')
	,(1 ,1 ,1	,'nmped','VehicleRouteDescriptor'						,'VehicleRouteDescriptorId'							,'uri://nmped.org/VehicleRouteDescriptor')
	,(1 ,1 ,1	,'nmped','VehicleTypeDescriptor'						,'VehicleTypeDescriptorId'							,'uri://nmped.org/VehicleTypeDescriptor')
	,(0	,0 ,0	,''		,''												,''													,'uri://nmped.org/VirtualLocationStatusDescriptor')
	,(1 ,1, 1	,'edfi'	,'VisaDescriptor'								,'VisaDescriptorid'									,'uri://nmped.org/VisaDescriptor')

/* Purge any existing descriptors that is not state defined in [edfi].[Descriptor].
 * ----------*/
DELETE [edfi].[Descriptor]
WHERE 1 = 1
	AND [namespace] IN(
		SELECT [Namespace]
		FROM #List_Descriptor_Tbl
		WHERE 1 = 1
			AND [D_Main_Tbl] = 1
			AND [Namespace] != 'uri://ed-fi.org/CourseLevelCharacteristicDescriptor'
)

DELETE [edfi].[Descriptor]
WHERE 1 = 1
	AND [Namespace]  = 'uri://ed-fi.org/CourseLevelCharacteristicDescriptor'
	AND [CodeValue] IN('Basic', 'General')


/* Purge any existing descriptors that is not state defined in control tables.
 * ----------*/

SELECT 
	 ROW_NUMBER() OVER(ORDER BY [Table] ASC) AS [Row_Num]
	,[Schema]
	,[Table]
	,[Column]
	,[Namespace]
INTO #List_D_Ctrl
FROM #List_Descriptor_Tbl
WHERE 1 = 1
	AND [D_Ctrl_Tbl] = 1

WHILE(@Cnt <= (SELECT COUNT(*) FROM #List_D_Ctrl))
BEGIN
	
	SELECT
		 @Schema	= [Schema]
		,@Table		= [Table]
	FROM #List_D_Ctrl
	WHERE 1 =1 
		AND [Row_Num] = @Cnt;

	SELECT @DynSQL = 
		'DELETE [' + @Schema + '].[' + @Table + '] '

	EXEC(@DynSQL)

	SET @Cnt += 1;

END

/* Insert state defined descriptors
 * ----------*/
INSERT INTO [edfi].[Descriptor](
	 [Namespace]
	,[CodeValue]
	,[ShortDescription]
	,[Description]
)SELECT
	 [Namespace]
	,[CodeValue]
	,[ShortDescription]
	,[Description]
FROM [NovaDB].[dbo].[Seed_Descriptors]
WHERE 1 = 1
	AND [Active] = 1
	AND [SchoolYear] = @SchoolYear

/* Insert state defined descriptor Id's to control tables
 * ----------*/

SELECT 
	 ROW_NUMBER() OVER(ORDER BY [Table] ASC) AS [Row_Num]
	,[Schema]
	,[Table]
	,[Column]
	,[Namespace]
INTO #List_I_Ctrl
FROM #List_Descriptor_Tbl
WHERE 1 = 1
	AND [I_Ctrl_Tbl] = 1
		
SET @Cnt = 1
WHILE(@Cnt <= (SELECT COUNT(*) FROM #List_I_Ctrl))
BEGIN
	
	SELECT
		 @Schema	= [Schema]
		,@Table		= [Table]
		,@Column	= [Column]
		,@Namespace = [Namespace]
	FROM #List_I_Ctrl
	WHERE 1 =1 
		AND [Row_Num] = @Cnt;

	SELECT @DynSQL = 
		'INSERT INTO [' + @Schema + '].[' + @Table + ']([' + @Column + '])
		 SELECT [DescriptorId] 
		 FROM [edfi].[Descriptor] 
		 WHERE [Namespace] = ''' + @Namespace + ''''

	BEGIN TRANSACTION
	BEGIN TRY

		EXEC(@DynSQL);

	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0)
			ROLLBACK TRANSACTION

		SELECT
			 'INSERT INTO FAILED'
			,@Schema			AS [Schema]
			,@Table				AS [Table]
			,@Column			AS [Column]
			,ERROR_MESSAGE()
			,ERROR_LINE()
			,ERROR_STATE()
			,ERROR_SEVERITY()

	END CATCH
		IF(@@TRANCOUNT > 0)
			COMMIT TRANSACTION

	SET @Cnt += 1;

END

COMMIT TRANSACTION

DROP TABLE #List_Descriptor_Tbl
DROP TABLE #List_D_Ctrl
DROP TABLE #List_I_Ctrl