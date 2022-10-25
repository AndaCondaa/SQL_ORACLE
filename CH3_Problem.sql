--1.직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금” 프로젝션 타이틀로 함께 출력해 보세요. 
--두 임금의 차이는 얼마인가요?  “최고임금 – 최저임금”이란 타이틀로 함께 출력해 보세요.

SELECT MAX(e.SALARY) "최고임금" , 
	   MIN(e.SALARY) "최저임금" ,
	   MAX(e.SALARY) - MIN(e.SALARY) "최고임금 - 최저임금" 
FROM EMPLOYEES e ;



--2.마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일

SELECT TO_CHAR(MAX(e.HIRE_DATE), 'YYYY"년" MM"월" DD"일"') 
FROM EMPLOYEES e;



--3.부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력 
--정렬순서는 부서번호(department_id) 내림차순입니다.

SELECT e.DEPARTMENT_ID "부서", 
	   avg(NVL(e.SALARY, 0)) "평균임금", 
	   MAX(e.SALARY) "최고임금", 
	   MIN(e.SALARY) "최저임금" 
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 
ORDER BY e.DEPARTMENT_ID DESC ;



--4.업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무(job_id)와 함께 출력
--정렬순서는 업무(job_id) 내림차순입니다.

SELECT e.JOB_ID , 
	   avg(nvl(e.SALARY, 0)) ,
	   MAX(e.SALARY) ,
	   MIN(e.SALARY) 
FROM EMPLOYEES e 
GROUP BY e.JOB_ID
ORDER BY e.JOB_ID desc;



--6.평균임금과 최저임금의 차이가 2000 미만인 
--부서(department_id), 평균임금, 최저임금 ,(평균임금 – 최저임금)를 
--(평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요

SELECT e.DEPARTMENT_ID "부서",
	   AVG(NVL(e.SALARY, 0)) "평균임금",
	   MIN(e.SALARY) "최저임금",
	   AVG(NVL(e.SALARY, 0)) - MIN(e.SALARY) "(평균임금 - 최저임금)"
FROM EMPLOYEES e 
GROUP BY e.DEPARTMENT_ID 
HAVING (AVG(NVL(e.SALARY, 0)) - MIN(e.SALARY)) < 2000
ORDER BY AVG(NVL(e.SALARY, 0)) - MIN(e.SALARY) DESC ;
