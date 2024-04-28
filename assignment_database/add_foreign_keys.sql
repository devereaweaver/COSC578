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