--#INSERT
DESC departments;
--1. insert첫번째 방법(모든 컬럼 데이터를 한번에 지정)
INSERT INTO departments values(280, 'developer', null, 1700);
SELECT * FROM departments;
ROLLBACK; -- 실행지점을 뒤로 되돌림

--2. INSERT 두번째 방법(직접 컬럼을 지정하고 저장)
INSERT INTO departments(department_id, department_name, location_id) -- insert하고 싶은 컬럼
VALUES (300, '디자이너', 1700); -- 컬럼 값


--3. 서브쿼리 구문으로 INSERT
--사본테이블
DESC employees;
CREATE TABLE managers as(SELECT employee_id, first_name, job_id, salary, hire_date FROM employees WHERE 1 = 2);
SELECT * FROM managers;

INSERT INTO managers(employee_id, first_name, job_id, salary, hire_date) 
(SELECT employee_id, first_name, job_id, salary, hire_date FROM employees WHERE department_id = 60);

ROLLBACK;

-----------------------------------------------------------------------------------------------------------------
--# UPDATE구문
--사본테이블
CREATE TABLE emps as (SELECT * FROM employees);
UPDATE emps SET salary = 100000; -- 테이블의 모든 컬럼이 들어간다 X

UPDATE emps SET salary = 100000 WHERE employee_id = 100; --100번만 수정(pk값).WHERE절은 KEY 값을 많이 이용한다 
UPDATE emps SET salary = salary * 01 + salary WHERE employee_id = 100; --WHERE로 지정하지 않으면 모든 컬럼에 값이 수정된다
UPDATE emps SET manager_id = 100 WHERE employee_id = 100;
UPDATE emps SET phone_number = '031.123.1234', manager_id = 102 WHERE employee_id = 100;

SELECT * FROM emps;

--update 서브쿼리
UPDATE emps SET salary = (SELECT 1000 FROM dual) WHERE employee_id = 100;
UPDATE emps SET 
    (salary, phone_number) = (SELECT salary, phone_number FROM emps WHERE employee_id = 101)
WHERE employee_id = 100;
rollback;


-------------------------------------------------------------------------
--# DELETE (진짜진짜진짜 조심)
--삭제시에 반드시 조건절, 다른테이블에서 데이터를 참고하고 있으면 삭제 불가능하다.
ALTER TABLE emps ADD CONSTRAINT emps_emp_id_pk PRIMARY KEY (employee_id); --employee_id PK지정
ALTER TABLE emps ADD CONSTRAINT emps_manager_fk FOREIGN KEY (manager_id) REFERENCES emps (employee_id);--manager_id FK지정

DELETE FROM emps WHERE employee_id = 100; --다른곳에서 참조해서 사용중이기 떄문에 지울 수 없다
SELECT * FROM emps;

-- 사본테이블
create table depts as (select * from departments);
select * from depts;

delete from depts where department_id = 10;

--delete(서브쿼리)
select department_id from emps where department_id = 100;
delete from depts where department_id = (select department_id from emps where employee_id = 100);
delete from depts where department_id = (select department_id from emps where employee_id = 101);
select * from depts;
ROLLBACK;

-------------------------------------------------------------
--# MERGER(테이블 수정 추가가 빈번한 경우애, 따로 저장할 테이블을 만들어 놓고, 비교해서 추가, 수정구문을 실행시켜주는 방식)
-->정기적으로 실행할 때 사용한다
CREATE table emps_it as (select * from employees where 1 = 2);

insert into emps_it (employee_id, first_name, last_name, email, hire_date, job_id)
values (105, '데이비드', '킴', 'davidkim', '06/06/06', 'IT_PROG');

select * from emps_it;

merge into emps_it a -- 타겟테이블 지정
    using (select * from employees where job_id = 'IT_PROG') b --조인구문, new 테이블
    on (a.employee_id = b.employee_id) -- a테이블과 b테이블의 JOIN조건
when matched then --조건에 일치한다면(데이터가 존재하는 경우)
    update set a.phone_number = b.phone_number, -- 기존의 데이터를 업데이트 진행
                   a.salary = b.salary,
                   a.commission_pct = b.commission_pct,
                   a.manager_id = b.manager_id,
                   a.department_id = b.department_id
when not matched then --조건에 일치하지 않는다면(타겟 테이블에 실행)
    insert values(b.employee_id, --새로운 사용자를 생성
                     b.phone_number,
                     b.first_name,
                     b.last_name,
                     b.email,
                     b.hire_date,
                     b.job_id,
                     b.salary,
                     b.commission_pct,
                     b.manager_id,
                     b.department_id);
--확인
select * from emps_it;

------실습------
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '렉스', '킴', 'lex', '01/04/06', 'AD_VP');
insert into emps_it(employee_id, first_name, last_name, email, hire_date, job_id) 
values(102, '니나', '커', 'nina', '20/04/06', 'AD_VP');

--employee테이블을 매번 수정되는 테이블이라고 가정하고,
--기존데이터는 email, phone, salary, manager_id, department_id는 업데이트 되도록 처리
-- 새로 유입된 데이터는 그냥 그대로 전부 추가
merge into emps_it a --매번 수정되는 테이블
    using (select * from employees) b --JOIN의 조건
    on(a.employee_id = b.employee_id) --a 와 b를 JOIN
when matched then --조건이 일치하면
    update set a.email = b.email,
                   a.phone_number = b.phone_number,
                   a.salary = b.salary,
                   a.manager_id = b.manager_id,
                   a.department_id = b.department_id  -- 기존 데이터(a)를 신규 데이터(b)로 업데이트(update) 한다
    --DELETE를 한다면?
--    delete where b.employee_id = 105
when not matched then -- 조건이 일치하지 않는다면
    insert values(b.employee_id, --신규데이터(b)를 새롭게 추가(insert)한다
                     b.first_name,
                     b.last_name,
                     b.email,
                     b.phone_number,
                     b.hire_date,
                     b.job_id,
                     b.salary,
                     b.commission_pct,
                     b.manager_id,
                     b.department_id);
--확인해보기
select * from emps_it;

--나중에 SQL문을 보고 해석할 수 있을정도로 숙지 해 놓자




    





















