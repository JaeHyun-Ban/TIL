SELECT * FROM employees;

--가상 테이블 - dual 
SELECT '안녕', 'ㅇㅇ' FROM dual; -->> 함수나 현재 시간을 미리 실험해보는 용도로 사용한다

--# lower(소문자), upper(대문자), initcap(첫글자대문자)
SELECT 'abcDEF', LOWER('abcDEF'), UPPER('abcDEF'), INITCAP('abcDEF') 
FROM dual;

SELECT last_name, LOWER(last_name), UPPER(last_name), INITCAP(last_name)
FROM employees;

SELECT last_name
FROM employees WHERE LOWER(last_name) = 'bull';
--> WHERE 조건에도 함수의 적용이 가능하다.
-----------------------------------------------------------------------------------------------------
-- # length(): 길이. instr: 문자검색
SELECT first_name, LENGTH(first_name) as 문자의길이, INSTR(first_name, 'a') as 포함위치
FROM employees;

SELECT LENGTH('abc'), INSTR('abcdefg', 'a') FROM dual;

-----------------------------------------------------------------------------------------------------
-- #substr(): 문자열 자르기, concat(): 문자열 붙이기
SELECT SUBSTR('abcdef',1,3) as 지정한범위문자열자르기, CONCAT('abc', 'def') as 문자열붙이기
FROM dual;

SELECT first_name, SUBSTR(first_name, 1, 3) 
from employees;

SELECT FIRST_NAME, SUBSTR(first_name, 1, 3), CONCAT(first_name, last_name)
FROM employees;

-----------------------------------------------------------------------------------------------------
-- # LPAD, RPAD: 좌우측 지정문자열로 채우기
SELECT lpad('abc', 10, '*')
FROM dual; -->기존의 문자들은 없어지지 않는다

SELECT rpad('abc', 10, '*')
FROM dual;

SELECT LPAD(first_name, 10, '-'), RPAD(first_name, 10, '-')
FROM employees;

-----------------------------------------------------------------------------------------------------
-- #LTRIM, RTRIM, TRIM: 공백제거, 문자제거
SELECT ltrim('javascript_java', 'java') FROM dual; -->왼쪽에서 문자제거

SELECT rtrim('javascript_java', 'java')
FROM dual; -->오른쪽에서 문자 제거

SELECT trim('     java     ')
FROM dual; -->공백제거

-----------------------------------------------------------------------------------------------------
-- # REPLACE - 문자열 치환(중요)
SELECT REPLACE('my dream is president', 'president' , 'programmer')
FROM DUAL; -->(값, 단어1, 단어2) 값의 2문자를 3문자로 교체

SELECT LTRIM(REPLACE(REPLACE('my dream is president', 'president', 'programer'), ' ', ''), 'my')
FROM dual; -->한번 REPLACE 한 뒤 한번더 REPLACE를 할 수 있다. > 또 나온 결과값을 LTRIM으로 특정 단어를 지워준다.


-- 연습문제
--문제 1. EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
--조건 1) 비교하기 위한 값은 소문자로 입력해야 합니다.(힌트 : lower 이용)
--조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다.
-- 이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
--조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
-- 이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
SELECT 
    RPAD(SUBSTR(first_name,1, 3), LENGTH(first_name), '*') AS NAME,  --조건2
    LPAD(salary, 10, '*') AS salary, -- 조건3
    job_id
FROM employees WHERE LOWER(job_id) ='it_prog'; --조건1

--문제1
SELECT first_name||' '|| last_name as name, REPLACE(hire_date, '/', '') AS hire_date
FROM employees ORDER BY name ASC;


--문제2
SELECT REPLACE(phone_number, SUBSTR(phone_number, 1, 3), '02')
FROM employees;




  
















