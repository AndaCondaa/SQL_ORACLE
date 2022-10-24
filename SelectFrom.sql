--SELECT/FROM 절


--사원의 이름(fisrt_name)과 전화번호, 입사일, 연봉(급여)을 출력하세요.
SELECT first_name, PHONE_NUMBER, HIRE_DATE, SALARY 
from employees;

--사원의 이름(first_name)과 성(last_name), 급여, 전화번호, 이메일, 입사일을 출력하세요
SELECT  e.FIRST_NAME ,
		e.LAST_NAME ,
		e.SALARY ,
		e.PHONE_NUMBER ,
		e.EMAIL ,
		e.HIRE_DATE 
FROM EMPLOYEES e; 

--컬럼에 별명 사용하기
--사원의 이름(fisrt_name)과 전화번호, 입사일, 급여 로 표시되도록 출력하세요
SELECT  e.FIRST_NAME "이름",
		e.LAST_NAME "성",
		e.SALARY "급여",
		e.PHONE_NUMBER "전화번호",
		e.EMAIL "이메일",
		e.HIRE_DATE "입사일"
FROM EMPLOYEES e; 

--연결연산자 ||
SELECT first_name || ' ' || last_name "name"
FROM employees;

SELECT first_name || ' hire date is ' || hire_date AS hire
FROM employees;

--산술 연산자 사용
SELECT first_name, salary, salary*12
FROM EMPLOYEES;

SELECT e.FIRST_NAME * 12	-- ERROR
FROM EMPLOYEES e ;		

--CONCAT
SELECT CONCAT('가나다가', '아자차카')
	, '가나다라' || '아자차카'
FROM DUAL; 