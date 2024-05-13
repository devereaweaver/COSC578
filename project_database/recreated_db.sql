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
    client_name varchar(50),
--     fname varchar(20), 
--     minit varchar(1), 
--     lname varchar(20),
--     lname varchar(20),
    phone varchar(10),
    client_type enum('Individual', 'Corporate'),
    address varchar(50),
    attorney int, -- foreign key into attorney
    primary key (client_id)
);

create table billing 
(
    invoice_number int not null auto_increment,
    date_issued date, 
    payment_status enum('Draft', 'Sent', 'Paid', 'Partial', 'Overdue'),
    amount decimal (13, 2), 
    billable_hours decimal(13, 2),
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
    name varchar(50),
    address varchar(50),
    primary key (court_id)
);

insert into  attorney (fname, minit, lname, specialization, attorney_phone, address, office_number)
values 
    ('Adam', 'A', 'Adams', 'Corporate', '1111111111', '123 Baltimore St, Baltimore, MD', '111'),
    ('Bobby', 'B', 'Bobs', 'Patent', '2222222222', '321 Baltimore St, Baltimore, MD', '112'),
    ('Chris', 'C', 'Christopher', 'Accident', '3333333333', '213 Baltimore St, Baltimore, MD', '113'),
    ('Davis', 'D', 'Davis', 'Corporate', '4444444444', '312 Baltimore St, Baltimore, MD', '114'),
	('Erick', 'E', 'Ericks', 'Patent', '5555555555', '123 St. Paul St, Baltimore, MD', '115'),
    ('Faith', 'F', 'Feathers', 'Contract', '6666666666', '321 St. Paul St, Baltimore, MD', '116'), 
    ('Greg', 'G', 'Gregory', 'Small Business', '7777777777', '456 St. Paul St, Baltimore, MD', '117'), 
    ('Heather', 'H', 'Hurts', 'Trademark', '8888888888', '789 Orleans St, Baltimore, MD', '118'), 
    ('Ines', 'I', 'Iverson', 'Securities', '9999999999', '987 Orleans St, Baltimore, MD', '119'),
    ('Jackie', 'J', 'Jackson', 'Contract', '1234567890', '555 Baltimore St, Baltimore, MD', '120');

insert into client (client_name, phone, client_type, address, attorney) 
values 
	('Ford Motor Company', '123456789', 'Corporate',  '1 American Road, Michigan Ave, Dearborn, MI', 1),
    ('Kyle Keller', '987654321', 'Individual', '1 Boton St, Baltimore, MD', 10),
    ('Baltimore City Public Schools', '443984200', 'Corporate', '200 E. North Ave, Baltimore, MD', 2);
    
insert into court (name, address) 
values 
	('Circuit Court of Baltimore County', '401 Bosley Ave, Towson, MD'),
    ('Baltimore City Circuit Court', '111 N Calvert St, Baltimore, MD');
    
insert into legal_document (date_created)
values 
	('2024-05-11'),
    ('2024-05-10'),
    ('2024-01-04'),
    ('2023-12-30');
    
insert into billing (date_issued, payment_status, amount, billable_hours, client)
values
	('2024-02-21', 'Draft', '30000.95', '40', 1), 
    ('2024-01-02', 'Paid', '50000.00', '50', 1),
    ('2023-01-04', 'Overdue', '1500.39', '14.5', 2),
    ('2024-04-24', 'Partial', '5312.40', '20', 3);
    
    
insert into client_case (case_status, date_filed, case_type, court, attorney, billing, legal_document)
values
	('Pending', '2023-12-01', 'Contract Dispute', 1, 1, 1, 1),
	('In-Progress', '2023-12-01', 'Intellectual Property', 2, 2, 2, 2),
    ('Complete', '2024-01-01', 'Fraud', 1, 6, 4, 3);

-- Add the foreign key constraints on each of the tables created
alter table client
add foreign key (attorney) references attorney(attorney_id);

alter table billing
add foreign key (client) references client(client_id);

alter table client_case 
add foreign key (attorney) references attorney(attorney_id),
add foreign key (billing) references billing(invoice_number),
add foreign key (court) references court(court_id), 
add foreign key (legal_document) references legal_document(document_id) ;