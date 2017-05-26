--Working with JSON Data in Oracle SQL


select * from tab;


create table json_documents(
    id raw(16) not null,
    data clob,
    constraint json_documents_pk primary key(id),
    constraint json_documents_json check (data is json(strict))
);


insert into json_documents(id, data) values (sys_guid(),
    '{
    "FirstName" : "John",
    "LastName" : "Doe",
    "Job" : "Clerk",
    "Active" : true
    }');
    
insert into json_documents(id, data) values (sys_guid(),
    '{
    "FirstName" : "Allwyn",
    "LastName" : "Mendes",
    "Job" : "PLSQL Developer",
    "Active" : true
    }');
    
insert into json_documents(id, data) values (sys_guid(),
    '{
    "FirstName" : "Rhea",
    "LastName" : "Rogers",
    "Job" : "Pop Star",
    "Hobbies" : ["Drawing",
                 "Planning", 
                 "Japanese"
                ],
    "Active" : false
    }');
    
select * from json_documents;


--Retrieve firstnames from json data
select jd1.data.FirstName from json_documents jd1;


--Get name of people who have hobbies
select jd1.data.FirstName, jd1.data.Hobbies from json_documents jd1 where jd1.data.Hobbies is not null;
