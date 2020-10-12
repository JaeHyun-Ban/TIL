--그룹 함수 AVG, MAX, MIN, SUM, COUNT
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary), COUNT(*) FROM employees;
SELECT department_id, SUM(salary) FROM employees; --행데이터 개수가 서로 다르다
SELECT COUNT(first_name)  FROM employees;
SELECT COUNT(commission_pct) FROM employees;

--그룹 함수는 일반컬럼과 동시에 사용이 불가능하다
SELECT department_id, SUM(salary)   FROM employees;

--GROUP BY절을 이용한 그룸핑 (GROUP BY절은 WHERE절 다음에 들어갑니다.)
SELECT department_id FROM employees GROUP BY department_id; --부서별로 묶음
SELECT department_id, SUM(salary), AVG(salary), COUNT(*) FROM employees GROUP BY department_id;

SELECT department_id, job_id FROM employees GROUP BY department_id;
-->GROUP BY절에 묶인 컬럼만 SELECT에 사용할 수 있다.

-- 2개 이상의 그룹화
SELECT * FROM employees;
SELECT department_id, job_id FROM employees GROUP BY department_id, job_id ORDER BY department_id;--부서별 job_id명
SELECT job_id, department_id FROM employees GROUP BY job_id, department_id ORDER BY job_id;--job_id별 부서명
-->순서대로 그룹화를 진행한다


--아래 두 구문은 결과가 다릅니다.
SELECT department_id, SUM(salary) FROM employees WHERE salary >= 5000 GROUP BY department_id;
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;

-- GROUP BY절의 조건 HAVING
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id HAVING SUM(salary) >= 100000;

-- 20명 이상인 job_id를 구하시오
SELECT job_id, COUNT(*)
FROM employees GROUP BY job_id HAVING COUNT(*) >= 20;


















