-- Search the students who are studying in ME and their level is 2. If there are no students in the given major and level, it displays an error message. Otherwise, it loops through the students and displays their names.

set serveroutput on;

DECLARE
  v_major CHAR(3);
  v_slevel CHAR(1);
  v_count INT;
  v_sname VARCHAR2(30);
BEGIN
  -- Set the values for the major and student level
  v_major := 'ME';
  v_slevel := '2';

  -- Select all students in the given major and level
  SELECT COUNT(*) INTO v_count
  FROM STUDENT
  WHERE major = v_major AND slevel = v_slevel;

  -- If there are no students in the given major and level,
  -- then display an error message
  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('There are no students in the given major and level');
  ELSE
    -- Otherwise, loop through the students and display their names
    FOR i IN (SELECT sname FROM STUDENT WHERE major = v_major AND slevel = v_slevel) LOOP
      v_sname := i.sname;
      DBMS_OUTPUT.PUT_LINE('Student name: ' || v_sname);
    END LOOP;
  END IF;
END;

/