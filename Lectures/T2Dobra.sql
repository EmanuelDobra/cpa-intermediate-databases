-- Name: Emanuel Dobra
-- Date: 2021/04/01

DROP DATABASE IF EXISTS WildernessDobra;
CREATE DATABASE WildernessDobra;
USE WildernessDobra;

CREATE TABLE course 
(
	course_name			varchar(20) primary key,
    course_difficulty	varchar(10),
    course_cost			decimal(5, 2),
    course_gearWeight	decimal(4, 2),
    course_startDate	date
);

INSERT INTO course VALUES
("Wild Edibles", "easy", 120.50, 0, '2021-07-15'),
("Animal Tracking", "medium", 75, 3, '2020-10-01'),
("Building Shelters", "difficult", 250, 15, '2021-06-30'),
("Flowery Tsunders", "easy", 90.50, 1, '2021-11-27');

CREATE TABLE participant
(
	participant_lastName	varchar(20) primary key,
	participant_firstName	varchar(20),
    participant_covidTest	char(1)
);

INSERT INTO participant VALUES
("Suzuki", "Joe", 'N'),
("Jones", "Ezra", 'Y'),
("Johnston", "Pat", 'Y'),
("Lee", "Sue", 'Y'),
("Dobra", "Emanuel", 'Y');

CREATE TABLE courseparticipants
(
	course_name				varchar(20),
    participant_lastName	varchar(20),
    course_fee_paid			bool,
    primary key(course_name, participant_lastName),  
    
    foreign key(course_name)
		references course(course_name),
	foreign key(participant_lastName)
		references participant(participant_lastName)
);

INSERT INTO courseparticipants VALUES
("Wild Edibles", "Suzuki", false),
("Animal Tracking", "Suzuki", true),
("Wild Edibles", "Jones", false),
("Building Shelters", "Jones", false),
("Wild Edibles", "Johnston", true),
("Animal Tracking", "Johnston", false),
("Animal Tracking", "Lee", false),
("Building Shelters", "Lee", true);

CREATE TABLE courselocation
(
	course_name				varchar(20),
    course_meetupLocation	varchar(25),
    course_roadAccess		bool,
    CONSTRAINT course_fk_location
		FOREIGN KEY (course_name)
        REFERENCES course (course_name)
);

INSERT INTO courselocation VALUES
("Wild Edibles", "West Burrow", true),
("Animal Tracking", "South Arcana", true),
("Building Shelters", "Lowly Falls", false);


-- 1
SELECT participant_firstName, p.participant_lastName
FROM participant p
	LEFT JOIN courseparticipants cp
    ON p.participant_lastName = cp.participant_lastName
    WHERE cp.course_name IS NULL;
    
-- 2
SELECT course_name, course_difficulty, course_startDate, DAYNAME(course_startDate) as course_startWeekDay
FROM course;

-- 3 
SELECT CONCAT(participant_firstName, " ", participant_lastName) as participant_name, RAND()*(2500-11)+11 as participant_tagNumber
FROM participant
ORDER BY participant_tagNumber DESC;

-- 4 
SELECT course_name, REVERSE(course_name) as course_nameReversed, CHAR_LENGTH(course_name) as course_nameLength
FROM course;

-- 5
SELECT CONCAT(p.participant_firstName, " ", p.participant_lastName) as participant_name, cp.course_name, cl.course_meetupLocation
FROM participant p, courseparticipants cp
	JOIN courselocation cl
	WHERE p.participant_covidTest = 'Y' AND p.participant_lastName = cp.participant_lastName AND cl.course_name = cp.course_name; 
