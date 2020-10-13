/*
# 서브쿼리
- 사용법은 () 안에 명시한다, 서브쿼리의 리턴행이 1줄 이하여야 한다
- 서브쿼리절을 먼저 해석하면 된다.

# 단일행 서브쿼리
- 서브쿼리절의 결과가 한 행이 나오는 것
*/

SELECT salary FROM employees WHERE first_name = 'Nancy'; --낸시의 급여

SELECT * 
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Nancy');
--> 낸시보다 급여가 많은 사람들


--employee_id가 103인 사람의 job_id와 동일한 사람을 찾아라
SELECT job_id FROM employees WHERE employee_id = 103; --단일행 조건

SELECT * FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 103);


-- 서브쿼리의 리턴행이 여러개라면 일반 비교연산으로는 구분할 수 없다
SELECT job_id FROM employees WHERE job_id = 'IT_PROG'; --리턴행이 여러개

SELECT * 
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE job_id = 'IT_PROG'); -->다중행이 들어간 서브쿼리문


































