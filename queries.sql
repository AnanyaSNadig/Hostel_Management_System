-- Creating tables

create table student(room_no int, srn varchar(50), name varchar(50), semester int, phone bigint, address varchar(200), PRIMARY KEY(srn)); 

create table dependent(dependent_id int,dname varchar(50),relation varchar(50),phone bigint, address varchar(100),dob date,PRIMARY KEY(dependent_id));  

create table student_dependent(srn varchar(50),dependent_id int ,PRIMARY KEY(srn, dependent_id), FOREIGN KEY(srn) REFERENCES student(srn) ON DELETE CASCADE, FOREIGN KEY(dependent_id) REFERENCES dependent(dependent_id)); 

 create table unit(unit_no int PRIMARY KEY, location varchar(100), capacity int); 
 alter table student add column unit_no int; 
 alter table student add constraint FOREIGN KEY (unit_no) references unit(unit_no);  
alter table student ADD dob date;  

create table staff(staff_id int PRIMARY KEY,unit_no int, name varchar(50), occupation varchar(50), salary int, dob date,doj date, FOREIGN KEY(unit_no) references unit(unit_no)); 

create table fee(rcpt_id int PRIMARY KEY, srn varchar(50), amount int, year year, FOREIGN KEY(srn) references student(srn) ON DELETE CASCADE);  
alter table fee add column type varchar(50);

create table lg(srn varchar(50), start_date date, end_date date, dependent_id int,PRIMARY KEY(srn,dependent_id), FOREIGN KEY (srn) references student(srn) on delete cascade, FOREIGN KEY (dependent_id) references dependent(dependent_id));

alter table lg add column duration int;
alter table student add column srn varchar(50);

-- Inserting values to the tables

INSERT INTO student
VALUES (101, 'SRN001', 'Ananya Sharma', 2, 9876543210, 'Delhi',2, '2000-01-01'),
(302, 'SRN002', 'Aarushi Singh', 3, 8765432109, 'Mumbai', 1,'1999-02-02'),
(303, 'SRN003', 'Aashna Patel', 1, 7654321098, 'Ahmedabad',2, '2001-03-03'),
(204, 'SRN004', 'Anjali Gupta', 4, 6543210987, 'Jaipur', 3,'1998-04-04'),
(005, 'SRN005', 'Akshara Reddy', 2, 5432109876, 'Hyderabad',2, '2000-05-05'),
(106, 'SRN006', 'Anjana Nair', 3, 4321098765, 'Bangalore', 1,'1999-06-06'),
(107, 'SRN007', 'Aditi Rao', 1, 3210987654, 'Chennai',3, '2001-07-07'),
(108, 'SRN008', 'Aarohi Desai', 4, 2109876543, 'Pune',2, '1998-08-08'),
(209, 'SRN009', 'Alisha Rawat', 2, 1098765432, 'Kolkata',2, '2000-09-09'),
(210, 'SRN010', 'Aanya Verma', 3, 9876543210, 'Lucknow',3, '1999-10-10'),
(311, 'SRN011', 'Bhavya Sharma', 1, 1234567890, 'Delhi',4, '2001-11-11'),
(002, 'SRN012', 'Bhumika Singh', 2, 2345678901, 'Mumbai',4, '2000-12-12'),
(123, 'SRN013', 'Bhavana Patel', 3, 3456789012, 'Ahmedabad', 4,'1999-01-13'),
(214, 'SRN014', 'Bhavika Gupta', 4, 4567890123, 'Jaipur',2, '1998-02-14'),
(203, 'SRN015', 'Chetna Reddy', 1, 5678901234, 'Hyderabad',1, '2001-03-15'),
(206, 'SRN016', 'Chhavi Nair', 2, 6789012345, 'Bangalore',3, '2000-04-16'),
(007, 'SRN017', 'Chitra Rao', 3, 7890123456, 'Chennai',4, '1999-05-17'),
(108, 'SRN018', 'Charu Desai', 4, 8901234567, 'Pune', 2,'1998-06-18'),
(109, 'SRN019', 'Dhriti Rawat', 1, 9012345678, 'Kolkata',1, '2001-07-19'),
(303, 'SRN020', 'Deepti Verma', 3, 1122334455, 'Allahabad',3, '1999-08-20');

INSERT INTO dependent
VALUES(1, 'Radhika Sharma','Mother', 9876543210, 'Delhi', '1965-01-01', 'SRN001'),
(2, 'Nitya Singh', 'Sister', 8765432109, 'Mumbai', '1996-02-02', 'SRN002'),
(3, 'Divya Patel', 'Sister', 7654321098, 'Ahmedabad', '1994-03-03', 'SRN003'),
(4, 'Anushka Gupta', 'Aunt', 6543210987, 'Jaipur', '1960-04-04', 'SRN004'),
(5, 'Bhaskar Reddy', 'Father', 5432109876, 'Hyderabad', '1955-05-05', 'SRN005'),
(6, 'Aaradhya Nair','Sister', 4321098765, 'Bangalore', '1994-06-06', 'SRN006'),
(7, 'Sakshi Rao', 'Sister', 3210987654, 'Chennai', '2000-07-07', 'SRN007'),
(8, 'Sanjay Desai', 'Brother', 2109876543, 'Pune', '1992-08-08', 'SRN008'),
(9, 'Ishita Rawat', 'Aunt', 1098765432, 'Kolkata', '1980-09-09', 'SRN009'),
(10, 'Sana Verma', 'Sister', 9876543210, 'Lucknow', '1994-10-10', 'SRN010'),
(12, 'Nithesh Singh', 'Brother', 2345678901, 'Mumbai', '1997-10-12', 'SRN002'),
(13, 'Nagesh Sharma', 'Father', 955633214, 'Delhi', '1960-02-02','SRN001'),
(14, 'Naresh Sharma', 'Brother', 7752234236, 'Delhi', '1985-08-20','SRN001');


INSERT INTO unit
VALUES(1,'Jayanagar' , 150),
(2, 'Girinagar', 200),
(3,  'Basavanagudi', 100),
(4,'JP Nagar', 50)
(5,'Jayanagar' , 70),
(6,'JP Nagar' , 60),
(7,'Jayanagar' , 50)
(8, 'Basavanagudi', 155);

insert into lg
VALUES ('S001', '2022-02-01', '2022-02-28', 1, 28),
('S002', '2022-03-15', '2022-03-20', 2, 5),
('S003', '2022-06-01', '2022-06-30', 3, 30),
('S004', '2022-05-01', '2022-05-05', 4, 4),
('S005', '2022-09-01', '2022-09-30', 5, 30),
('S006', '2022-11-01', '2022-11-10', 6, 9),
('S007', '2022-04-01', '2022-04-30', 7, 29),
('S008', '2022-08-01', '2022-08-05', 8, 4),
('S009', '2022-01-01', '2022-01-31', 9, 30),
('S010', '2022-12-01', '2022-12-31', 10, 30),
('S011', '2022-07-01', '2022-07-31', 11, 30),
('S012', '2022-04-15', '2022-04-30', 12, 16),
('S013', '2022-03-01', '2022-03-15', 13, 15),
('S014', '2022-11-01', '2022-11-30', 14, 30),
('S015', '2022-05-01', '2022-05-31', 15, 31),
('S016', '2022-06-15', '2022-07-10', 16, 26),
('S017', '2022-08-15', '2022-08-31', 17, 17),
('S018', '2022-09-01', '2022-09-15', 18, 14),
('S019', '2022-10-01', '2022-10-31', 19, 31),
('S020', '2022-12-01', '2022-12-15', 20, 14);

Insert into staff
Values (1001, 1, 'Amit', 'Manager', 75000, '1990-05-01', '2015-06-01'),
(1002, 1, 'Rahul', 'Assistant Manager', 60000, '1995-02-14', '2020-02-01'),
(1003, 2, 'Priya', 'Housekeeper', 30000, '1988-11-20', '2010-06-01'),
(1004, 2, 'Suresh', 'Security Guard', 25000, '1992-09-10', '2015-03-01'),
(1005, 3, 'Shubhangi', 'Caterer', 40000, '1985-06-12', '2012-08-01'),
(1006, 3, 'Anjali', 'Chef', 50000, '1991-04-25', '2017-01-01'),
(1007, 4, 'Shivam', 'Waiter', 20000, '1998-08-18', '2021-02-01'),
(1008, 4, 'Aryan', 'Receptionist', 35000, '1994-12-31', '2018-06-01'),
(1009, 1, 'Anita', 'Manager', 75000, '1989-09-21', '2015-06-01'),
(1010, 1, 'Kumar', 'Assistant Manager', 60000, '1994-01-05', '2020-02-01'),
(1011, 2, 'Jaya', 'Housekeeper', 30000, '1991-06-10', '2010-06-01'),
(1012, 2, 'Akash', 'Security Guard', 25000, '1995-11-25', '2015-03-01'),
(1013, 3, 'Sakshi', 'Caterer', 40000, '1986-12-29', '2012-08-01'),
(1014, 3, 'Nitin', 'Chef', 50000, '1992-03-16', '2017-01-01'),
(1015, 4, 'Rajesh', 'Waiter', 20000, '1999-05-27', '2021-02-01'),
(1016, 4, 'Aman', 'Receptionist', 35000, '1993-08-04', '2018-06-01'),
(1017, 1, 'Kavita', 'Manager', 75000, '1990-07-15', '2015-06-01'),
(1018, 1, 'Mohit', 'Assistant Manager', 60000, '1996-04-11', '2020-02-01'),
(1019, 2, 'Riya', 'Housekeeper', 30000, '1989-03-23', '2010-06-01'),
(1020, 2, 'Aditya', 'Security Guard', 25000, '1994-02-08', '2015-03-01');

Insert into fee
Values (1, 'SRN001', 5000, 2022,"UPI"),
(2, 'SRN002', 6000, 2022,"NEFT"),
(3, 'SRN003', 7000, 2022,"NEFT"),
(4, 'SRN004', 8000, 2022,"NEFT"),
(5, 'SRN005', 9000, 2020,'CASH'),
(6, 'SRN006', 10000, 2022,'CASH'),
(7, 'SRN007', 11000, 2021,'UPI'),
(8, 'SRN008', 12000, 2022,'CASH'),
(9, 'SRN009', 13000, 2021,'CHEQUE'),
(10, 'SRN010', 14000, 2022,'UPI'),
(11, 'SRN011', 15000, 2022,'NEFT'),
(12, 'SRN012', 16000, 2022,'CHEQUE'),
(13, 'SRN013', 17000, 2020,'CHEQUE'),
(14, 'SRN014', 18000, 2021,'UPI'),
(15, 'SRN015', 19000, 2022,'CASH'),
(16, 'SRN016', 20000, 2022,'NEFT'),
(17, 'SRN017', 21000, 2022,'CHEQUE'),
(18, 'SRN018', 22000, 2021,'CASH'),
(19, 'SRN019', 23000, 2022,'UPI'),
(20, 'SRN020', 24000, 2020,'NEFT');

insert into student_dependent
VALUES('SRN001',1),
('SRN002',2),
('SRN003',3),
('SRN004',4),
('SRN005',5),
('SRN006',6),
('SRN007',7),
('SRN008',8),
('SRN009',9),
('SRN010',10),
('SRN002',12),
('SRN001',13),
('SRN001',14);

-- Queries
-- Query 1
SELECT COUNT(unit_no) FROM unit WHERE capacity>120 and location LIKE "Basavanagudi" ;

-- Query 2
SELECT AVG(salary),occupation FROM Staff GROUP BY occupation ORDER BY AVG(salary) ASC;

-- Query 3
SELECT SUM(salary),occupation FROM Staff GROUP BY occupation;

-- Query 4
SELECT student.name,student.srn,student.semester FROM student WHERE DOB BETWEEN "2000-01-01" AND "2001-12-31";

-- Query 5
SELECT student.srn,student.name from student,fee where type LIKE "NEFT" OR "CASH";

-- Query 6
SELECT srn, COUNT(*) AS count
FROM dependent
GROUP BY srn
HAVING COUNT(*) = (
    SELECT MAX(count) FROM (
        SELECT COUNT(*) AS count FROM dependent GROUP BY srn
    ) AS counts
)

-- Query 7
SELECT srn, COUNT(*) AS count
FROM dependent
GROUP BY srn
HAVING COUNT(*) = (
    SELECT MIN(count) FROM (
        SELECT COUNT(*) AS count FROM dependent GROUP BY srn
    ) AS counts
)

-- Query 8
SELECT * 
FROM (student AS S LEFT OUTER JOIN dependent AS D 
ON S.srn = D.srn) WHERE S.srn LIKE "SRN001";

-- Query 9
SELECT name ,srn,room_no,semester
FROM (dependent AS D RIGHT OUTER JOIN  student AS S
ON S.srn = D.srn_student) WHERE D.dname LIKE "Sana Verma";

-- Query 10
SELECT name, srn, semester 
FROM (student NATURAL JOIN fee) 
WHERE fee.year = 2021;

-- Query 11
SELECT staff_id, unit_no,name,occupation
FROM staff
WHERE doj LIKE "_-03-01" AND "_-06-01"
UNION
SELECT staff_id, unit_no,name,occupation
FROM staff
WHERE occupation like "Manager";

-- Query 12
SELECT staff_id, unit_no,name,occupation
FROM staff
WHERE unit_no=2 EXCEPT 
(SELECT staff_id, unit_no,name,occupation
FROM staff
WHERE doj LIKE "2010-_-_");

-- Query 13
select staff_id, unit.unit_no,name
From staff,unit
WHERE staff.unit_no=unit.unit_no AND
staff.dob LIKE "1990-__-__" 
AND EXISTS(
SELECT location from unit where location = "Jayanagar" OR "Girinagar"
);

-- Query 14
select staff_id, unit.unit_no,name
From staff,unit
WHERE staff.unit_no=unit.unit_no AND
staff.dob LIKE "1993-__-__" 
AND NOT EXISTS(
SELECT location from unit where location="Jayanagar" OR "Girinagar"
);

-- Query 15
DELIMITER $$
CREATE FUNCTION calc_age(dob date)
RETURNS int
DETERMINISTIC
BEGIN
DECLARE result int;
(SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),dob)), '%Y')+0 as age) into result;
return result;
END;
$$

SELECT name, srn, calc_age(dob) AS age FROM student;

-- Query 16
DELIMITER && 
CREATE PROCEDURE display_fees_max (INOUT var1 int) 
BEGIN 
 SELECT MAX(amount) INTO var1 FROM fee WHERE rcpt_id=var1; 
END && 
DELIMITER ; 
SET @M = '10'; 
CALL display_fees_max(@M); 
SELECT @M;

-- Query 17
DELIMITER $$
CREATE TRIGGER guardian_count
BEFORE INSERT
ON dependent
FOR EACH ROW
BEGIN
DECLARE error_msg VARCHAR(500);
DECLARE result int;
(select count(*) from dependent where dependent.srn_student = NEW.srn_student) into result;
IF (result > 2)
THEN
SET error_msg = 'Cannot have more than two guardian';
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = error_msg;
END IF;
END $$

INSERT INTO dependent
VALUES (15, 'Niyati Singh', 'Sister', 8765432189, 'Mumbai', '1998-02-02', 'SRN002');

INSERT INTO dependent
VALUES (16, 'Naresh Singh', 'Brother', 8765432189, 'Mumbai', '1985-06-02', 'SRN002');




