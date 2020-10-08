SELECT *
FROM employees;

-- #행제한 WHERE절 BETWEEN, IN, LIKE
SELECT first_name, last_name
FROM employees
WHERE job_id = 'IT_PROG';

--선택 모두 + 직원 중 last_name이 king인 데이터
SELECT *
FROM employees
WHERE last_name = 'King';

--선택 모두 직원 중 department_id가 90인 데이터
SELECT *
FROM employees
WHERE department_id = 90;

-- 선택 모두 직원 중 salary가 15000보다 크거나 같은 데이터
SELECT *
FROM employees
WHERE salary >= 15000; 

SELECT *
FROM employees
WHERE salary <> 15000;

SELECT *
FROM employees
WHERE hire_date = '04/01/30';

------------------------------------------------------------
--#BETWEEN 연산자

--선택 모두 + 직원 중 + salary에서 + 10000이상 12000이하 인 데이터
SELECT *
FROM employees WHERE salary between 10000 and 12000;

SELECT *
FROM employees WHERE salary >= 10000 and salary <= 12000;

--선택 모두 + 직원 중 + hire_date에서 03/01/01 ~ 03/12/31 사이인 데이터
SELECT *
FROM employees WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

------------------------------------------------------------
--#IN 연산자(목록의 특정값을 비교할 때 사용)
--magaher_id가 100,101,102 를 포함한 데이터
SELECT *
FROM employees WHERE manager_id IN(100,101,102);

--job_id가 AD_VP, FI_MGR, SA_MAN 를 포함한 데이터
SELECT *
FROM employees WHERE job_id in('AD_VP', 'FI_MGR', 'SA_MAN');

------------------------------------------------------------
--#LIKE 연산자 - 검색 조건을 추가할 때
--`%`는 모든, `_`는 데이터의 위치를 찾아낼 때 사용
SELECT first_name ||' '|| last_name, hire_date
FROM employees WHERE hire_date LIKE '03%'; --03으로 시작하는 hire_date 모두

SELECT first_name ||' '|| last_name, hire_date
FROM employees WHERE hire_date LIKE '%15'; --15로 끝난 hire_date의 name + hiredate 

SELECT first_name ||' '|| last_name, hire_date
FROM employees WHERE hire_date LIKE '%05%'; --05가 포함된 데이터

SELECT first_name ||' '|| last_name, hire_date
FROM employees WHERE hire_date LIKE '___05%'; --05월인 데이터만 `_`를 3개 넣어 칸의 위치를 지정함

SELECT first_name ||' '|| last_name, hire_date
FROM employees WHERE hire_date LIKE '_A%';

------------------------------------------------------------
--#IS NULL, IS NOT NULL (NULL값 조회)
SELECT * FROM employees WHERE manager_id IS NULL; -- manager_id가 null인 사람(매니저가 없다? -> 사장)
SELECT * FROM employees WHERE commission_pct is NULL; --commission_pct가 null인 사람
SELECT * FROM employees WHERE commission_pct is not null; 

------------------------------------------------------------
--#AND, OR 
--AND와 OR 가 함께 쓰이면 ADN가 먼저 계산이 된다
SELECT department_id, salary
FROM employees WHERE department_id = 100 AND salary >= 5000;

--소괄호의 존재에 따른 결과의 차이 확인
SELECT * FROM employees WHERE job_id = 'IT_PROG' OR job_id = 'FI_MGR' AND salary >= 6000; --AND조건이 먼저 적용된 후 OR를 계산한다
SELECT * FROM employees WHERE (job_id = 'IT_PROG' OR job_id = 'FR_MGR') AND salary >= 6000; -- OR에 소괄호를 사용해 조건을 등록한다.

------------------------------------------------------------
--#데이터 정렬 ORDER BY - (SELECT 구문의 가장 마지막에 쓴다)
SELECT * FROM employees ORDER BY hire_date ASC; --hire_date로 정렬 + 오름차순
SELECT * FROM employees ORDER BY hire_date DESC; --hire_date로 정렬 + 내림차순
SELECT * FROM employees WHERE job_id = 'IT_PROG' ORDER BY first_name ASC;
SELECT * FROM employees WHERE salary >= 5000;

--ALIAS도 ORDER BY 절에 적용할 수 있다.
SELECT first_name, salary * 12 AS PAY FROM employees ORDER BY PAY ASC;


























