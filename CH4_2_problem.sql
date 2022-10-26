--1.가장 늦게 입사한 직원의 이름과 연봉과 근무하는 부서이름은?

SELECT MAX(e.HIRE_DATE)  
FROM EMPLOYEES e;

SELECT e.FIRST_NAME, e.SALARY , d.DEPARTMENT_NAME , e.HIRE_DATE 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.HIRE_DATE = (SELECT MAX(e.HIRE_DATE) FROM EMPLOYEES e)
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID ;


--2.평균급여가 가장 높은 부서 직원들의
--직원번호, 이름, 성, 업무, 급여 조회하시오.

SELECT
	e.EMPLOYEE_ID ,
	e.LAST_NAME ,
	j.JOB_TITLE  ,
	e.SALARY ,
	s.sal
FROM 
	EMPLOYEES e , 
	JOBS j ,
	(SELECT DEPARTMENT_ID , AVG(NVL(SALARY, 0)) sal 
	 FROM EMPLOYEES 
	 GROUP BY DEPARTMENT_ID) s
WHERE e.JOB_ID = j.JOB_ID
AND e.DEPARTMENT_ID = s.DEPARTMENT_ID
AND s.sal = (SELECT MAX(avg_s) 
			 FROM (SELECT a.DEPARTMENT_ID dept, AVG(NVL(a.SALARY, 0)) avg_s 
	  			   FROM EMPLOYEES a 
      		       GROUP BY DEPARTMENT_ID)
);


--3.평균 급여가 가장 높은 부서
SELECT rownum , d.DEPARTMENT_NAME , s.sal
FROM 
	DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID dept, AVG(NVL(SALARY, 0)) sal
	 FROM EMPLOYEES 
	 GROUP BY DEPARTMENT_ID
	 ORDER BY 2 desc) s
WHERE d.DEPARTMENT_ID = s.dept
AND rownum = 1;


--4.평균 급여가 가장 높은 지역

SELECT 
	avg(SALARY) ,
	r.REGION_NAME 
FROM 
	EMPLOYEES e ,
	DEPARTMENTS d ,
	LOCATIONS l ,
	COUNTRIES c ,
	REGIONS r 
WHERE r.REGION_ID = c.REGION_ID 
AND   c.COUNTRY_ID = l.COUNTRY_ID 
AND   l.LOCATION_ID = d.LOCATION_ID 
AND   d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY r.REGION_NAME ;

SELECT r.REGION_NAME 
FROM 
	REGIONS r ,
	(SELECT 
			avg(SALARY) sal,
			r.REGION_NAME reg
	 FROM 
			EMPLOYEES e ,
			DEPARTMENTS d ,
			LOCATIONS l ,
			COUNTRIES c ,
			REGIONS r 
	 WHERE r.REGION_ID = c.REGION_ID 
	 AND   c.COUNTRY_ID = l.COUNTRY_ID 
	 AND   l.LOCATION_ID = d.LOCATION_ID 
	 AND   d.DEPARTMENT_ID = e.DEPARTMENT_ID
	 GROUP BY r.REGION_NAME
	 ORDER BY 1 desc) res
WHERE r.REGION_NAME = res.reg
AND rownum = 1;
	 