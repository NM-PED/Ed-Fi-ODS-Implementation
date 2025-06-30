DO $$
BEGIN

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'tracked_changes_nmped') THEN
CREATE SCHEMA tracked_changes_nmped;
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'localeducationagencytransportation') THEN
CREATE TABLE tracked_changes_nmped.localeducationagencytransportation
(
       oldcategorydescriptor01transportationcategorydescriptorid INT NOT NULL,
       oldcategorydescriptor01transportationcategorydescriptornamespace VARCHAR(255) NOT NULL,
       oldcategorydescriptor01transportationcategorydescriptorcodevalue VARCHAR(50) NOT NULL,
       oldcategorydescriptor02transportationcategorydescriptorid INT NOT NULL,
       oldcategorydescriptor02transportationcategorydescriptornamespace VARCHAR(255) NOT NULL,
       oldcategorydescriptor02transportationcategorydescriptorcodevalue VARCHAR(50) NOT NULL,
       oldlocaleducationagencyid INT NOT NULL,
       oldtransportationsetcodedescriptorid INT NOT NULL,
       oldtransportationsetcodedescriptornamespace VARCHAR(255) NOT NULL,
       oldtransportationsetcodedescriptorcodevalue VARCHAR(50) NOT NULL,
       newcategorydescriptor01transportationcategorydescriptorid INT NULL,
       newcategorydescriptor01transportationcategorydescriptornamespace VARCHAR(255) NULL,
       newcategorydescriptor01transportationcategorydescriptorcodevalue VARCHAR(50) NULL,
       newcategorydescriptor02transportationcategorydescriptorid INT NULL,
       newcategorydescriptor02transportationcategorydescriptornamespace VARCHAR(255) NULL,
       newcategorydescriptor02transportationcategorydescriptorcodevalue VARCHAR(50) NULL,
       newlocaleducationagencyid INT NULL,
       newtransportationsetcodedescriptorid INT NULL,
       newtransportationsetcodedescriptornamespace VARCHAR(255) NULL,
       newtransportationsetcodedescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT localeducationagencytransportation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'staffdevelopment') THEN
CREATE TABLE tracked_changes_nmped.staffdevelopment
(
       oldeducationorganizationid INT NOT NULL,
       oldstaffusi INT NOT NULL,
       oldstaffuniqueid VARCHAR(32) NOT NULL,
       oldstartdate DATE NOT NULL,
       neweducationorganizationid INT NULL,
       newstaffusi INT NULL,
       newstaffuniqueid VARCHAR(32) NULL,
       newstartdate DATE NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT staffdevelopment_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'staffeducationorganizationvacancy') THEN
CREATE TABLE tracked_changes_nmped.staffeducationorganizationvacancy
(
       olddatacollectionperioddescriptorid INT NOT NULL,
       olddatacollectionperioddescriptornamespace VARCHAR(255) NOT NULL,
       olddatacollectionperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldlocaleducationagencyid INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldvacancygroupdescriptorid INT NOT NULL,
       oldvacancygroupdescriptornamespace VARCHAR(255) NOT NULL,
       oldvacancygroupdescriptorcodevalue VARCHAR(50) NOT NULL,
       newdatacollectionperioddescriptorid INT NULL,
       newdatacollectionperioddescriptornamespace VARCHAR(255) NULL,
       newdatacollectionperioddescriptorcodevalue VARCHAR(50) NULL,
       newlocaleducationagencyid INT NULL,
       newschoolyear SMALLINT NULL,
       newvacancygroupdescriptorid INT NULL,
       newvacancygroupdescriptornamespace VARCHAR(255) NULL,
       newvacancygroupdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT staffeducationorganizationvacancy_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'studentcteprogramassociationcredential') THEN
CREATE TABLE tracked_changes_nmped.studentcteprogramassociationcredential
(
       oldbegindate DATE NOT NULL,
       oldcredentialearneddate DATE NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldindustrycredentialdescriptorid INT NOT NULL,
       oldindustrycredentialdescriptornamespace VARCHAR(255) NOT NULL,
       oldindustrycredentialdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldprogramdeliverymethoddescriptorid INT NOT NULL,
       oldprogramdeliverymethoddescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramdeliverymethoddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldprogrameducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(60) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       newcredentialearneddate DATE NULL,
       neweducationorganizationid INT NULL,
       newindustrycredentialdescriptorid INT NULL,
       newindustrycredentialdescriptornamespace VARCHAR(255) NULL,
       newindustrycredentialdescriptorcodevalue VARCHAR(50) NULL,
       newprogramdeliverymethoddescriptorid INT NULL,
       newprogramdeliverymethoddescriptornamespace VARCHAR(255) NULL,
       newprogramdeliverymethoddescriptorcodevalue VARCHAR(50) NULL,
       newprogrameducationorganizationid INT NULL,
       newprogramname VARCHAR(60) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studentcteprogramassociationcredential_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'studenteducationorganizationaward') THEN
CREATE TABLE tracked_changes_nmped.studenteducationorganizationaward
(
       oldawarddate DATE NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldstudentawardlanguagedescriptorid INT NOT NULL,
       oldstudentawardlanguagedescriptornamespace VARCHAR(255) NOT NULL,
       oldstudentawardlanguagedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentawardtypedescriptorid INT NOT NULL,
       oldstudentawardtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldstudentawardtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newawarddate DATE NULL,
       neweducationorganizationid INT NULL,
       newschoolyear SMALLINT NULL,
       newstudentawardlanguagedescriptorid INT NULL,
       newstudentawardlanguagedescriptornamespace VARCHAR(255) NULL,
       newstudentawardlanguagedescriptorcodevalue VARCHAR(50) NULL,
       newstudentawardtypedescriptorid INT NULL,
       newstudentawardtypedescriptornamespace VARCHAR(255) NULL,
       newstudentawardtypedescriptorcodevalue VARCHAR(50) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studenteducationorganizationaward_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'studentspecialeducationassociationevent') THEN
CREATE TABLE tracked_changes_nmped.studentspecialeducationassociationevent
(
       oldbegindate DATE NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldeventdate DATE NOT NULL,
       oldprogrameducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(60) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldspecialeducationeventtypedescriptorid INT NOT NULL,
       oldspecialeducationeventtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldspecialeducationeventtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       neweducationorganizationid INT NULL,
       neweventdate DATE NULL,
       newprogrameducationorganizationid INT NULL,
       newprogramname VARCHAR(60) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       newspecialeducationeventtypedescriptorid INT NULL,
       newspecialeducationeventtypedescriptornamespace VARCHAR(255) NULL,
       newspecialeducationeventtypedescriptorcodevalue VARCHAR(50) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studentspecialeducationassociationevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'studentspecialeducationprogramassociationiepdates') THEN
CREATE TABLE tracked_changes_nmped.studentspecialeducationprogramassociationiepdates
(
       oldbegindate DATE NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldiepbegindate DATE NOT NULL,
       oldprogrameducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(60) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       neweducationorganizationid INT NULL,
       newiepbegindate DATE NULL,
       newprogrameducationorganizationid INT NULL,
       newprogramname VARCHAR(60) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT studentspecialeducationprogramassociationiepdates_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'vehiclemileage') THEN
CREATE TABLE tracked_changes_nmped.vehiclemileage
(
       oldlocaleducationagencyid INT NOT NULL,
       oldmileagetypedescriptorid INT NOT NULL,
       oldmileagetypedescriptornamespace VARCHAR(255) NOT NULL,
       oldmileagetypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldreportingdate DATE NOT NULL,
       oldroadtypedescriptorid INT NOT NULL,
       oldroadtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldroadtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldvehicleid VARCHAR(255) NOT NULL,
       oldvehicleroutedescriptorid INT NOT NULL,
       oldvehicleroutedescriptornamespace VARCHAR(255) NOT NULL,
       oldvehicleroutedescriptorcodevalue VARCHAR(50) NOT NULL,
       newlocaleducationagencyid INT NULL,
       newmileagetypedescriptorid INT NULL,
       newmileagetypedescriptornamespace VARCHAR(255) NULL,
       newmileagetypedescriptorcodevalue VARCHAR(50) NULL,
       newreportingdate DATE NULL,
       newroadtypedescriptorid INT NULL,
       newroadtypedescriptornamespace VARCHAR(255) NULL,
       newroadtypedescriptorcodevalue VARCHAR(50) NULL,
       newvehicleid VARCHAR(255) NULL,
       newvehicleroutedescriptorid INT NULL,
       newvehicleroutedescriptornamespace VARCHAR(255) NULL,
       newvehicleroutedescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT vehiclemileage_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmped' AND table_name = 'vehiclesnapshot') THEN
CREATE TABLE tracked_changes_nmped.vehiclesnapshot
(
       oldlocaleducationagencyid INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldvehicleid VARCHAR(255) NOT NULL,
       oldvehicleidentificationnumber VARCHAR(21) NOT NULL,
       newlocaleducationagencyid INT NULL,
       newschoolyear SMALLINT NULL,
       newvehicleid VARCHAR(255) NULL,
       newvehicleidentificationnumber VARCHAR(21) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT vehiclesnapshot_pk PRIMARY KEY (ChangeVersion)
);
END IF;

END
$$;
