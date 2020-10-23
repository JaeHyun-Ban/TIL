--CREATE OR REPLACE PROCEDURE guguProc(
--    p_dan in number
--) IS
--BEGIN
--    DBMS_OUTPUT.PUT_LINE(p_dan || '단 시작');
--    FOR i IN 1..9
--    LOOP
--        DBMS_OUTPUT.put_line(p_dan || ' x ' || i || ' = ' || p_dan * i);
--    END LOOP;
--END;
--
--EXECUTE guguproc(9); --9단 실행 확인



--------------------------------------------------------------------------------------
----문항 4
----1.
--CREATE TABLE depts as (select * from departments);
--
--select * from depts;
----2.
--alter table depts add constraints depts_pk primary key (department_id); 
--desc depts;

--3
create or replace PROCEDURE deptsProc(
    p_department_id in depts.department_id%TYPE,
    p_department_name in depts.department_name%TYPE,
    p_flag in varchar2
) is

begin
    IF p_flag = 'I' THEN
        INSERT INTO depts(department_id, department_name) 
        VALUES (p_department_id, p_department_name);
    ELSIF p_flag = 'U' THEN
        UPDATE depts 
        SET department_name = p_department_name
        WHERE department_id = p_department_id;
    ELSIF p_flag = 'D' THEN
        DELETE FROM depts
        WHERE department_id = p_department_id
        and department_name = p_department_name;
    END IF;
    commit;
    
    EXCEPTION WHEN OTHERS THEN -- 예외처리
        ROLLBACK;
end;
select * from depts;

EXECUTE deptsProc(290, 'bbbbb', 'I');
EXECUTE deptsProc(290, 'ccccc', 'U');
EXECUTE deptsProc(280, 'aaaa', 'D');

--------------------------------------------------------------------------------------
--[문항5]
create or replace procedure emp_hiredate_proc (
    p_employee_id in employees.employee_id%TYPE --입력받고
)is
    v_count number := 0; -- 중복 확인용
    v_hire_date date;-- 근속년수
begin
    select count(*) --년도를 나타내기
    into v_count
    from employees
    where employee_id = p_employee_id;
    
    select hire_date
    into v_hire_date
    from employees
    where employee_id = p_employee_id;

    IF v_count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('근속년수: ' || trunc((sysdate-v_hire_date)/365) || '년');
    END IF;    
    
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('존재하지 않는 id입니다');
end;

execute emp_hiredate_proc(115);


--------------------------------------------------------------------------------------
drop table emps;
create table emps as (select * from employees);

create or replace PROCEDURE emp_merge_proc(
    p_employee_id in emps.employee_id%TYPE,
    p_last_name in emps.last_name%TYPE,
    p_email in emps.email%TYPE,
    p_hire_date in emps.hire_date%TYPE,
    p_job_id in emps.job_id%TYPE
) is
    v_count number := 0; --존재여부
begin
    select count(*)
    into v_count
    from emps
    where employee_id = p_employee_id
        and last_name = p_last_name
        and email = p_email
        and hire_date = p_hire_date
        and job_id = p_job_id;
    
    
    IF v_count = 5 THEN -- 존재한다면(모든 조건 부합)
        update emps 
        set employee_id = p_employee_id,
        last_name = p_last_name,
        email = p_email,
        hire_date = p_hire_date,
        job_id = p_job_id;
    ELSE -- 없다면
        insert into emps(employee_id, last_name, email, hire_date, job_id)
        values (p_employee_id, p_last_name, p_email, p_hire_date, p_job_id);
    end if;

end;

EXECUTE emp_merge_proc(117, 'kim', 'kim', sysdate, 'ITIT');
select * from emps;
--------------------------------------------------------------------------------------
-- 판매내역


create table day_of_sales(
    total number(10), --총 매출
    regdate date default sysdate
);

drop table sales;
create table sales(
    sno number(5), -- 번호
    name varchar2(30), -- 상품명
    total number(10), --수량
    price number(10), --가격
    regdate date default sysdate --날짜
);

--day_of_sales는 sales에 있는 값들을 모두 다 받아주어야 한다
create table day_of_sales(
    regdate date,
    final_total number(10)
);
create or replace procedure salesProc(
    p_regdate in day_of_sales.regdate%TYPE -- 마감내역 일자
) is
    v_count number := 0; 
    v_price number := 0;
begin
    select count(*) --마감내역이 존재하는지 확인
    into v_count
    from day_of_sales
    WHERE regdate = p_regdate; 
    
    select price into v_price from sales;
    
    if v_count = 1 then --마감내역이 존재 = 업데이트
        update day_of_sales
        set total = total + v_price;
    end if;
end;

insert into sales(price, regdate) values(10000, sysdate);
select * from sales;
select * from day_of_sales;

EXECUTE salesproc(sysdate);


--------------------------------------------------------------------------------------

--[문항7]  프로시저명 - salesProc sales테이블은 오늘의 판매내역이다. 
--day_of_sales테이블은 판매내역 마감시 오늘 일자의 총매출을 기록하는 테이블이다. 
--조건) day_of_sales의 마감내역이 이미 존재하면 업데이트 처리
create table sales( -- sales테이블 생성
    sno number(5), -- 번호
    name varchar2(30), -- 상품명
    total number(10), --수량
    price number(10), --가격
    regdate date default sysdate --날짜
);
create table day_of_sales(
    regdate date, 
    final_total number(10)
);



create or replace procedure salesProc ( --프로시저 생성
   s SALES.SNO% type,
   n SALES.NAME% type,
   t SALES.TOTAL% type,
   p SALES.PRICE% type
) is
   today date;
   counts number;
   total number;
begin
   insert into SALES(sno, name, total, price) values (s, n, t, p);

   select sysdate into today from dual; --오늘 날짜만 뽑아서 등록
   
   --오늘 날짜로 등록되어있는지 확인
   select count(*) into counts from DAY_OF_SALES where regdate = today; 
    
    --이미 등록 했다면
   if counts > 0 then
       select (FINAL_TOTAL + p) into total from day_of_sales; --오늘 매출을 총 매출에 넣어줌
       update DAY_OF_SALES set FINAL_TOTAL = total where regdate = today;
   else
       insert into DAY_OF_SALES values (today, p);
   end if;
end;

--------------------------------------------------------------------------------------
--강사님

--마감내역 프로시저
create or replace procedure salesproc(
    --날짜만 입력받아서 비교 > 그 후 처리
    p_regdate sales.regdate%type
) is
    v_final_total number := 0; --최종 매출내역
    v_check number := 0;
begin

    select sum(total * price) -->sum을 이런식으로 활용해도 좋네
    into v_final_total
    from sales
    where to_char(regdate, 'YY/MM/DD') = to_char(p_regdate, 'YY/MM/DD'); 
    -->오늘날짜를 문자열 형태를 통일시켜서 비교해준다.
    
    --존재하는지 확인(if구문에서 활용할 예정)
    select count(*)
    into v_check
    from day_of_sales
    where to_char(regdate, 'YY/MM/DD') = to_char(p_regdate, 'YY/MM/DD'); 
    
    
    
    if v_check = 0 then --마감테이블에 없다면 insert
        insert into day_of_sales(regdate, final_total) values (p_regdate, v_final_total);
    else --마감 테이블에 존재 = update
        update day_of_sales set final_total = v_final_total
        where to_char(regdate, 'YY/MM/DD') = to_char(p_regdate, 'YY/MM/DD'); 
    
    end if;
    
    commit;
    
    DBMS_OUTPUT.put_line(v_final_total);
end;


--조인문, 다중테이블 검색, 서브쿼리절을 잊지말고(더 중요하다..._)
























