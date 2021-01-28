-- Jan 28, p342

-- create Fitness Database from last semester

-- create the database
DROP DATABASE IF EXISTS jan28Fitness; -- without this you get an error if you try to run multiple times
CREATE DATABASE jan28Fitness; 

-- select the database
USE jan28Fitness;

CREATE TABLE program
{
    programID               int             PRIMARY KEY,
    programType             varchar(20),
    programMthlyFee         decimal(4,2),   -- (total, decimal) i.e (6,3) allows up to 999999.999
    programPhysical         boolean
}

INSERT INTO program VALUES
(201, 'Junior', 62, 1),
(202, 'Young', 23, 0),
(203, 'Adult', 25, 1),
(204, 'Senior', 55, 0);

SELECT * FROM program; 

CREATE TABLE members
(
	memberID 		int			primary key,
	programID		int,
    memberFName	    varchar(20),
    memberLName 	varchar(30),
    memberSteet    varchar(50),
    memberCity		varchar(30),					-- refer to page 349
	CONSTRAINT member_fk_program 					-- made up name
		FOREIGN KEY (programID)
        REFERENCES program (programID)
);

INSERT INTO members VALUES
(1103,201,'JOSEPH','Eckler','29 Prospect Street', 'Ashland'),
(1105,203,'Barry','Hassan','9 Harrington Avenue', 'Richmond');

select * from members;
