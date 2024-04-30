-- Remove tables if they exists to recreate them:w
set foreign_key_checks = 0;
drop table if exists client;
drop table if exists attorney;
drop table if exists client_case;
drop table if exists legal_document;
drop table if exists court;
drop table if exists billing;
set foreign_key_checks=1;

-- Create tables with no foreign key constraints first.
create table attorney 
(
    attorney_id int not null auto_increment,
    fname varchar(20),
    minit varchar(1),
    lname varchar(20),
    specialization varchar(25),
    attorney_phone varchar(10),
    address varchar(50),
    office_number varchar(3),
    primary key (attorney_id)
);

create table client 
(
    client_id int not null auto_increment,
    fname varchar(20), 
    minit varchar(1), 
    lname varchar(20),
    phone varchar(10),
    client_type enum('Individual', 'Corporate'),
    address varchar(50),
    attorney int, -- foreign key into attorney
    primary key (client_id)
);

create table billing 
(
    invoice_number smallint not null auto_increment,
    date_issued date, 
    payment_status enum('Draft', 'Send', 'Paid', 'Partial', 'Overdue'),
    amount decimal (13, 2), 
    client int,  -- foreign key into client
    primary key (invoice_number)
);

create table client_case 
(
    case_id int not null auto_increment, 
    case_status enum('Pending', 'In-Progress', 'Complete'), 
    date_filed date, 
    case_type enum('Dispute Resolution', 'Intellectual Property', 'Contract Dispute', 
        'Fraud'),
    court int, -- foreign key into court table
    attorney int, -- foreign key into attorney table
    billing int, -- foreign key into billing table 
    legal_document int, -- foreign key into legal_document table
    primary key (case_id)
);

create table legal_document 
(
    document_id int not null auto_increment,
    date_created date,
    primary key (document_id)
);

create table court 
(
    court_id int not null auto_increment, 
    name varchar(25),
    address varchar(50),
    primary key (court_id)
);



 -- Populate DEPENDENT 
-- insert into dependent (essn, dependent_name, sex, bdate, relationship)
-- values 
--     ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
--     ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
--     ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
--     ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
--     ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
--     ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
--     ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

-- Add the foreign key constraints on each of the tables created
-- alter table employee 
-- add foreign key (dno) references department(dnumber);
