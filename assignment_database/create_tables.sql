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
    salary decimal (6, 2), 
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