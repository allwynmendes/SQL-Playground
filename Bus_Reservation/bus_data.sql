--Buses
insert into buses values('MH01AK47',40,'1','SEATER');
insert into buses values('MH12DB1112',40,'0','SLEEPER');
insert into buses values('GA03AE4318',30,'1','SEMI-SLEEPER');

--Bus_Company
insert into bus_company values(1,'NEETA','neeta123');
insert into bus_company values(2,'VRL','vrl123');
insert into bus_company values(3,'KONDUSKAR','kondu123');

--Bus_owners
insert into bus_owners values(1,'MH12DB1112');
insert into bus_owners values(1,'MH01AK47');
insert into bus_owners values(2,'GA03AE4318');

--Bus_location
insert into bus_location values('MH12DB1112', '18.496753, 73.857216', sysdate);
insert into bus_location values('MH01AK47', '19.110482, 72.872888', sysdate);
insert into bus_location values('GA03AE4318','15.906560, 73.823572',sysdate-1);
