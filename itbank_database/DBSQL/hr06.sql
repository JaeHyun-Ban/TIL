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
SELECT first_name, job_id FROM employees WHERE job_id = 'IT_PROG'; --리턴행이 여러개

SELECT * 
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE job_id = 'IT_PROG'); -->다중행이 들어간 서브쿼리문

-----------------------------------------------------------------------------------------------------------
--서브쿼리의 리턴 행이 여러개라면, 다중행 비교연산자를 사용하자
SELECT department_id FROM employees WHERE first_name = 'David'; -- 결과 3개
SELECT * FROM employees
WHERE department_id IN(SELECT department_id FROM employees WHERE first_name = 'David');

--David라는 이름인 사람의 급여(조건)
SELECT salary FROM employees WHERE first_name = 'David'; 

SELECT * FROM employees
WHERE salary IN(SELECT salary FROM employees WHERE first_name = 'David'); --조건과 급여가 같은 사람

-- 급여가 4800보다 큰 사람들
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE first_name = 'David'); --조건의 작은 급여보다 큰 사람

--급여가 9500보다 작은 사람들
SELECT * FROM employees
WHERE salary < ANY(SELECT salary FROM employees WHERE first_name = 'David'); -- 조건의 큰 급여보다 작은 사람

--급여가 9500보다 '큰' 사람들
SELECT * FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE first_name = 'David');

--급여가 4800보다 작은 사람들
SELECT * FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE first_name = 'David');


------------------------------------------------------------------
--# 스칼라 서브쿼리 (select절 안에 서브쿼리가 오는 것, left join과 같은 결과)
-->join과 비슷(잘못쓴다면 효율성이 join보다 떨어짐)
SELECT first_name, 
        (SELECT department_name 
        from departments d 
        WHERE d.department_id = e.department_id) --여기서 두개를 겹쳐주는것이 중요
        department_name
FROM employees e
ORDER BY first_name ASC;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT first_name,
          (SELECT department_name FROM departments d WHERE e.department_id = d.department_id) department_name         
FROM employees e
ORDER BY first_name ASC;

--위의 스칼라 서브쿼리와 같은 결과이다
SELECT first_name,
          department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY first_name;

----------------------------------------------------------------------------
--#인라인 뷰(FROM절에 서브쿼리가 온 것)★★★
SELECT ROWNUM, first_name, salary
FROM employees
WHERE ROWNUM <= 10
ORDER BY salary DESC; 


SELECT 
    ROWNUM,
    first_name,
    salary
FROM 
    (SELECT *
    FROM employees
    ORDER BY salary DESC)
WHERE ROWNUM >= 10 AND ROWNUM <= 20;
-->서브쿼리를 미리 정렬해 두면 좋고, 결과물 안에서 필요한 것만 추출해서 사용하면 된다.
-->rownum은 1번부터 순서대로 작성되지 않으면 조회가 불가능하다(중간만 추출은 불가능하다)

--위의 구문을 인라인뷰 형식으로 대입(테이블로 활용된다)
SELECT * 
FROM(
    SELECT 
        ROWNUM AS rn,
        first_name,
        email,
        hire_date,
        salary
    FROM 
        (SELECT *
        FROM employees
        ORDER BY salary DESC)
    )
WHERE rn > 10 and rn <= 50;
-->ROWNUM은 중간값만 추출이 불가능한데, 인라인뷰를 통해 테이블의 컬럼으로 활용해서
-->중간값만 뽑아서 사용할 수 있다(Alias를 이용한다).

--인라인 뷰 (03월01일 데이터만 추출)
--1. 가장 안쪽 SELECT절에서, 필요한 테이블 형식을 생성.
--2. 바깥 SELECT절에서 컬럼을 사용.
SELECT * 
FROM (
    SELECT 
        to_char(TO_DATE(test, 'YY/MM/DD'), 'MMDD') as mm, -->날짜 -> 문자 변경해서 월/일만 뽑아내기
        name
    FROM (
        SELECT '홍길동' as name, '20200211' as test FROM dual UNION ALL
        SELECT '이순신', '20200301' FROM dual UNION ALL
        SELECT '강감찬', '20200501' FROM dual UNION ALL
        SELECT '김유신', '20200226' FROM dual UNION ALL
        SELECT '이성계', '20200301' FROM dual)
        )
WHERE mm = '0301'; --> 인라인 뷰를 이용해서 다시 FROM문으로 넣어서 찾아낼 수 있다
--WHERE test LIKE '%0301'; -->이걸로 해도 되고
















