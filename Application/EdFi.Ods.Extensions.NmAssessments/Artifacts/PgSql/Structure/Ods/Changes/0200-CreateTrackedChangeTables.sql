DO $$
BEGIN

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'tracked_changes_nmassessments') THEN
CREATE SCHEMA tracked_changes_nmassessments;
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_nmassessments' AND table_name = 'nmstudentassessment') THEN
CREATE TABLE tracked_changes_nmassessments.nmstudentassessment
(
       oldeducationorganizationid INT NOT NULL,
       olditemdescriptioncodedescriptorid INT NOT NULL,
       olditemdescriptioncodedescriptornamespace VARCHAR(255) NOT NULL,
       olditemdescriptioncodedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       oldtestdate DATE NOT NULL,
       oldtestdescriptiondescriptorid INT NOT NULL,
       oldtestdescriptiondescriptornamespace VARCHAR(255) NOT NULL,
       oldtestdescriptiondescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newitemdescriptioncodedescriptorid INT NULL,
       newitemdescriptioncodedescriptornamespace VARCHAR(255) NULL,
       newitemdescriptioncodedescriptorcodevalue VARCHAR(50) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       newtestdate DATE NULL,
       newtestdescriptiondescriptorid INT NULL,
       newtestdescriptiondescriptornamespace VARCHAR(255) NULL,
       newtestdescriptiondescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT nmstudentassessment_pk PRIMARY KEY (ChangeVersion)
);
END IF;

END
$$;
