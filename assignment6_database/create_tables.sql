-- Remove tables if they exists to recreate them:w
set foreign_key_checks = 0;
drop table if exists j;
drop table if exists p;
drop table if exists s;
drop table if exists spj;
set foreign_key_checks=1;

-- Create the tables 
create table j
(
    j_num varchar(2) not null,
    jname varchar(20),
    city varchar(20),
    primary key (j_num)
);

create table p 
(
    p_num varchar(2) not null,
    pname varchar(20), 
    color varchar(20),
    weight int,
    city varchar(20),
    primary key (p_num)
);

create table s
(
    s_num varchar(2) not null,
    s_name varchar(20), 
    status varchar(2),
    city varchar(20),
    primary key (s_num)
);

create table spj 
(
    s_num varchar(2) not null,
    p_num varchar(2) not null,
    j_num varchar(2) not null,
    qty int,
    primary key (s_num, p_num, j_num)
);

-- Populate data 
insert into j 
values 
    ('j1', 'Sorter', 'Paris'),
    ('j2', 'Punch', 'Rome'),
    ('j3', 'Reader', 'Athens'),
    ('j4', 'Console', 'Athens'),
    ('j5', 'Collator', 'London'),
    ('j6', 'Terminal', 'Oslo'),
    ('j7', 'Tape', 'London');

insert into p
values 
    ('p1', 'Nut', 'Red', 12, 'London'),
    ('p2', 'Bolt', 'Green', 17, 'Paris'),
    ('p3', 'Screw', 'Blue', 17, 'Rome'),
    ('p4', 'Screw', 'Red', 14, 'London'),
    ('p5', 'Cam', 'Blue', 12, 'Paris'),
    ('p6', 'Cog', 'Red', 19, 'London');

insert into s
values 
    ('s1', 'Smith', 20, 'London'),
    ('s2', 'Jones', 10, 'Paris'),
    ('s3', 'Blake', 30, 'Paris'),
    ('s4', 'Clarke', 20, 'London'),
    ('s5', 'Adams', 30, 'Athens');

insert into spj
values
    ('s1', 'p1', 'j1', 200),
    ('s1', 'p1', 'j4', 700),
    ('s2', 'p3', 'j1', 400),
    ('s2', 'p3', 'j2', 200),
    ('s2', 'p3', 'j3', 200),
    ('s2', 'p3', 'j4', 500),
    ('s2', 'p3', 'j5', 600),
    ('s2', 'p3', 'j6', 400),
    ('s2', 'p3', 'j7', 800),
    ('s2', 'p5', 'j2', 100),
    ('s3', 'p3', 'j1', 200),
    ('s3', 'p4', 'j2', 500),
    ('s4', 'p6', 'j3', 300),
    ('s4', 'p6', 'j7', 300),
    ('s5', 'p1', 'j4', 100),
    ('s5', 'p2', 'j2', 200),
    ('s5', 'p2', 'j4', 100),
    ('s5', 'p3', 'j4', 200),
    ('s5', 'p4', 'j4', 800),
    ('s5', 'p5', 'j4', 400),
    ('s5', 'p5', 'j5', 500),
    ('s5', 'p5', 'j7', 100),
    ('s5', 'p6', 'j2', 200),
    ('s5', 'p6', 'j4', 500);

-- Add foreign keys
alter table spj
add foreign key (s_num) references s(s_num),
add foreign key (p_num) references p(p_num), 
add foreign key (j_num) references j(j_num);