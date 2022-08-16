SELECT * FROM employees;

--# 집합연산자 union(합집합, 중복x), union all(합집합, 중복o)
--집합 연산자 사용시에는 컬럼개수를 동일하게 맞춰야 한다
-- union
SELECT employee_id, first_name, hire_date FROM employees WHERE hire_date LIKE '04%' --04년 입사자
UNION -- 중복x인 합집합을 구해준다
SELECT employee_id, first_name, hire_date FROM employees WHERE department_id = 20;

-- union all
SELECT employee_id, first_name, hire_date FROM employees WHERE hire_date LIKE '04%' --04년 입사자
UNION ALL -- 중복o인 합집합을 구한다
SELECT employee_id, first_name, hire_date FROM employees WHERE department_id = 20;

-----------------------------------------------------------------------------
--# intersect - 교집합, minus - 차집합
--intersect
SELECT employee_id, first_name, hire_date FROM employees WHERE hire_date LIKE '04%' --04년 입사자
INTERSECT --교집합
SELECT employee_id, first_name, hire_date FROM employees WHERE department_id = 20;
--minus
SELECT employee_id, first_name, hire_date FROM employees WHERE hire_date LIKE '04%' --04년 입사자
MINUS -- 차집합
SELECT employee_id, first_name, hire_date FROM employees WHERE department_id = 20;

-- union all을 이용한 더미데이터 만들기
SELECT '홍길동' as name, '20200211' as year FROM dual UNION ALL
SELECT '이순신', '20200321' FROM dual UNION ALL
SELECT '김유신', '20190202' FROM dual UNION ALL
SELECT '김유신', '20190231' FROM dual;
























