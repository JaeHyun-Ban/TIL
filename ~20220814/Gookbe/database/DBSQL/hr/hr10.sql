---------------------------------------------------
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

--제약 조건은 추가, 삭제가 가능합니다.
drop table dept2;
create table dept2(
    dept_no number(2),
    dept_name varchar2(14),
    loca number(4),
    dept_date date default sysdate, 
    dept_bonus number(10),
    dept_gender char(1)
);
--pk와 fk정도는 꼭 알아두자

--pk추가
alter table dept2 add constraints dept_no_pk primary key (dept_no);
-->테이블 변경 dept2 제약조건 추가 dept_no_pk(이름) primary key dept_no를

--fk추가
alter table dept2 add constraints dept_loca_fk foreign key (loca) references locations(location_id);
-->테이블 변경 dept,2 제약조건 추가, 이름:dept_loca_fk 외래키 loca를 참조시킨다 locations테이블의location_id랑 

--check추가
alter table dept2 add constraints dept_gender_check check(dept_gender in('Y', 'N'));

--unique추가
alter table dept2 add constraints dept_name_uk unique (dept_name);

--not null은 열 수정형태로 변경합니다.
alter table dept2 modify dept_name varchar(14) not null;

--제약조건 삭제(제약조건 이름으로 삭제 진행)
alter table dept2 drop constraints dept_no_pk;

--FK는 부모테이블에 값이 없다면 삽입이 불가능하다
select * from locations;  
insert into dept2 values(10, 'test', 100, sysdate, 5000, 'Y'); --locations에 location_id 100이 없기 때문에 불가능
desc dept2;






























