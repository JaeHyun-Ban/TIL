SELECT * FROM employees;

--인라인 뷰 quiz
--문제 1.
--EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 데이터를 출력 하세요 ( AVG(컬럼) 사용)
SELECT AVG(salary) FROM employees;  -- 사원들의 평균 급여

SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees) --평균급여를 서브쿼리로 생성 후 비교
ORDER BY salary DESC;

--EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 수를 출력하세요
SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들을 데이터를 출력하세요
SELECT AVG(salary)
FROM employees
WHERE job_id = 'IT_PROG'; -- job_id가 IT_PROG인 사원들의 평균급여

SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees WHERE job_id = 'IT_PROG')
ORDER BY salary ASC;


--문제 2.
--DEPARTMENTS테이블에서 manager_id가 100인 사람의 department_id와
--EMPLOYEES테이블에서 department_id가 일치하는 모든 사원의 정보를 검색하세요.
SELECT department_id
FROM departments
WHERE manager_id = 100; -- DEP에서 MANA_ID가 100인....

SELECT * 
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE manager_id = 100);


--문제 3.
--EMPLOYEES테이블에서 first_name=“Pat”의 manager_id보다 높은 manager_id를 갖는 모든 사원의 데이터를 출력하세요
SELECT manager_id
FROM employees
WHERE first_name = 'Pat'; -- 매니저id 추출

SELECT *
FROM employees
WHERE manager_id > (SELECT manager_id FROM employees WHERE first_name = 'Pat');

--EMPLOYEES테이블에서 “James”(2명)들의 manager_id와 갖는(->같은..?) 모든 사원의 데이터를 출력하세요.
SELECT manager_id
FROM employees
WHERE first_name = 'James'; -- 2명

SELECT *
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE first_name = 'James');


--문제 4.
--EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력하세요
SELECT *
FROM employees
ORDER BY first_name DESC; -- 이름으로 순서를 정렬한 데이터 - 1

SELECT 
    ROWNUM as rn,
    first_name
FROM 
    (SELECT *
    FROM employees
    ORDER BY first_name DESC); -- 1테이블에다 번호, 이름 추출 - 2

SELECT *
FROM 
    (SELECT 
        ROWNUM as rn,
        first_name
    FROM 
        (SELECT *
        FROM employees
        ORDER BY first_name DESC)
    )
WHERE rn > 40 AND rn < 51; --2결과 테이블에서 조건번호를 출력


--문제 5.
--EMPLOYEES테이블에서 hire_date기준으로 오름차순 정렬하고,
--31~40번째 데이터의 행 번호, 사원id, 이름, 번호(무슨번호? 휴대폰?),입사일을 출력하세요.
SELECT *
FROM employees
ORDER BY hire_date ASC; -- 오름차순 >1

SELECT
    ROWNUM as rn,
    employee_id,
    first_name,
    phone_number,
    hire_date
FROM 
    (SELECT *
    FROM employees
    ORDER BY hire_date ASC); -- 1 테이블에서 조건을 추출 > 2
    
SELECT *
FROM (
    SELECT
        ROWNUM as rn,
        employee_id,
        first_name,
        phone_number,
        hire_date
    FROM 
        (SELECT *
        FROM employees
        ORDER BY hire_date ASC)
    )
WHERE rn > 30 AND rn < 41; --2테이블에서 특정 번호 컬럼만 구해준다 (끝)

--문제 6.
--employees테이블 departments테이블을 left 조인하세요
--조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다.
--조건) 직원아이디 기준 오름차순 정렬
SELECT 
    e.employee_id as 직원아이디,
    concat(e.first_name, e.last_name) as 이름,
    d.department_id,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

--문제 7. ??
--문제 6의 결과를 (스칼라 쿼리)로 동일하게 조회하세요 >> 스칼라 = select에 서브쿼리
SELECT
    department_id
--    department_name
FROM departments d; --부서테이블 조건만 생성 >> 1
-->하나씩 2개 만들어야 하나?? >> 합쳐서 하면되긴한텐데 조건이랑 맞는지 모르겟당
SELECT
    department_name
FROM departments;

SELECT
    employee_id,
    CONCAT(first_name, last_name) AS 이름,
    (SELECT
        department_id
    FROM departments d
    WHERE d.department_id = e.department_id) 
    department_id,
    (SELECT
        department_name
    FROM departments d
    WHERE d.department_id = e.department_id)
    department_name
FROM employees e
ORDER BY employee_id ASC;

--문제 8.
--departments테이블 locations테이블을 left 조인하세요
--조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트 코드, 시티 만 출력합니다
--조건) 부서아이디 기준 오름차순 정렬
SELECT
    d.department_id as 부서아이디,
    d.department_name as 부서이름,
    d.manager_id as 매니저아이디,
    l.location_id as 로케이션아이디,
    l.street_address as 지번,
    l.postal_code,
    l.city
FROM departments d
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY department_id ASC;

--문제 9.
--문제 8의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
SELECT
    CONCAT(location_id, street_address, postal_code, city) as location
FROM locations;

SELECT
    department_id,
    department_name,
    manager_id,
    (SELECT
        location_id ||' '|| street_address ||' '|| postal_code ||' '|| city as locations
    FROM locations l
    WHERE l.location_id = d.location_id)
    location
FROM departments d   
ORDER BY department_id ASC; --locations쿼리를 다 이어서 했지만 따로하면 너무 길어질꺼같다....


--문제 10.
--locations테이블에 countries 테이블을 left 조인하세요
--조건) 로케이션아이디, 주소, 시티, country_id, country_name 만 출력합니다
--조건) country_name기준 오름차순 정렬
SELECT 
    l.location_id,
    l.street_address,
    l.city,
    c.country_id,
    c.country_name
FROM locations l
LEFT OUTER JOIN countries c
ON l.country_id = c.country_id
ORDER BY c.country_name ASC;

--문제 11.
--문제 10의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
SELECT l.location_id
FROM locations l;
SELECT street_address
FROM locations l;

SELECT
    l.location_id,
    l.street_address,
    l.city,
    (SELECT c.country_name
    FROM countries c WHERE l.country_id = c.country_id) as country_name,
    (SELECT c.country_id
    FROM countries c WHERE l.country_id = c.country_id) as country_id
FROM locations l
ORDER BY country_name ASC;



--문제 12.
--employees테이블, departments테이블을 left조인 hire_date를 오름차순 기준으로 1-10번째 데이터만 출력합니다
--조건) rownum을 적용하여 번호, 직원아이디, 이름, 전화번호, 입사일, 부서아이디, 부서이름 을 출력합니다.
--조건) hire_date를 기준으로 오름차순 정렬 되어야 합니다. rownum이 틀어지면 안됩니다.
SELECT 
        e.employee_id,
        CONCAT(first_name, last_name) AS name,
        e.phone_number,
        e.hire_date,
        d.department_name,
        d.department_id
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY hire_date ASC; --date로 오름차순 정렬해 놓기 >>1

SELECT
    ROWNUM AS rn,
    employee_id,
    name,
    phone_number,
    hire_date,
    department_name,
    department_id
FROM 
    (SELECT 
        e.employee_id,
        CONCAT(e.first_name, e.last_name) AS name,
        e.phone_number,
        e.hire_date,
        d.department_name,
        d.department_id
    FROM employees e
    RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id
    ORDER BY hire_date ASC);
    
SELECT *
FROM 
    (SELECT
        ROWNUM AS rn,
        employee_id,
        name,
        phone_number,
        hire_date,
        department_name,
        department_id
    FROM 
        (SELECT 
            e.employee_id,
            CONCAT(e.first_name, e.last_name) AS name,
            e.phone_number,
            e.hire_date,
            d.department_name,
            d.department_id
        FROM employees e
        LEFT OUTER JOIN departments d
        ON e.department_id = d.department_id
        ORDER BY hire_date))
where rn >= 1 and rn <= 10;

--문제 13.
--EMPLOYEES 과 DEPARTMENTS 테이블에서 JOB_ID가 SA_MAN 사원의 정보의 LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME을 출력하세요
SELECT 
    e.last_name,
    e.job_id,
    d.department_id,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.job_id = 'SA_MAN';

------강사님
SELECT 
    a.last_name,
    a.job_id,
    d.department_id,
    d.department_name
FROM
    (select * 
    from employees
    WHERE job_id = 'SA_MAN') a
LEFT JOIN departments d
ON a.department_id = d.department_id;


--문제 14 > ??????
--DEPARTMENT테이블에서 각 부서의 ID, NAME, MANAGER_ID와 부서에 속한 인원수를 출력하세요.
--인원수 기준 내림차순 정렬하세요.
--사람이 없는 부서는 출력하지 뽑지 않습니다 
SELECT d.department_id,  d.department_name, d.manager_id, count(e.department_id)
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE d.manager_id is not null
GROUP BY d.department_id, d.department_name, d.manager_id
ORDER BY count(e.department_id) DESC;

SELECT 
    d.department_id, 
    d.department_name, 
    d.manager_id,
    COUNT(e.department_id) as count
FROM
    (SELECT *
    FROM departments) d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE d.manager_id is not null
GROUP BY d.department_id, d.department_name, d.manager_id
order by count DESC;

---------강사님
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id; -->1단계
-----합체
SELECT 
    d.*,
    e.total
FROM
    (SELECT department_id, 
               COUNT(*) as total
    FROM employees
    GROUP BY department_id
    ) e
JOIN departments d
on e.department_id = d.department_id;


--문제 15
--부서에 대한 정보 전부와, 주소, 우편번호, 부서별 평균 연봉을 구해서 출력하세요
--부서별 평균이 없으면 0으로 출력하세요
SELECT 
    d.*,
    nvl(trunc(avg(salary)), 0)
FROM
    (SELECT *
    FROM departments) d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name, d.manager_id, d.location_id;

-----강사님
SELECT *
FROM departments; -->2단계

SELECT
    department_id,
    trunc(avg(e.salary)) as salary
FROM employees
GROUP BY department_id; -->1단계
------합체
-->1단
SELECT *
FROM departments d
LEFT OUTER JOIN (SELECT
                            department_id,
                            trunc(avg(salary)) as salary
                        FROM employees
                        GROUP BY department_id) e
ON d.department_id = e.department_id; 

-->2단
SELECT 
    l.*,
    nvl(d.salary, 0)
FROM 
    (SELECT *
    FROM departments d
    LEFT OUTER JOIN (SELECT department_id,
                                      trunc(avg(salary)) as salary
                            FROM employees
                            GROUP BY department_id) e
    ON d.department_id = e.department_id
    ) d 
LEFT OUTER JOIN locations l
on d.location_id = l.location_id;

--결론
SELECT department_id,
          department_name,
          street_address,
          postal_code,
          salary
FROM 
    (SELECT d.department_id,
               d.department_name,
               d.location_id,
               nvl(salary, 0) as salary
    FROM departments d
    LEFT OUTER JOIN (SELECT
                                department_id,
                                trunc(avg(salary)) as salary
                            FROM employees
                            GROUP BY department_id) e
    ON d.department_id = e.department_id
    ) a
LEFT OUTER JOIN locations l
on a.location_id = l.location_id;

--문제 16
--문제 15결과에 대해 DEPARTMENT_ID기준으로 내림차순 정렬해서 ROWNUM을 붙여 1-10데이터 까지만 출력하세요
SELECT *
FROM (SELECT ROWNUM as rn,
              department_id,
              department_name,
              street_address,
              postal_code,
              salary
    FROM 
        (SELECT d.department_id,
                   d.department_name,
                   d.location_id,
                   nvl(salary, 0) as salary
        FROM departments d
        LEFT OUTER JOIN (SELECT
                                    department_id,
                                    trunc(avg(salary)) as salary
                                FROM employees
                                GROUP BY department_id) e
        ON d.department_id = e.department_id
        ) a
    LEFT OUTER JOIN locations l
    on a.location_id = l.location_id
    ORDER BY department_id DESC
)
WHERE rn >= 1 AND rn <= 10
ORDER BY rn;
















