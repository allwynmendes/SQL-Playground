set serveroutput on;


DECLARE
---Declare super(root) block variables first and then define procedures below the variables
    ch number;
	procedure cal_total_sal is
	BEGIN
		dbms_output.put_line('Entered cal_total_sal');
	END cal_total_sal;
	
	procedure cal_avg_sal is
	BEGIN
		dbms_output.put_line('Entered cal_avg_sal');
	END cal_avg_sal;
	
	procedure cal_min_sal is
	BEGIN
		dbms_output.put_line('Entered cal_min_sal');
	END cal_min_sal;
	
	procedure cal_max_sal is
	BEGIN
		dbms_output.put_line('Entered cal_max_sal');
	END cal_max_sal;
	
BEGIN
	dbms_output.put_line('Select appropriate option : ');
	dbms_output.put_line('TOTAL');
	dbms_output.put_line('AVERAGE');
	dbms_output.put_line('MIN');
	dbms_output.put_line('MAX');
	ch := &ch;
	
	case ch
		when 1 then cal_total_sal;
		when 2 then cal_avg_sal;
		when 3 then cal_min_sal;
		when 4 then cal_max_sal;
	end case;
	
END;