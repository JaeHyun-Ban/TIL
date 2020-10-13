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
SELECT department_id, SUM(salary) FROM employees WHERE salary >= 5000 GROUP BY department_id;-->그룹 전 where절의 조건에 맞는것을 먼저 추출
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;

-- GROUP BY절의 조건 HAVING
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id HAVING SUM(salary) >= 100000; --그룸화 후 의 조건을 가지고 추출

-- 20명 이상인 job_id를 구하시오
SELECT job_id, COUNT(*)
FROM employees GROUP BY job_id HAVING COUNT(*) >= 20;

-- 부서 아이디가 50이상인 사람을 그룹화시키고, 그룹 급여 5000이상만 조회.
SELECT department_id, COUNT(*), trunc(AVG(salary))
FROM employees 
WHERE department_id >= 50 
GROUP BY department_id 
HAVING TRUNC(AVG(salary)) >= 5000;

---------------연습 문제----------------------------
--문제 1.
--사원 테이블에서 JOB_ID별 사원 수를 구하세요.
SELECT job_id, COUNT(*)
FROM employees GROUP BY job_id;
--사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요
SELECT job_id, trunc(AVG(salary)) as 평균급여
FROM employees GROUP BY job_id ORDER BY 평균급여 DESC;


--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.
-- 날짜 -> 문자로 변경
SELECT SUM(COUNT(*)) AS "2004" FROM employees WHERE hire_date LIKE'04%' GROUP BY hire_date
UNION ALL
SELECT SUM(COUNT(*)) AS "2005" FROM employees WHERE hire_date LIKE'05%' GROUP BY hire_date;
-------------------------------------------------------------------
SELECT to_char(hire_date, 'YY') as 년도, COUNT(*) as 수--연도만
FROM employees
GROUP BY to_char(hire_date, 'YY') ORDER BY to_char(hire_date, 'YY') ASC;


--문제 3.
--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력
SELECT department_id, COUNT(*), trunc(AVG(salary))
FROM employees 
WHERE salary >= 1000 
GROUP BY department_id 
HAVING trunc(AVG(salary)) >= 2000 
ORDER BY department_id ASC;

--문제 4.
--사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
SELECT department_id as 부서ID, trunc(AVG(salary + salary * commission_pct), 2) as 평균, sum(salary) as 합계, COUNT(*) AS 수
FROM employees 
WHERE commission_pct IS NOT NULL 
GROUP BY department_id;


SELECT department_id
FROM employees;

































