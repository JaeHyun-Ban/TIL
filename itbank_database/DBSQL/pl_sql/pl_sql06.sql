/*
트리거의 조건

after - insert, update, delete: 작업 이후에 동작하는 트리거입니다
before - insert, update, delete: 작업 이전에 동작하는 트리거 입니다.
instead of - insert, update, delete : 작업 이전이전에 view만 부착되서 실행되는 트리거 입니다

:old = 참조 전 열 값 (update : 수정하기 전 데이터, delete : 삭제하기 전 데이터)
:new = 참조 후 열 값 (insert : 입력할 자료, update : 수정 된 자료)
*/

-- 예를 들어, 회원에 테이블 update, delete 작업이 수행되면, 이력을 남겨놓는다.
CREATE TABLE tbl_user(
    id varchar2(50) PRIMARY KEY,
    name VARCHAR2(50),
    address VARCHAR2(50)
);

-- 백업테이블 생성
CREATE TABLE tbl_user_backup(
    id varchar2(50), --FK
    name VARCHAR2(50), 
    address VARCHAR2(50),
    updatedate date default sysdate,
    m_type char(1), -- 변경된 타입 char = 고정형
    m_user varchar2(50) -- 변경한 사용자   
);


-- # after 트리거 #
CREATE OR REPLACE TRIGGER trg_user_backup
    AFTER UPDATE OR DELETE
    ON TBL_USER -- 부착!
    FOR EACH ROW --각 행 모두!

DECLARE -- 변수 선언
    v_type char(1); --타입 변수
BEGIN -- 실행 블록
    IF updating THEN -- updating - 업데이트 되었다는 시스템 변수
        v_type := 'U';
    ELSIF deleting THEN -- deleting - 삭제되었다는 시스템 변수
        v_type := 'D';
    END IF;
    -- :old 컬럼 - 테이블에 "변경 전 데이터"를 의미
    -- user() - 접속되어 있는 계정(시스템 함수)
    INSERT INTO tbl_user_backup VALUES(:old.id, :old.name, :old.address, sysdate, v_type, user());
END; 

-- 확인해보기
INSERT INTO tbl_user VALUES('test01', '홍길동', '서울');
INSERT INTO tbl_user VALUES('test02', '홍길자', '부산');
INSERT INTO tbl_user VALUES('test03', '이순신', '경기');

UPDATE tbl_user SET address = '제주' WHERE id = 'test01'; -- update를 했으니 trigger가 동작을 했을꺼다
SELECT * FROM tbl_user_backup; -- trigger update동작 확인

DELETE FROM tbl_user WHERE id = 'test01'; -- delete = trigger동작
SELECT * FROM tbl_user_backup; -- trigger delete동작 확인
SELECT * FROM tbl_user;

------------------------------------------------------------
-- # befroe트리거 - 테이블에 DML구문 "실행 전"
-- 예를 들어 insert 되기 전에, 데이터를 변경하는 형태

CREATE or REPLACE TRIGGER trg_user_insert
    BEFORE INSERT
    on tbl_user
    FOR EACH ROW
 
DECLARE
BEGIN
-- :new 컬럼 - insert구문에서 전달되는 데이터
    :new.name := substr(:new.name, 1, 1) || '**'; -- name에 1번의 1줄(성)만 자르고 '**'를 붙여서 다시 대입
END;

--확인해보기
INSERT INTO tbl_user VALUES('test04', '이방원', '부산');
INSERT INTO tbl_user VALUES('test05', '이성계', '경기');

SELECT * FROM tbl_user;


--------------------------------트리거 활용----------------------------------------
--trigger를 이용해서 상품의 주문을 작성해보자
--1. 주문상세 테이블에 insert(주문상세 after trigger 부착 >> 물품테이블 update 시킴)

--주문 상세(이력) 테이블
CREATE TABLE order_history(
    history_no NUMBER(5) PRIMARY KEY,  -- 기록번호
    order_no NUMBER(5), --FK 주문번호
    product_no NUMBER(5), -- FK 상품번호
    total NUMBER(10), --수량
    price NUMBER(10) -- 가격
);
CREATE SEQUENCE order_history_seq NOCACHE; -- 기록번호용 시퀀스 생성


--상품 목록 테이블
CREATE TABLE product(
    product_no NUMBER(5) PRIMARY KEY,
    product_name VARCHAR2(30),
    total NUMBER(10), -- 수량
    price NUMBER(10) -- 가격
);
CREATE SEQUENCE product_seq NOCACHE; -- 상품번호용 시퀀스 생성

INSERT INTO product VALUES (product_seq.nextval, '피자', 100, 10000);
INSERT INTO product VALUES (product_seq.nextval, '치킨', 100, 15000);
INSERT INTO product VALUES (product_seq.nextval, '햄버거', 100, 5000);

SELECT * FROM product; -- insert확인


-- 주문 상세에 insert가 들어오면 실행 trigger
CREATE or REPLACE TRIGGER trg_order_history_insert
    AFTER INSERT
    ON order_history
    FOR EACH ROW
DECLARE
    --수량, 번호 얻어오기
    v_total NUMBER; -- 개수
    v_product_no NUMBER; --상품번호
BEGIN
    SELECT :new.total, :new.product_no
    INTO v_total, v_product_no
    FROM dual; -- 가상테이블

    --상품에서 업데이트
    UPDATE product SET total = total - v_total --현재 상품 개수 - 주문 개수
    WHERE product_no = v_product_no;

END;

--확인
INSERT INTO order_history VALUES (order_history_seq.nextval, 50000, 1, 10, 10000); --피자 10개 주문
INSERT INTO order_history VALUES (order_history_seq.nextval, 50000, 2, 10, 15000); -- 치킨 5개 주문
INSERT INTO order_history VALUES (order_history_seq.nextval, 50000, 3, 1, 5000); -- 햄버거 1개 주문

SELECT * FROM PRODUCT; --상품 개수 차감 확인
SELECT * FROM order_history;


































