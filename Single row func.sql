--**단일행 함수
--각각의 데이터를 한건씩 처리
--복수행 함수 : 여러건의 데이터를 한꺼번에 처리 후 1개의 결과로 처리 -> 그룹함수, 집계함수 라고도 불림

--example-> substr
select first_name, substr(first_name,1,3), substr(first_name,-3,2)
from employees
where department_id = 100;

--example -> LPAD
select first_name,
lpad(first_name,10,'*'),
rpad(first_name,10,'*')
from employees;

--example -> replace
select first_name,
replace(first_name, 'a', '*'),
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--날짜함수
SELECT sysdate FROM dual;

--날짜 변환
select sysdate,
to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select sysdate,
to_char(sysdate, 'YYYY"년"-MM"월"-DD"일" HH24"시":MI"분":SS"초"')
from dual;


--***NVL함수
--NVL(컬럼명, null일 때의 값)
--NVL2(컬럼명, null이 아닐 때의 값, null 일 때의 값)
select commission_pct, nvl2(commission_pct, 100, 0)
from employees;
