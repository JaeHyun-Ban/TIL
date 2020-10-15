---------테이블 생성---------

create table dept2(
    dept_no NUMBER(2, 0), --2자리 저장, 실수는 저장x
    dept_name varchar2(14), --byte기반 가변 문자열 
    loca varchar2(13),
    dept_date DATE,
    dept_bonus number(10)
);

select * from dept2;
insert into dept2 values(99, '영업', '서울', sysdate, 2000000000); --자리수 확인

---------------테이블 수정 alter table-----------
alter table dept2
add dept_count number(3); -- 추가
desc dept2;

alter table dept2
modify dept_count number(10); --수정
desc dept2;

alter table dept2
rename column dept_count to emp_count; --컬럼명 변경
desc dept2;

alter table dept2
drop column emp_count; --컬럼 삭제
COMMIT;

---------테이블 삭제----------
drop table dept2;
--drop table dept2 cascade CONSTRAINTS 제약조건명; --해당테이블에 FK제약조건이 들어있더라고 삭제
--왜래키란 다른 테이블의 기본 키 필드를 가지는 데이터의 참조무결성을 확인하기 위해 사용된다.


--테이블데이터 전부삭제
--truncate table dept2;


----------------------------------------------------
--# 테이블 생성과 제약조건
/*
열레벨 제약조건(PK, FK, not null, check, unique)
1. PK - 테이블 고유 식별 컬럼(not null + unique)
2. UNIQUE - 유일한 값을 갖게하는 컬럼(중복데이터의 방지)
3. not null - null을 허용하지 않음
4. FK - 참조하는 테이블의 PK를 지칭하는 컬럼
5. CHECK - 정의된 형식만 들어오도록 허용
*/


desc locations;
create table dept2(
    dept_no number(2) PRIMARY KEY,
    dept_name varchar2(14) not null unique,
    loca number(4) REFERENCES locations(location_id), --locations의 location_id를 참조한다(참조테이블의 타입까지 똑같이 맞춰줘야한다.
    dept_date date default sysdate, --아무것도 지정하지 않은 기본으로 지금시간을 나타내준다
    dept_bonus number(10),
    dept_gender char(1) check(dept_gender in('F', 'M')) --F or M만 받는다
);
desc dept2;
drop table dept2;

-- # 테이블 레벨 제약조건(모든 열을 선언한 후에 아래쪽에 제약조건 추가)
create table dept2(
    dept_no number(2),
    dept_name varchar2(14) not null,
    loca number(4),
    dept_date date default sysdate,
    dept_bonus number(10),
    dept_gender char(1),
    constraints dept_no_pk primary key (dept_no), --제약조건(들) 제약조건이름 + 제약조건 종류 + 적용컬럼
    constraints dept_name_uk unique (dept_name),
    constraints dept_gender_ck check (dept_gender in ('F', 'M')), -- 체크: 적용컬럼 + 조건
    constraints dept_loca_fk foreign key (loca) references locations(location_id) --참조 + 참조테이블(참조하는 컬럼)
    
    
);
























