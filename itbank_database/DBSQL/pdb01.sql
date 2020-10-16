/*
오라클의 최고 관리자 계정으로 실행을 시킨다.
*/

-- 계정 생성명령
--CREATE USER (유저명) IDENTIFIED BY (비밀번호);
CREATE USER user01 IDENTIFIED by user01;
-- # 생성된 계정에 권한 부여(GRANT)
-- GRANT (접속 가능), (테이블 생성), (시퀀스 생성), (뷰 생성) TO (유저명);  
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW TO user01;

-- 기존에 있던 테이블 스페이스(데이터가 물리적으로 저장되는 공간)
alter user user01 default TABLESPACE users quota UNLIMITED on users; -- 무한정 저장할 수 있는 권한 추가
-->alter user (기존유저) defualt 

--새롭게 생성한 테이블 스페이스를 사용하는 경우
ALTER USER user01 default TABLESPACE MY_DATA quota UNLIMITED ON MY_DATA; --


/*
롤(Role)을 이용한 계정 생성과 권한 부여
*/
create user USER02 IDENTIFIED BY USER02; --생성
grant connect, resource to USER02; --권한 부여
alter user USER02 default tablespace MY_DATA quota unlimited on  


MY_DATA; --테이블 스페이스 설정


























