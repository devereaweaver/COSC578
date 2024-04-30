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
    invoice_number int not null auto_increment,
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

-- Add the foreign key constraints on each of the tables created
alter table client
add foreign key (attorney) references attorney(attorney_id);

alter table billing
add foreign key (client) references client(client_id);

alter table client_case 
add foreign key (attorney) references attorney(attorney_id),
add foreign key (billing) references billing(invoice_number),
add foreign key (court) references court(court_id), 
add foreign key (legal_document) references legal_document(document_id);