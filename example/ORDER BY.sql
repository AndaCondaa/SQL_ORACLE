--**ORDER BY
--정렬 
--asc: 기본값 - 오름차순
--desc: 내림차순

--example
SELECT e.first_name, e.salary
FROM EMPLOYEES e 
ORDER BY e.SALARY ;

--example
SELECT e.first_name, e.salary
FROM EMPLOYEES e 
ORDER BY 2 ;  --칼럼인덱스 1부터 시작!!!!!!!

--example
SELECT e.first_name, e.salary, e.DEPARTMENT_ID 
FROM EMPLOYEES e 
ORDER BY e.DEPARTMENT_ID ASC, 2 desc ; 


--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
SELECT e.DEPARTMENT_ID , e.salary, e.FIRST_NAME  
FROM EMPLOYEES e 
ORDER BY e.DEPARTMENT_ID ASC ; 

--급여가 5000 이상인 직원의 이름, 급여를 급여가 큰직원부터 출력하세요
SELECT e.FIRST_NAME, e.salary  
FROM EMPLOYEES e
WHERE e.SALARY >= 5000
ORDER BY e.SALARY DESC ; 

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호, 급여, 이름을 출력하세요
SELECT e.DEPARTMENT_ID "부서번호", e.salary "급여", e.FIRST_NAME "이름"  
FROM EMPLOYEES e
ORDER BY e.DEPARTMENT_ID , e.SALARY desc; 

