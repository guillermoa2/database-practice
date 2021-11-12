Use bvt_demo;

CREATE TABLE bvt_demo.school (
id int NOT NULL AUTO_INCREMENT UNIQUE,
name varchar (255),
date_founded date,
date_entered datetime DEFAULT now(),
PRIMARY KEY (ID)
);

CREATE TABLE bvt_demo.student (
id int NOT NULL AUTO_INCREMENT UNIQUE,
first_name varchar (255),
last_name varchar (255) NOT NULL,
school_id int NOT NULL,
start_date date,
date_entered  datetime DEFAULT now(),
PRIMARY KEY (id),
FOREIGN KEY (school_id) REFERENCES school(id)
);

 --  Question 1
INSERT INTO bvt_demo.school (name, date_founded) VALUES
('Sky High', '2000-01-01'),
('SchoolB', '2010-02-02'),
('Coding Academy', '2020-03-03');

-- Question 2
INSERT INTO bvt_demo.student (first_name, last_name, school_id, start_date) VALUES
('Phil', 'Lan', '6', '2020-03-03'),
('Gabe', 'Smith', '5', '2020-03-04'),
('Guillermo', 'Smith', '4', '2020-04-03'),
('John', 'Jackson', '6', '2021-03-03'),
('Carlos', 'Sanchez', '4', '2021-06-03');

-- Question 3
SELECT *
FROM bvt_demo.student
WHERE school_id <> '6'
ORDER BY id
LIMIT 1;

-- Question 4 
SELECT * 
FROM bvt_demo.school
ORDER BY date_founded;

-- Question 5
SELECT *
FROM bvt_demo.student stu
JOIN bvt_demo.school school
ON stu.school_id = school.id;

-- Question 6
UPDATE bvt_demo.student 
SET school_id = '6'
WHERE last_name = 'Smith';

--  Question 7
DELETE FROM bvt_demo.student
WHERE school_id <> '6';



-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Error Code: 1046. No database selected Select the default DB to be used by double-clicking its name in the SCHEMAS list in the sidebar.

-- Error Code: 1136. Column count doesn't match value count at row 1
-- Error Code: 1054. Unknown column 'SchoolB' in 'field list'
-- Error Code: 1292. Incorrect date value: '1998' for column 'date_founded' at row 1

