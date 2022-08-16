desc departments;
--DEPARTMENT_ID      NOT NULL NUMBER(4)    
--DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
--MANAGER_ID                        NUMBER(6)    
--LOCATION_ID                        NUMBER(4)    

--사본테이블 생성
create table depts as (SELECT * FROM departments);
select * from depts;
desc depts;

--문제 1
insert into depts values(280, '개발', null, 1800);
insert into depts values(290, '회계', null, 1800);
insert into depts values(300, '재정', 301, 1800);
insert into depts values(310, '인사', 302, 1800);
insert into depts values(320, '영업', 303, 1700);
select * from depts;
COMMIT;

--문제 2
update depts set department_name = 'IT bank' where department_name = 'IT Support';
update depts set department_id = 301 WHERE department_id = 290;

update depts set department_name = 'IT Help', manager_id = 303, location_id = 1800 
where department_name = 'IT Helpdesk';
--4. 원하는 값만 찍어서 매니저 아이디를 301로 한번에 변경시켜라>>???
update depts set manager_id = 301 where manager_id in (301, 302, 303) ; --여러개를 사용하는법
commit;


--문제 3
--ALTER TABLE emps ADD CONSTRAINT emps_emp_id_pk PRIMARY KEY (employee_id); --employee_id PK지정
alter table depts add constraint depts_dep_id_pk primary key (department_id); -- depts의 department_id를 PK로 지정
--영업부 = salse
select * from depts where department_name = '영업'; -- 꼭꼭꼭 확인을 한 후에 delete를 진행하자
select * from depts where department_name = 'NOC';
--삭제는 PK(department_id)로 진행해 준다 -> 안그러면 수백개가 안번에 날라갈지도 몰라;;;;
delete from depts where department_id = '320';
delete from depts where department_id = '220';
select * from depts;
commit;

--문제 4
--1. Depts 사본테이블에서 department_id 가 200보다 큰 데이터를 삭제하세요.
delete from depts where department_id > 200;
--2. Depts 사본테이블의 manager_id가 null이 아닌 데이터의 manager_id를 전부 100으로 변경하세요.
update depts set manager_id = 100 where manager_id is not null;
--3. Depts 테이블은 타겟 테이블 입니다.
merge into depts a --타겟 테이블
    using (select * from departments) b --매번 수정이 일어나는 테이블(조건은 딱히 없음)
    on (a.department_id = b.department_id)
when matched then -- 매칭(일치)한다면 업데이트 진행
    update set a.department_name = b.department_name,
                   a.manager_id = b.manager_id,
                   a.location_id = b.location_id
when not matched then --매치(일치)하지 않는다면 추가(insert)진행
    insert values (b.department_id,
                     b.department_name,
                     b.manager_id,
                     b.location_id);
--원본으로 변했는지 확인
select * from depts
order by department_id;
select * from departments;


--문제 5
--1. jobs_it 사본 테이블을 생성하세요 (조건은 min_salary가 6000보다 큰 데이터만 복사합니다)
create table jobs_it as (select * from jobs where min_salary > 6000);
select * from jobs_it;
commit;

--2. jobs_it 테이블에 다음 데이터를 추가하세요
insert into jobs_it values('IT_DEV', '아이티개발팀', 6000, 20000);
insert into jobs_it values('NET_DEV', '네트워크개발팀', 5000, 20000);
insert into jobs_it values('SEC_DEV', '보안개발팀', 6000, 19000);
    
--3. jobs_it은 타겟 테이블 입니다
--4번 이어서 진행
merge into jobs_it a  --타겟 테이블 선택
    using(select * from jobs where min_salary > 0) b --매번 수정이 일어나는 테이블
    on(a.job_id = b.job_id) --a와b를 JOIN
when matched then --b의 조건과 일치한다면 update
    update set a.min_salary = b.min_salary,
                   a.max_salary = b.max_salary
when not matched then --b의 조건과 일치하지 않는 다면 insert
    insert values (b.job_id,
                      b.job_title,
                      b.min_salary,
                      b.max_salary);
--확인용
select * from jobs_it;
commit;
    


























