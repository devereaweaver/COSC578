show tables;

desc department;
desc dependent;
desc dept_locations;
desc employee;
desc project;
desc works_on;

drop table dept_locations;
drop table department;
drop table employee;
drop table works_on;
drop table project;
drop table dependent;

-- Check if constraints are working properly 
SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,   -- <<-- the one you want! 
  REFERENCED_TABLE_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_NAME = 'department';