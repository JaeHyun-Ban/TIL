--1.
CREATE SEQUENCE mem_no
    INCREMENT BY 1
    MAXVALUE 1000000
    NOCACHE;
    
DROP TABLE MEMBERS;

CREATE TABLE MEMBERS(
    no NUMBER(10),
    id VARCHAR2(20) PRIMARY KEY, --id는 pk
    pw VARCHAR2(20),
    name VARCHAR2(10),
    address VARCHAR2(50),
    phone VARCHAR2(20),
    member_type VARCHAR2(20),
    user_YN CHAR(1) CHECK (user_YN IN ('Y', 'N')), -- 제약조건 생성
    regdate DATE --regdate date형 + 현재날짜
);
drop table members;

INSERT INTO MEMBERS 
VALUES(mem_no.nextval, 
            'com01', 
            '******', 
            '홍길동', 
            '서울시',
            '01012341234',
            '관리자',
            'Y',
            sysdate
);
select * from members;
            







--create index emps_first_name_ix on emps(first_name);
CREATE INDEX mem_phone ON members(phone);
select * from mem_phone;


CREATE VIEW mem_ex 
AS (SELECT name, address, phone, member_type FROM members);
select * from mem_ex;



--------------------------------------------------------
CREATE USER COM03 IDENTIFIED BY COM03;



CREATE ROLE ex; --ROLE생성
GRANT CREATE SESSION, CREATE TABLE TO ex;-- 접속, 테이블생성 권한을 ex(ROLE)에게 부여
GRANT ex TO COM03; --ex를 COM03계정에 부여한다



CREATE TABLESPACE MYWEB --MYWEB이름 
DATAFILE 'd:/course/space' SIZE 500M; --저장위치와 사이즈



ALTER USER COM03 DEFAULT TABLESPACE MYWEB QUOTA UNLIMITED ON MYWEB;






