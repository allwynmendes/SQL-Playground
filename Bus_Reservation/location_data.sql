--States
insert into states values('MH', 'Maharashtra');
insert into states values('GA', 'Goa');
insert into states values('KA', 'Karnataka');

--Location
insert into location values('12', 'MH', 'Pune');
insert into location values('10',  'MH', 'Sangli');
insert into location values('01', 'MH' ,'Mumbai');

insert into location values('03', 'GA', 'Mapusa');
insert into location values('05', 'GA', 'Panjim');
insert into location values('07', 'GA', 'Margaon');

insert into location values('01', 'KA', 'Bangalore');
insert into location values('22', 'KA', 'Belgaum');
insert into location values('09', 'KA', 'Mysore');

--Sub_location
insert into sub_location values(1, 'Kothrud', 'MH12');
insert into sub_location values(2, 'Swargate', 'MH12');
insert into sub_location values(3, 'Pune Station', 'MH12');
insert into sub_location values(4, 'Kadegoan', 'MH10');
insert into sub_location values(5, 'Isalampur', 'MH10');
insert into sub_location values(6, 'Vita', 'MH10');
insert into sub_location values(7, 'Andheri', 'MH01');
insert into sub_location values(8, 'Bandra', 'MH01');
insert into sub_location values(9, 'Worli', 'MH01');

--Buses
insert into buses values('MH01AK47',40,'1','SEATER');
insert into buses values('MH12DB1112',40,'0','SLEEPER');
insert into buses values('GA03AE4318',30,'1','SEMI-SLEEPER');
