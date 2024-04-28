-- Remove tables if they exists to recreate them:w
set foreign_key_checks = 0;
drop table if exists department;
drop table if exists dependent;
drop table if exists dept_locations;
drop table if exists employee;
drop table if exists project;
drop table if exists works_on;
set foreign_key_checks=1;

-- Create tables with no foreign key constraints first.
create table dept_locations 
(
    dnumber smallint not null,
    dlocation varchar(25) not null,
    primary key (dnumber, dlocation)
);

create table department
(
    dname varchar(25),
    dnumber smallint not null, 
    mgrssn varchar(9),
    mgrstartdate date,
    primary key (dnumber)
);

create table employee 
(
	ssn varchar(9) not null,
    fname varchar(25),
    minit varchar(1),
    lname varchar(25),
    bdate date, 
    address varchar(50),
    sex enum('M', 'F'),
    salary int, 
    superssn varchar(9),
    dno smallint,
    primary key (ssn)
);

create table works_on
(
    essn varchar(9) not null,
    pno smallint not null,
    hours decimal(3, 1), 
    primary key (essn, pno)
);

create table project
(
    pname varchar(25),
    pnumber smallint not null, 
    plocation varchar(25),
    dnum smallint,
    primary key (pnumber)
);

create table dependent
(
    essn varchar(9),
    dependent_name varchar(25), 
    sex enum('M', 'F'),
    bdate date,
    relationship varchar(25),
    primary key (essn, dependent_name)
);

-- Populate DEPT_LOCATIONS
insert into dept_locations (dnumber, dlocation) 
values 
    (1, 'Houston'),
    (4, 'Stafford'),
    (5, 'Bellaire'),
    (5, 'Sugarland'),
    (5, 'Houston');

-- Populate DEPARTMENT 
insert into department (dname, dnumber, mgrssn, mgrstartdate)
values
    ('Research', 5, '333445555', '1988-05-22'),
    ('Administration', 4, '987654321', '1995-01-01'),
    ('Headquarters', 1, '888665555', '1981-06-19');

-- Populate PROJECT 
insert into project (pname, pnumber, plocation, dnum)
values 
    ('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization', 20, 'Houston', 1),
    ('Newbenefits', 30, 'Stafford', 4);
    

-- Populate WORKS_ON
insert into works_on (essn, pno, hours) 
values 
    ('123456789', 1, 32.5), 
    ('123456789', 2, 7.5), 
    ('666884444', 3, 40.0),
    ('453453453', 1, 20.0),
    ('453453453', 2, 20.0),
    ('333445555', 2, 10.0),
    ('333445555', 3, 10.0),
    ('333445555', 10, 10.0),
    ('333445555', 20, 10.0),
    ('999887777', 30, 30.0),
    ('999887777', 10, 10.0),
    ('987987987', 10, 35.0),
    ('987987987', 30, 5.0),
    ('987654321', 30, 20.0),
    ('987654321', 20, 15.0),
    ('888665555', 20, null);
    
-- Populate EMPLOYEE 
insert into employee (ssn, fname, minit, lname, bdate, address, sex, salary, superssn, dno)
values 
    ('123456789', 'John', 'B', 'Smith', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5),
    ('333445555', 'Franklin', 'T', 'Wong', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
    ('999887777', 'Alicia', 'J', 'Zelaya', '1968-07-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4), 
    ('987654321', 'Jennifer', 'S', 'Wallace', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
    ('666884444', 'Ramesh', 'K', 'Narayan', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
    ('453453453', 'Joyce', 'A', 'English', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5), 
    ('987987987', 'Ahmad', 'V', 'Jabbar', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4),
    ('888665555', 'James', 'E', 'Borg', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, null, 1);

-- Populate DEPENDENT 
insert into dependent (essn, dependent_name, sex, bdate, relationship)
values 
    ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
    ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
    ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
    ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
    ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

-- Add the foreign key constraints on each of the tables created

-- EMPLOEE.DNO is a foreign key to DEPARTMENT.DNUMBER
alter table employee 
add foreign key (dno) references department(dnumber);

-- DEPARMENT.MGRSSN is FK to EMPLOYEE.SSN
alter table department 
add foreign key (mgrssn) references employee(ssn);

-- DEPT_LOCATIONS.DNUMBER references DEPARTMENT.DNUMBER
alter table dept_locations
add foreign key (dnumber) references department(dnumber);

-- WORKS_ON.ESSN references EMPLOYEE.SSN
alter table works_on 
add foreign key (essn) references employee (ssn);

-- WORKS_ON.PNO references PROJECT.PNUMBER
alter table works_on
add foreign key (pno) references project (pnumber);

-- PROJECT.DNUM references DEPARTMENT.DNUMBER 
alter table project 
add foreign key (dnum) references department(dnumber);

-- DEPENDENT.ESSN references EMPLOYEE.SSN
alter table dependent
add foreign key (essn) references employee(ssn);