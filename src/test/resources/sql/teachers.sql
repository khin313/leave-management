insert into account (name, role, email, password) values ('Maung Maung', 'Teacher', 'mg@gmail.com', 'pass');
insert into account (name, role, email, password) values ('Aung Aung', 'Teacher', 'aung@gmail.com', 'pass');
insert into account (name, role, email, password) values ('Thidar', 'Teacher', 'thi@gmail.com', 'pass');

insert into teacher values (1, '09986547898', '2022-08-01');
insert into teacher values (2, '09956251558', '2022-09-1');
insert into teacher values (3, '09922598758', '2022-10-01');

insert into classes (teacher_id, start_date, months, description)
values (1,'2022-08-10',3,'Demo Java');
insert into classes (teacher_id, start_date, months, description)
values (1,'2022-09-10',3,'Demo Java');
insert into classes (teacher_id, start_date, months, description)
values (2,'2022-09-10',3,'Demo spring');
