DECLARE
v_empno employees.employee_id%TYPE ;
v_name employees.first_name%TYPE ;
v_sal employees.salary%TYPE ;
v_hire_date employees.hire_date%TYPE ;
BEGIN
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, hire_date
INTO v_empno, v_name, v_sal, v_hire_date
FROM EMPLOYEES
WHERE employee_id = :empno;
dbms_output.put_line(v_empno||' '||v_name||' '||v_sal||' '||v_hire_date);
END;


SELECT EMPLOYEE_ID , FIRST_NAME , SALARY , HIRE_DATE 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = :empno;




DECLARE
v_no1 NUMBER := :no1 ;
v_no2 NUMBER := :no2 ;
v_sum NUMBER ;
BEGIN
	v_sum := v_no1 + v_no2 ;
	DBMS_OUTPUT.PUT_LINE('첫번째 수: '||v_no1||', 두번째 수 : '||v_no2||' , 합은 : '||v_sum||' 입니다');
END;




CREATE OR REPLACE FUNCTION HR.FC_UPDATE_SALARY(V_EMPNO IN NUMBER)
RETURN NUMBER
AS	
	PRAGMA AUTONOMOUS_TRANSACTION;
	V_SALARY EMPLOYEES.SALARY%TYPE;
BEGIN
	UPDATE EMPLOYEES 
	SET SALARY = SALARY * 1.1
	WHERE EMPLOYEE_ID = V_EMPNO;
	COMMIT;
	SELECT SALARY 
	INTO V_SALARY
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = V_EMPNO;
	RETURN V_SALARY;
END;

SELECT * FROM EMPLOYEES e WHERE e.EMPLOYEE_ID = 114;
SELECT FC_UPDATE_SALARY(114) FROM dual;





create or replace PROCEDURE PRINT_EMP( v_input employees.EMPLOYEE_ID%TYPE )
IS
	v_row   employees%ROWTYPE;
BEGIN
	SELECT employee_id,  first_name, salary, department_id
	INTO    v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = v_input;

	dbms_output.put_line
	( v_row.employee_id||' '||v_row.first_name||' '||v_row.salary||' '||v_row.department_id);
END PRINT_EMP;

call PRINT_EMP(114);



/*
CREATE OR REPLACE procedure HR.rowtype_test
(p_empno in employees.employee_id%TYPE )
is
    v_emp employees%ROWTYPE;
begin 
    dbms_output.enable;

    select employee_id, first_name, hire_date
    into   v_emp.employee_id, v_emp.first_name,v_emp.hire_date
    FROM   employees
    where  employee_id = p_empno;

    DBMS_OUTPUT.PUT_LINE('EMP NO : '||v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('EMP NAME : '||v_emp.first_name);
    DBMS_OUTPUT.PUT_LINE('EMP HIRE : '||v_emp.hire_date);
end;
*/

call rowtype_test(114);



/*
CREATE OR REPLACE PROCEDURE HR.TABLE_TEST
(v_deptno IN employees.DEPARTMENT_ID %TYPE)
AS	
	PRAGMA AUTONOMOUS_TRANSACTION;
IS
	-- 테이블의 선언
	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
	TYPE sal_table   	IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;

	-- 테이블타입으로 변수 선언
	empno_tab empno_table ; 
	ename_tab ename_table ; 
	sal_tab   sal_table;
	i BINARY_INTEGER := 0;
BEGIN   
	DBMS_OUTPUT.ENABLE;

	-- FOR 루프 사용
                 -- 여기서 emp_list는 ( BINARY_INTEGER형 변수로) 1씩 증가
	FOR emp_list IN ( SELECT employee_id, first_name, salary
		        FROM employees 
		      WHERE department_id = v_deptno ) LOOP
	      i := i + 1;
	      -- 테이블 변수에 검색된 결과를 넣는다
		empno_tab(i) := emp_list.employee_id ;
		ename_tab(i) := emp_list.first_name ;
		sal_tab(i) := emp_list.salary ;
	END LOOP;
	
	-- 1부터 i까지 FOR 문을 실행
	FOR cnt IN 1..i LOOP
		-- TABLE변수에 넣은 값을 뿌려줌
		DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) ); 
		DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));
	END LOOP; 
END TABLE_TEST;
*/

call TABLE_TEST(100);



/*
CREATE OR REPLACE PROCEDURE HR.RECORD_TEST(
p_eno IN employees.EMPLOYEE_ID%TYPE )
IS
	TYPE emp_record IS RECORD
	( v_eno NUMBER, 
	  v_nm  varchar2(30),
	  v_hdate DATE );
	
	emp_rec emp_record;
BEGIN
	DBMS_OUTPUT.ENABLE;
	
	SELECT e.EMPLOYEE_ID , 
	       e.FIRST_NAME||' '||e.LAST_NAME,
	       e.HIRE_DATE 
	INTO emp_rec.v_eno,
		 emp_rec.v_nm,
		 emp_rec.v_hdate
	FROM EMPLOYEES e 
	WHERE e.EMPLOYEE_ID = p_eno;

	DBMS_OUTPUT.PUT_LINE('사원 번호 :'|| emp_rec.v_eno);
	DBMS_OUTPUT.PUT_LINE('사원 이름 :'|| emp_rec.v_nm);
	DBMS_OUTPUT.PUT_LINE('입 사 일 :'|| emp_rec.v_hdate);
END RECORD_TEST;
*/

CALL record_test(100);



/*
CREATE OR REPLACE PROCEDURE UPDATE_TEST
( v_empno IN employees.EMPLOYEE_ID%TYPE,			-- 급여를 수정한 사원의 사번
  v_sal  IN employees.SALARY%TYPE )				-- 수정할 급여
IS
	-- 수정 데이터를 확인하기 위한 변수 선언
	v_emp employees%ROWTYPE;
BEGIN DBMS_OUTPUT.ENABLE;
	-- 급여 수정
	UPDATE EMPLOYEES 
	SET salary = v_sal
	WHERE EMPLOYEE_ID = v_empno;

	COMMIT;

	DBMS_OUTPUT.PUT_LINE('Data Update Success');

-- 수정된 데이터 확인하기 위해 검색
	SELECT employee_id, last_name, salary
	INTO v_emp.employee_id, v_emp.last_name, v_emp.salary
	FROM EMPLOYEES 
	WHERE employee_id = v_empno;
	DBMS_OUTPUT.PUT_LINE(' **** Confirm Update Data ****');
	DBMS_OUTPUT.PUT_LINE('EMP NO : ' || v_emp.employee_id);
	DBMS_OUTPUT.PUT_LINE('EMP NAME : ' || v_emp.last_name);
	DBMS_OUTPUT.PUT_LINE('EMP SALARY : ' || v_emp.salary);
END UPDATE_TEST; 
*/

CALL UPDATE_TEST(100, 24001);

