-- Create tables with no foreign key constraints first so that we can 
-- make sure each is created properly without trying to create any with circular 
-- references to each other. 
create table dept_locations 
(
    dnumber smallint not null,
    dlocation varchar(25) not null,
    primary key (dnumber, dlocation)
    -- foreign key (dnumber) references department(dnumber)
);

create table department
(
    dname varchar(25),
    dnumber smallint not null, 
    mgrssn varchar(9),
    mgrstartdate date,
    primary key (dnumber)
    -- foreign key (mgrssn) references employee(ssn)
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
    hours decimal(2, 1), 
    primary key (essn, pno)
    -- foreign key (pno) references project(pnumber),
    -- foreign key (essn) references employee(ssn)
);

create table project
(
    pname varchar(25),
    pnumber smallint not null, 
    plocation varchar(25),
    dnum smallint,
    primary key (pnumber)
    -- foreign key (dnum) references department(dnumber),
);

create table dependent
(
    essn varchar(9),
    dependent_name varchar(25), 
    sex enum('M', 'F'),
    bdate date,
    relationship varchar(25),
    primary key (essn, dependent_name)
    -- foreign key (essn) references employee(ssn)
);