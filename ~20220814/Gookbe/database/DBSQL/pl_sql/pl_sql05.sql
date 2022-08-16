/*
# trigger 이란 
테이블에 부착된 형태로써, insert, update, delete 작업이 수행될 때
특정 코드가 동작되도록 하는 구문이다.
*/


CREATE TABLE tbl_test(
  id NUMBER(10),
  text VARCHAR2(50)
);


--소괄호를 사용하지 않는다
CREATE OR REPLACE TRIGGER trg_test
  AFTER DELETE or UPDATE --삭제, 수정 이후에 (실행 조건 설정)
  ON tbl_test --부착할 테이블
  FOR EACH ROW -- 각 행에 전부 적용

BEGIN
  DBMS_OUTPUT.PUT_LINE('트리거 실행');
END;

INSERT INTO tbl_test VALUES(10, '홍길동'); -- 트리거 실행 x
INSERT INTO tbl_test VALUES(20, '홍길자'); -- 트리거 실행 x
select * from tbl_test;

--TRIGGER 작동 확인해보기
UPDATE tbl_test SET text = '이순신' WHERE id = 20;

DELETE FROM tbl_test WHERE id = 20;
