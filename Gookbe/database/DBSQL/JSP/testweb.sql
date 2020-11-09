--글 작성,리스트 기준으로 생성
create table bbs(
    bno NUMBER(10) not null,
    writer VARCHAR2(100) not null,
    title VARCHAR2(300) not null,
    content VARCHAR2(3000) not null,
    regdate date default sysdate
)
--bbs
--글번호,작성자,글제목,글내용,등록일

--bno를 pk로 설정, 이름: bbs_pk
ALTER TABLE bbs ADD CONSTRAINT bbs_pk PRIMARY KEY (bno);
--bno숫자 자동증가 시퀀스 생성(시작:1, 증가:1 시퀀스 미리 할당x)
CREATE SEQUENCE bbs_seq START WITH 1 INCREMENT BY 1 NOCACHE;
commit;

--------------------------------------------------------------
--회원가입 기준으로 생성
create table members(
    id VARCHAR2(50) not null,
    password VARCHAR2(50) not null,
    name VARCHAR2(50) not null,
    phone1 VARCHAR2(50) not null,
    phone2 VARCHAR2(50) not null,
    phone3 VARCHAR2(50) not null,
    email VARCHAR2(100),
    addr_basic VARCHAR2(200),
    addr_detail VARCHAR2(200),
    regdate date default sysdate
)
drop table members;
--id를 pk로 지정
ALTER TABLE members ADD CONSTRAINT members_pk PRIMARY KEY (id);
commit;
--------------------------------------------------------------
--게시판에 test글 작성



-------------------------------------------
--test
select * from members;
INSERT INTO members(id, password, name, phone, email, address) 
VALUES('test', 'test', 'test', 'test', 'test', 'test');

SELECT * FROM members WHERE id = 'asd1' AND password = 123456;

---------------------------------------------------------
--게시판 글 넣기
DECLARE

    var1 NUMBER := 1;
    
BEGIN

    WHILE var1 <= 200
    LOOP
        INSERT INTO bbs(bno, writer, title, content) VALUES(BBS_SEQ.nextval, 'test'||var1, 'test'||var1, 'test'||var1);
        
        
        var1 := var1 + 1;
        
    end LOOP;
    
    commit;--commit빼먹지 발아주기

END;

select * from bbs order by bno desc;

SELECT * 
FROM(
    SELECT ROWNUM r, 
           bno,
           writer,
           title,
           content,
           regdate
    FROM (SELECT *
          FROM bbs
          ORDER BY bno DESC)
    ) 
WHERE r > 0 AND r <= 10 AND writer = 'asd1'; 




























