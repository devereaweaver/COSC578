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
    ('Research', 5, '33344555', '1988-05-22'),
    ('Administration', 4, '987654321', '1995-01-01'),
    ('Headquarters', 1, '88866555', '1981-06-19');

-- Populate PROJECT 
insert into project (pname, pnumber, plocation, dnum)
values 
    ('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization', 20, 'Houston', 1),
    ('Newbenefits', 30, 'Stafford', 4);
    
-- Populate DEPENDENT 
insert into dependent (essn, dependent_name, sex, bdate, relationship)
values 
    ('33344555', 'Alice', 'F', '1986-04-05', 'Daughter'),
    ('33344555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('33344555', 'Joy', 'F', '1958-05-03', 'Spouse'),
    ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
    ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
    ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

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
    