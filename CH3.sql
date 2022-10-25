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

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000;




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

