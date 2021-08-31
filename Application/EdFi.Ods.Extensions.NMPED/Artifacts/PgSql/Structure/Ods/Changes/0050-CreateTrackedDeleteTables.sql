CREATE TABLE tracked_deletes_nmped.DirectCertificationStatusDescriptor
(
       DirectCertificationStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT DirectCertificationStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialEducationLevelOfIntegrationDescriptor
(
       SpecialEducationLevelOfIntegrationDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialEducationLevelOfIntegrationDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_nmped.SpecialProgramCodeDescriptor
(
       SpecialProgramCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SpecialProgramCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);
