--***1.그룹함수

--count() -> ASTERISK는 NULL포함, 컬럼명을 넣으면 NULL 포함XX
SELECT count(*), count(commission_pct)
FROM EMPLOYEES;

--sum()
SELECT count(*), sum(salary)
FROM EMPLOYEES ;

--avg()
SELECT count(*), sum(e.SALARY), avg(nvl(e.SALARY, 0))
FROM EMPLOYEES e;





--***2.GROUP BY

--부서별 평균
SELECT e.DEPARTMENT_ID , avg(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID ;

--GROUP BY 절에 참여한 컬럼이나 그룹함수만 SELECT절에 올 수 있음.
SELECT e.DEPARTMENT_ID , e.JOB_ID , avg(e.SALARY)
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID , e.JOB_ID
ORDER BY e.DEPARTMENT_ID ;

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력

--오류
select department_id, count(*), sum(salary)
from employees
--where sum(salary) > 20000  --WHERE절에는 그룹함수를 쓸 수 없음
group by department_id;




--***3.HAVING 절
--HAVING절에는 그룹함수와 GROUP BY에 참여한 컬럼만 사용할 수 있다.
SELECT  department_id, count(*), sum(salary)
FROM employees
GROUP BY department_id
HAVING sum(salary) > 20000;




--***4.CASE~END 문

SELECT 
	employee_id,
	salary,
	CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
		 WHEN job_id = 'AC_MGR' THEN salary + salary *0.2
		 ELSE salary
	END salary 
FROM employees;


--직원의 이름, 부서, 팀을 출력하세요
--팀은 부서코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
SELECT 
	e.LAST_NAME "이름",
	e.DEPARTMENT_ID "부서",
	CASE WHEN e.DEPARTMENT_ID BETWEEN 10 AND 50 THEN 'A-TEAM'
		 WHEN e.DEPARTMENT_ID BETWEEN 60 AND 100 THEN 'B-TEAM'
		 WHEN e.DEPARTMENT_ID BETWEEN 110 AND 150 THEN 'C-TEAM'
		 ELSE '팀 없음'
	END "팀" 
FROM EMPLOYEES e ;






--***5.JOIN
--JOIN하지 않고 두 테이블을 나열
--컬럼수를 곱한 만큼 출력됨
select first_name, department_name
from employees, departments;




--*5-1.EQUL JOIN
select first_name, em.department_id,
	   department_name, de.department_id
from employees em, departments de
where em.department_id = de.department_id;


--직원의 이름, 직급명칭을 출력하세요
SELECT e.FIRST_NAME , j.JOB_TITLE 
FROM EMPLOYEES e , JOBS j 
WHERE e.JOB_ID = j.JOB_ID ;


--모든 직원이름, 부서이름, 업무명 을 출력하세요
SELECT e.LAST_NAME , d.DEPARTMENT_NAME , j.JOB_TITLE 
FROM EMPLOYEES e , DEPARTMENTS d , JOBS j 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND e.JOB_ID = j.JOB_ID ;

--recursive join
Select emp.FIRST_NAME , mgr.FIRST_NAME 
From employees emp, employees mgr
Where emp.manager_id = mgr.employee_id;









--*5-2.OUTER JOIN


--LEFT OUTER JOIN
SELECT emp.FIRST_NAME , mgr.FIRST_NAME 
FROM employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id (+);  --Oracle에서는 (+)로 NULL 포함 가능

SELECT emp.FIRST_NAME , mgr.FIRST_NAME 
FROM employees emp LEFT OUTER JOIN employees mgr
ON emp.manager_id = mgr.employee_id ;



--RIGHT OUTER JOIN
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e RIGHT OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

SELECT e.DEPARTMENT_ID , e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e ,DEPARTMENTS d 
WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID ;



--FULL OUTER JOIN
SELECT e.DEPARTMENT_ID , e.FIRST_NAME , d.DEPARTMENT_NAME 
FROM EMPLOYEES e FULL OUTER JOIN DEPARTMENTS d 
ON	e.DEPARTMENT_ID = d.DEPARTMENT_ID ; 


