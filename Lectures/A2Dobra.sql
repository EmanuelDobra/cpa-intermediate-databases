-- Emanuel Dobra, March 18 2021, database of podcasts and their guests.
 
DROP DATABASE IF EXISTS A2Emanuel;
CREATE DATABASE A2Emanuel;
USE A2Emanuel;

-- podcasts and guests // One guest may have many podcasts, and one podcast may have many guests

CREATE TABLE podcasts
(
	podcast_id				varchar(4)	primary key,
	podcast_air_date		date,
    podcast_is_recorded		boolean,
    podcast_pay_per_guest	decimal(6, 2),
    podcast_rating			decimal(2,1)
);

INSERT INTO podcasts VALUES
(301, '2020-01-01', true, 1000.00, 4.5),
(302, '2020-02-01', true, 900.50, 4.8),
(303, '2020-03-01', false, 400.00, 3.7),
(304, '2020-04-01', true, 750.50, 5.0),
(305, '2020-05-01', false, 550.00, 2.9);

CREATE TABLE guests 
(
	guest_id				varchar(4)	primary key,
    guest_firstN			varchar(20),
    guest_lastN 			varchar(20),
    guest_sex				char
);

INSERT INTO guests VALUES
(101, "Marty", "Sauron", 'm'),
(102, "Carl", "Kheks", 'm'),
(103, "Sarah", "Mantor", 'f'),
(104, "Boris", "Kork", 'm'),
(105, "Clara", "Sein", 'f'),
(106, "Matilda", "Sorven", 'f');

CREATE TABLE podcastguests
(
	podcast_id				varchar(4),
    guest_id				varchar(4),
    podcast_revenue			decimal(7, 2),
    primary key(podcast_id, guest_id),  -- table level PK definition
    
    foreign key(podcast_id)
		references podcasts(podcast_id),
	foreign key(guest_id)
		references guests(guest_id)
);

INSERT INTO podcastguests VALUES
(301, 101, 15000.00),
(301, 102, 15000.00),
(301, 105, 15000.00),
(301, 106, 15000.00),
(302, 102, 22000.00),
(302, 103, 22000.00),
(302, 106, 22000.00),
(303, 101, 11000.00),
(303, 103, 11000.00),
(303, 104, 11000.00),
(303, 105, 11000.00);

CREATE TABLE guests_overview
(
	guest_id						varchar(4),
	guest_personal_rating 			decimal(2, 1),
    guest_total_podcasts_done		int,
    CONSTRAINT guests_fk_overview
		FOREIGN KEY (guest_id)
        REFERENCES guests (guest_id)
);

INSERT INTO guests_overview VALUES
(101, 4.5, 385),
(102, 4.0, 97),
(103, 4.9, 230),
(104, 4.2, 402),
(105, 3.7, 124),
(106, 3.9, 235);


-- 1
SELECT guest_firstN, guest_lastN, guest_total_podcasts_done, guest_personal_rating
FROM guests g
	JOIN guests_overview gw
    ON g.guest_id = gw.guest_id;
    
-- 2
SELECT podcast_id, podcast_pay_per_guest, (podcast_pay_per_guest * 3) as average_total_guest_pay, podcast_rating  
FROM podcasts
	ORDER BY average_total_guest_pay DESC;

-- 3
SELECT p.podcast_id, pg.guest_id
FROM podcasts p
	LEFT JOIN podcastguests pg
    ON pg.podcast_id = p.podcast_id
    WHERE pg.guest_id IS NULL;
    
-- 4
SELECT p.podcast_id, p.podcast_rating, g.guest_firstN, g.guest_lastN, go.guest_personal_rating 
FROM guests_overview go, guests g, podcastguests pg, podcasts p
    WHERE go.guest_id = g.guest_id AND g.guest_id = pg.guest_id AND pg.podcast_id = p.podcast_id
		ORDER BY p.podcast_id;
