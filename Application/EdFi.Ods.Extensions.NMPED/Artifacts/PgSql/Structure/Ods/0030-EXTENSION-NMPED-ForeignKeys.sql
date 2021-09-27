ALTER TABLE nmped.DirectCertificationStatusDescriptor ADD CONSTRAINT FK_e919b1_Descriptor FOREIGN KEY (DirectCertificationStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.DisciplineIncidentExtension ADD CONSTRAINT FK_cde8b8_DisciplineIncident FOREIGN KEY (IncidentIdentifier, SchoolId)
REFERENCES edfi.DisciplineIncident (IncidentIdentifier, SchoolId)
ON DELETE CASCADE
;

ALTER TABLE nmped.IndustryCredentialDescriptor ADD CONSTRAINT FK_e93cda_Descriptor FOREIGN KEY (IndustryCredentialDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.LevelOfEducationInstitutionDescriptor ADD CONSTRAINT FK_2d13b6_Descriptor FOREIGN KEY (LevelOfEducationInstitutionDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.ProgramDeliveryMethodDescriptor ADD CONSTRAINT FK_80f78a_Descriptor FOREIGN KEY (ProgramDeliveryMethodDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.SpecialEducationLevelOfIntegrationDescriptor ADD CONSTRAINT FK_74d1c3_Descriptor FOREIGN KEY (SpecialEducationLevelOfIntegrationDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.SpecialProgramCodeDescriptor ADD CONSTRAINT FK_410073_Descriptor FOREIGN KEY (SpecialProgramCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE nmped.StaffEducationOrganizationAssignmentAssociationExtension ADD CONSTRAINT FK_6ea356_StaffEducationOrganizationAssignmentAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationAssignmentAssociation (BeginDate, EducationOrganizationId, StaffClassificationDescriptorId, StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_LevelOfEducationInstitutionDescriptor FOREIGN KEY (HighestCompletedLevelOfEducationInstitutionDescriptorId)
REFERENCES nmped.LevelOfEducationInstitutionDescriptor (LevelOfEducationInstitutionDescriptorId)
;

CREATE INDEX FK_d7b81a_LevelOfEducationInstitutionDescriptor
ON nmped.StaffExtension (HighestCompletedLevelOfEducationInstitutionDescriptorId ASC);

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_LevelOfEducationInstitutionDescriptor1 FOREIGN KEY (BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId)
REFERENCES nmped.LevelOfEducationInstitutionDescriptor (LevelOfEducationInstitutionDescriptorId)
;

CREATE INDEX FK_d7b81a_LevelOfEducationInstitutionDescriptor1
ON nmped.StaffExtension (BaccalaureateInstitutionDescriptorIdLevelOfEducationInstitutionDescriptorId ASC);

ALTER TABLE nmped.StaffExtension ADD CONSTRAINT FK_d7b81a_Staff FOREIGN KEY (StaffUSI)
REFERENCES edfi.Staff (StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_IndustryCredentialDescriptor FOREIGN KEY (IndustryCredentialDescriptorId)
REFERENCES nmped.IndustryCredentialDescriptor (IndustryCredentialDescriptorId)
;

CREATE INDEX FK_1020a1_IndustryCredentialDescriptor
ON nmped.StudentCTEProgramAssociationExtension (IndustryCredentialDescriptorId ASC);

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_ProgramDeliveryMethodDescriptor FOREIGN KEY (ProgramDeliveryMethodDescriptorId)
REFERENCES nmped.ProgramDeliveryMethodDescriptor (ProgramDeliveryMethodDescriptorId)
;

CREATE INDEX FK_1020a1_ProgramDeliveryMethodDescriptor
ON nmped.StudentCTEProgramAssociationExtension (ProgramDeliveryMethodDescriptorId ASC);

ALTER TABLE nmped.StudentCTEProgramAssociationExtension ADD CONSTRAINT FK_1020a1_StudentCTEProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentCTEProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentEducationOrganizationAssociationExtension ADD CONSTRAINT FK_2c2930_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension ADD CONSTRAINT FK_0566bb_DirectCertificationStatusDescriptor FOREIGN KEY (DirectCertificationStatusDescriptorId)
REFERENCES nmped.DirectCertificationStatusDescriptor (DirectCertificationStatusDescriptorId)
;

CREATE INDEX FK_0566bb_DirectCertificationStatusDescriptor
ON nmped.StudentSchoolFoodServiceProgramAssociationExtension (DirectCertificationStatusDescriptorId ASC);

ALTER TABLE nmped.StudentSchoolFoodServiceProgramAssociationExtension ADD CONSTRAINT FK_0566bb_StudentSchoolFoodServiceProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSchoolFoodServiceProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE nmped.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_SpecialProgramCodeDescriptor FOREIGN KEY (SpecialProgramCodeDescriptorId)
REFERENCES nmped.SpecialProgramCodeDescriptor (SpecialProgramCodeDescriptorId)
;

CREATE INDEX FK_a77484_SpecialProgramCodeDescriptor
ON nmped.StudentSectionAssociationExtension (SpecialProgramCodeDescriptorId ASC);

ALTER TABLE nmped.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_StudentSectionAssociation FOREIGN KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentSectionAssociation (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_SpecialEducationLevelOfIntegrationDescriptor FOREIGN KEY (SpecialEducationLevelOfIntegrationDescriptorId)
REFERENCES nmped.SpecialEducationLevelOfIntegrationDescriptor (SpecialEducationLevelOfIntegrationDescriptorId)
;

CREATE INDEX FK_3da84f_SpecialEducationLevelOfIntegrationDescriptor
ON nmped.StudentSpecialEducationProgramAssociationExtension (SpecialEducationLevelOfIntegrationDescriptorId ASC);

ALTER TABLE nmped.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

