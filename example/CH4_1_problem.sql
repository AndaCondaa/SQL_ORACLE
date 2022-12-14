--3.각 업무별로 급여의 총합을 구하고자 한다.
--급여 총합이 가장 높은 업무부터 업무명과 급여 총합을 조회하시오

SELECT j.JOB_TITLE , s.salary
FROM
	JOBS j ,
	(SELECT JOB_ID , SUM(SALARY) SALARY 
	 FROM EMPLOYEES  	
 	 GROUP BY JOB_ID ) s
WHERE j.JOB_ID = s.job_ID
ORDER BY 2 DESC ;



--4.자신의 부서 평균 급여보다 급여가 많은 직원의
--직원번호, 성, 급여를 조회하시오.

SELECT DEPARTMENT_ID , AVG(NVL(SALARY, 0)) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ;

SELECT
	e.EMPLOYEE_ID ,
	e.LAST_NAME ,
	e.SALARY ,
	s.SALARY "부서평균"
FROM 
	EMPLOYEES e ,
	(SELECT DEPARTMENT_ID , AVG(NVL(SALARY, 0)) SALARY  
	FROM EMPLOYEES e 
	GROUP BY DEPARTMENT_ID) s
WHERE 
	e.DEPARTMENT_ID = s.DEPARTMENT_ID
AND e.SALARY > s.SALARY;