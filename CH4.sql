--***1.SubQuery

--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
select employee_id, first_name, salary
from employees
where salary > (select salary
from employees
where first_name='Den');


--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
SELECT e.FIRST_NAME , e.SALARY , e.EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE salary = (SELECT min(SALARY)
				FROM EMPLOYEES);
	
			
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
SELECT e.FIRST_NAME, e.SALARY  
FROM EMPLOYEES e 
WHERE SALARY < (SELECT AVG(NVL(SALARY, 0))
FROM EMPLOYEES);


--각 부서별로 최고급여를 받는 사원을 출력하세요
SELECT DEPARTMENT_ID , MAX(SALARY) 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

SELECT e.DEPARTMENT_ID , e.FIRST_NAME 
FROM EMPLOYEES e
WHERE (e.DEPARTMENT_ID, e.SALARY) 
IN (SELECT DEPARTMENT_ID , max(SALARY) 
	FROM EMPLOYEES 
	GROUP BY DEPARTMENT_ID);



--각 부서별로 최고급여를 받는 사원을 출력하세요 –(테이블에서 조인)
SELECT DEPARTMENT_ID , max(SALARY) 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID;

SELECT 
	e.DEPARTMENT_ID , 
	s.salary "MAX_SALARY" , 
	e.FIRST_NAME 
FROM 
	EMPLOYEES e , 
	(SELECT DEPARTMENT_ID , max(SALARY) SALARY  
	 FROM EMPLOYEES 
	 GROUP BY DEPARTMENT_ID) s
WHERE e.DEPARTMENT_ID = s.DEPARTMENT_ID
AND e.SALARY = s.salary;






--***2.rownum
select 
	rownum,
	first_name,
	salary
from 
	(select first_name,
	 	 	 salary
	 from employees
	 order by salary DESC
	) ;

