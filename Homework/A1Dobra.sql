/* Name: Emanuel Dobra, Topic: Dogs */
-- One dog may have many visits

DROP DATABASE IF EXISTS DobraDogs;
CREATE DATABASE DobraDogs;
USE DobraDogs;

CREATE TABLE dog
(
	dog_license_id				varchar(5) 	primary key,								
    dog_name					varchar(20), 											
    dog_birthday				date,
    dog_weight					int,
    dog_gender 					varchar(6),
    dog_breed 					varchar(20),
    owner_phone					varchar(12)
);

INSERT INTO dog VALUES
(20325, "Larry", '2020-08-13', 23, "Male", "Bulldog", "613-746-3425"),
(20326, "Austin", '2020-05-12', 11, "Male", "Beagle", "434-321-5262"),
(20327, "Sara", '2020-07-21', 26, "Female", "Poodle", "351-423-6346"),
(20328, "Clara", '2020-05-18', 37, "Female", "Rottweiler", "358-421-2521"),
(20329, "Faraam", '2019-06-11', 13, "Male", "Beagle", "502-124-2352"),
(20330, "Synthia", '2018-08-12', 19, "Female", "Bulldog", "434-234-2964");

CREATE TABLE clinic
(
	clinic_visit_id				varchar(5)	primary key,
    dog_license_id				varchar(5),									
    visit_date					date, 										
    visit_reason				varchar(30),
    visit_cost  				decimal(5,2), 		
    comments 					varchar(150),
    CONSTRAINT dog_fk_program 					
		FOREIGN KEY (dog_license_id)
        REFERENCES dog (dog_license_id)
);

INSERT INTO clinic VALUES
(301, 20325, '2020-01-30', "Yearly Checkup", 39.99, "Dog was in great condition."),
(302, 20327, '2020-01-23', "Yearly Checkup", 39.99, "Dog seemed to have hearing problems, scheduled another check-in time."),
(303, 20326, '2020-02-04', "Yearly Checkup", 39.99, "Dog was in great condition"),
(304, 20327, '2020-02-11', "Ear Infection", 103.50, ""),
(305, 20329, '2020-02-19', "Yearly Checkup", 39.99, "Dog was in great condition"),
(306, 20330, '2020-03-04', "Yearly Checkup", 39.99, "Dog seemed to have lost some fur, but not yet warranting much concern."),
(307, 20325, '2020-03-25', "Upset Stomach", 56.99, "Swalloed 7 dimes."),
(308, 20328, '2020-04-17', "Bladder Infection", 85.99, ""),
(309, 20325, '2020-05-19', "Bladder Infection", 85.99, ""),
(310, 20326, '2020-05-28', "Bruise", 43.50, "Leg should heal in a week."),
(311, 20330, '2020-06-03', "Skin Allergies", 75.00, ""),
(312, 20325, '2020-06-10', "Ear Infection", 103.50, ""),
(313, 20328, '2020-06-22', "Arthritis", 170.99, ""),
(314, 20329, '2020-07-15', "Arthritis", 170.00, ""),
(315, 20325, '2020-07-22', "Bruise", 48.50, ""),
(316, 20327, '2020-07-30', "Bruise", 41.50, "");

CREATE TABLE private_info
(
	dog_license_id				varchar(5)	primary key,
    rabbies_vaccinated			boolean,									
    spayed_or_neutered			boolean									
);

INSERT INTO private_info VALUES
(20325, 0, 1),
(20326, 0, 0),
(20327, 1, 1),
(20328, 0, 1),
(20329, 1, 1),
(20330, 1, 0);

SELECT * FROM dog;
SELECT * FROM clinic;
SELECT * FROM private_info;
SELECT dog_name, visit_date, visit_cost
FROM dog
	JOIN clinic
    ON dog.dog_license_id = clinic.dog_license_id;