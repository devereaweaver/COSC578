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