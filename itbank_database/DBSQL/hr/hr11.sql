/*
view는 제한적인 자료만 보기위해서 사용할 수 있는 가상테이블 개념입니다.
view는 가상테이블이기 때문에 필요한 컬럼만 저장해두면 데이터 조회가 용이해진다.
view 는 실제로 데이터가 물리적으로 저장된 형태는 아니다(원본테이블을 기반으로 사용된다)

그래서 view에 DML작업을 하게 되면 실제 테이블에 적용이 된다(다만, 제약사항이 많이 존재한다.)
*/

select * from user_sys_privs; --현재 사용자 권한확인

--# 단순 view - 하나의 테이블을 기반으로 한 view
create view view_emp
as (select employee_id, 
            first_name, 
            last_name, 
            job_id, 
            salary from employees);
select * from view_emp; -->이렇게 생성한 테이블은 '뷰'폴더안에 생성되어있다,

--# 복합view -여러 테이블을 조인하여 필요한 데이터를 저장한 형태)
create view view_emp_dept_job
as (select e.employee_id,
            first_name ||' '||last_name as name,
            d.department_name,
            j.job_title
    from employees e
    left outer join departments d
    on e.department_id = d.department_id
    left outer join jobs j
    on e.job_id = j.job_id
    );
select * from view_emp_dept_job;

----------------------------------------------------------------------
--# view의 수정 create or replace view 동일이름
create or replace view view_emp_dept_job
as ( select  e.employee_id,
               first_name ||' '|| last_name as name,
               d.department_name,
               j.job_title,
               e.salary,
               l.street_address
     from employees e
     left outer join departments d
     on e.department_id = d.department_id
     left outer join jobs j
     on e.job_id = j.job_id
     left outer join locations l
     on d.location_id = l.location_id);
select * from view_emp_dept_job;

--복합view로 필요한 데이터를 생성했다면 데이터의 조회가 간편하다
-->한번 생성해 놓으면 꺼내서 볼때 코드를 작성하기 편하다
select job_title, avg(salary), sum(salary), count(salary)
from view_emp_dept_job
group by job_title
order by avg(salary);


--view 삭제
drop view view_emp;
drop view view_emp_dept_job;


/*
view는 insert, update, delete가 일어나는 경우에 실제테이블에도 반영 된다.
그리고 많은 제약사항이 있다.
따라서 그냥 원본 테이블의 DML을 사용하자
*/
select * from view_emp_dept_job;
-- name은 가상열 이라서 insert가 안된다.
insert into view_emp_dept_job values(300, 'test', 'test', 'test');

-- join테이블의 경우에도 update, insert가 안된다
insert into view_emp_dept_job(employee_id, department_name, job_title) values(300, 'test', 'test');

--원본테이블의 not null 조건때문에 insert가 안된다
insert into view_emp(employee_id, first_name, salary) values(300, 'test', 10000); 
-->view를 이용해 insert를 해도 결국 원본테이블에 입력하게 된다


-- view의 제약사항
-- with check option
create view view_emp_test
as (select employee_id,
            first_name,
            last_name,
            email,
            hire_date,
            job_id,
            department_id
    from employees
    where department_id = 60)
with check option;

--department_id 수정 불가능함
update view_emp_test set department_id = 100;

select * from view_emp_test;

-- with read only - 읽기전용
create or replace view view_emp_test
as (select employee_id,
            first_name,
            last_name,
            email,
            hire_date,
            job_id,
            department_id
    from employees
    where department_id = 60)
with read only; -->읽기 전용 뷰
--따라서 update, insert 등 모두 불가능하다(모든 CRUD 금지)
update view_emp_test set department_id = 100;




--시퀀스 (순차적으로 증가하는 값)
select * from user_sequences; --시퀀스 확인명령
select * from user_views; -- view확인명령
select * from user_constraints; -- 제약조건 확인명령


--시퀀스 생성
create sequence dept3_seq; -- 자동 생성
create sequence dept3_seq increment by 1 start with 1 maxvalue 10 nocycle nocache; -- 옵션 설정
-->'nocache' 를 넣지않으면 20씩 증가함 꼭 넣어 줄 것

--시퀀스 삭제
drop sequence dept3_seq;

-- 테이블 생성
create table dept3(
    dept_no number(3) primary key,
    dept_name varchar(20),
    dept_date date default sysdate
);
desc dept3;

--시퀀스 사용하기 CURRVAL, NEXTVAL
INSERT INTO dept3(dept_no, dept_name) VALUES(dept3_seq.nextval, 'test');
SELECT * FROM dept3;

--현재 시퀀스의 확인
select dept3_seq.CURRVAL from dual;

-- 시퀀스 수정
ALTER SEQUENCE dept3_seq MAXVALUE 9999; --맥스값 9999로 변경
ALTER SEQUENCE dept3_seq INCREMENT BY 10; -- 증가값이 10으로 변경
ALTER SEQUENCE dept3_seq MINVALUE 1;

--시퀀스 조회
select dept3_seq.CURRVAL from dual;
select dept3_seq.nextval from dual; --next명령이 들어갈 때마다 값이 증가

--시퀀스의 값을 다시 처음으로 돌리는 방법
--현재시퀀스 확인 -> 증가값 수정(-가장 높은값) -> nextval -> 증가값 1로 변경 -> 실행
select dept3_seq.currval from dual;
ALTER SEQUENCE dept3_seq INCREMENT BY -19; --증가값을 -20으로 변경
select dept3_seq.nextval from dual;

ALTER SEQUENCE dept3_seq INCREMENT BY 1; -- 증가값 +1로 변경
select dept3_seq.currval from dual; --현재 시퀀스 값 확인

drop sequence dept3_seq;
drop table dept3;
/*
# 시퀀스 활용 pk값을 20201016-시퀀스값
1. dept3_seq생성
2. pk를 varchar2로 생성
3. insert시에 to_char(날짜) || - || 시퀀스 값
*/
create table dept3(
    dept_no varchar2(30) primary key,
    dept_name varchar2(30)
);
create sequence dept3_seq increment by 1 start with 1 nocache;-- 시퀀스 생성 증가 1씩, 시작 1부터
--cache - 시퀀스 값을 빨리 제공하기위해 미리 메모리에 cache갯수만큼의 시퀀스를 만들어서 준비
insert into dept3 values(to_char(sysdate, 'YYYYMMDD') || '-' || dept3_seq.nextval , 'test');
--> 날짜를 문자열로 변경하면서 `- 시퀀스번호`를 함께 추가해 주는 형식으로도 작성이 가능하다
select * from dept3;



-- # INDEX
--오라클 데이터베이스 테이블안에서 원하는 레코드를 빠르게 찾아갈 수 있도록 만들어진 데이터 구조이다.
-- PRIMARY KEY, UNIQUE 제약조건에서 자동으로 생성되고, 조회를 빠르게 해주는 hint역활을 한다.
-- 그래서 최후의 수단으로 INDEX를 사용하는 것이 올바른 사용법이다.
select * from user_indexes;
select * from emps where first_name = 'Lex';

-- INDEX 수동 추가하기
create index emps_first_name_ix on emps(first_name); --강제로 first_name에 INDEX를 추가하기
-->이렇게 생성된 INDEX를 삭제해도 테이블 데이터에는 영향을 주지 않는다

-- INDEX 삭제
drop index emps_first_name_ix;

































