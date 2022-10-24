--WHERE 절
--조건을 추가하는 절




--**비교연산자 =
SELECT * 
FROM EMPLOYEES e
WHERE e.DEPARTMENT_ID = 30;

--급여가15000 이상인 사원들의 이름과 급여와 연봉을 출력하세요
SELECT * 
FROM EMPLOYEES e
WHERE e.SALARY >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
SELECT *
FROM EMPLOYEES e 
WHERE e.HIRE_DATE >= '2007-01-01';

SELECT TO_CHAR(e.HIRE_DATE, 'yy/mm/dd') 
FROM EMPLOYEES e 
WHERE e.HIRE_DATE >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
SELECT *
FROM EMPLOYEES e 
WHERE e.FIRST_NAME = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
SELECT FIRST_NAME , SALARY *12
FROM EMPLOYEES e 
WHERE e.SALARY >= 14000
AND SALARY <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
SELECT FIRST_NAME , SALARY *12
FROM EMPLOYEES e 
WHERE e.SALARY <= 14000
OR  SALARY >= 17000;		--결과?!?!? 예상했던 결과와 다름

--입사일이 04/01/01 에서 05/12/31 사이에 입사한 사원의 이름과 입사일을 출력하세요
SELECT *
FROM EMPLOYEES e 
WHERE e.HIRE_DATE >= '04/01/01'
AND e.HIRE_DATE <= '05/12/31';




--**BETWEEN 연산자
--1.작은 값을 앞에, 큰 값을 뒤에
--2.두 값을 모두 포함하는 결과를 출력(경계값을 포함) -> 경계값을 포함하지 않으려면 비교연산자 사용
--3.느린 연산자에 속함
--example
select first_name, salary
from employees
where salary >= 14000
and salary <= 17000;




--**IN 연산자
--example
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--급여가 2100, 3100, 4100, 5100 인 사원의 이름과 급여을 구하시오
select e.first_name, e.salary
from employees e
where e.SALARY  in (2100, 3100, 4100, 5100);




--**LIKE 연산자
--%: 임의의 길이의 문자열(공백 문자 가능)
--_: 한글자 길이
--example
select first_name, last_name, salary
from employees
where first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, last_name, salary
from employees
where first_name like '%am%';




--**NULL
--아무런 갑도 정해지지 않았음을 의미 -> 0이 아님
--어떠한 데이터 타입에도 사용가능
--not null이나 primary key 속성에는 사용할 수 없음
--null을 포함한 산술식은 무조건 null



--** is null / is not null 연산 (in ORACLE)
select first_name, salary, commission_pct
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary, commission_pct
from employees
where commission_pct is NOT null ;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select e.first_name
from employees e
where commission_pct IS NULL
AND e.MANAGER_ID IS null;
