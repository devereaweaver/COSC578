-- Drop all the tables at once after being created 

set foreign_key_checks = 0;
drop table if exists department;
drop table if exists dependent;
drop table if exists dept_locations;
drop table if exists employee;
drop table if exists project;
drop table if exists works_on;
set foreign_key_checks=1;

show tables;