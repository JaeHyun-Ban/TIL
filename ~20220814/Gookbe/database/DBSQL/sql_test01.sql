/*
[문항3]  HR계정의 EMPLOYEES테이블의 다음과 같은 결과를 출력하는 쿼리문을 작성하세요
job_id 는 _를 제거한채로 출력
직무별 사원수 직무별 급여합
직무별 급여 평균
*/

SELECT 
    REPLACE(job_id, '_', ' ') as JOB_ID,
    count(*) as 직무별사원수,
    SUM(salary) as 직무별급여합,
    AVG(salary) as 직무별급여평균
FROM employees
GROUP BY job_id; --묶어줌(기준)


--------------------------------------------------------------------------------------------------------------
/*
[문항4]  4-8번은 다음 테이블을 참조해서 작성하세요 

*/

drop table board;
drop SEQUENCE board_seq;


INSERT INTO board VALUES(board_seq.nextval, 'kkk123', '첫글', '--', sysdate, sysdate);
INSERT INTO board VALUES(board_seq.nextval, 'aaa', '이거처음이야', '--', sysdate, sysdate);
INSERT INTO board VALUES(board_seq.nextval, 'kkk123', '이런거본적있어?', '--', sysdate, sysdate);
INSERT INTO board VALUES(board_seq.nextval, 'bbb', '질문이요', '--', sysdate, sysdate);
INSERT INTO board VALUES(board_seq.nextval, 'ccc', '우와~', '--', sysdate, sysdate);

--1) board테이블에 다음 writer, title, content를 insert하는 sql문을 작성하세요 
INSERT INTO board VALUES(board_seq.nextval, 'kkk123', '6번째글', '--', sysdate, sysdate);
select * from board;
select 

-- 2) board테이블에 2번게시물 title, content, updatedate를 수정하는 sql문을 작성하세요
UPDATE board SET title= '수정됨', content = '수정됨', updatedate = sysdate WHERE bno = 2;

-- 3) board테이블의 제목에 "질문" 단어를 검색해서 오름차순 정렬하는 sql문을 작성하세요 
select * 
from board --board에서
WHERE title LIKE '%질문%' --title에 '질문'단어가 포함되있는 것
ORDER BY title ASC; -- 오름차순 정렬 

-- 4) user테이블에 새로운 회원을 insert하는 sql문을 작성하세요
INSERT INTO members
VALUES(members_seq.nextval, '테스트id', '테스트pw', '테스트name', '테스트address');
--VALUES(유저번호(nextval), 아이디, 비밀번호, 이름, 주소);




select * from reply;

--5) 1번 게시글에 대하여 ccc가 댓글을 추가하는 insert구문을 작성하세요
INSERT INTO reply 
VALUES(reply_seq.nextval, 1, 'ccc', '댓글댓글댓글', sysdate);
--VALUES(댓글 시퀀스.nextval, 게시판 시퀀스.currval, 아이디, 내용, 날짜)



-----------------------------
/*
--[문항5]  
1) board게시판의 테이블 생성 쿼리문을 작성하세요 
    조건 - bno는 시퀀스를 이용한 자동증가 값을 갖는다. 
    조건 - writer는 회원의 id를 FK로 갖는다. 
    조건 - regdate와, updatedate는 기본값으로 현재시간을 저장한다. 
*/
CREATE TABLE board(
    bno number(10) PRIMARY KEY,
    writer VARCHAR2(20), -- FK - 작성자
    title VARCHAR2(50),
    content VARCHAR2(100), 
    regdate date default sysdate, -- 등록일
    updatedate date default sysdate, 
    CONSTRAINT board_writer_kf FOREIGN KEY (writer) REFERENCES members(id) -- user의 id를 FK로 설정
    -->CONSTRAINT (kf이름생성) FOREIGN KEY (kf지정할 컬럼) REFERENCES 참조테이름(컬럼)
);
CREATE SEQUENCE board_seq NOCACHE; -- bno시퀀스

/*
2) 댓글 테이블의 테이블 생성 쿼리문을 작성하세요 
    조건- rno는 시퀀스를 이용한 자동증가값을 갖는다. 
    조건- bno는 board의 bno를 FK로 갖는다. 
    조건 - regdate는 기본값으로 현재시간을 갖는다.
*/
create table reply(
    rno number(10) primary key, -- pk
    bno number(10), --FK = board(bno)
    writer varchar2(50),
    content varchar2(50),
    regdate date default sysdate,
    
    CONSTRAINT reply_bno_fk FOREIGN KEY (bno) REFERENCES board(bno) -- fk등록
);
create sequence reply_seq NOCACHE; --rno의 시퀀스

-------------------------------------------------------------------------------------------------------------------
create table members(
    id varchar2(50) primary key,
    pw varchar2(50),
    name varchar2(50),
    address varchar2(50)
);

--[문항6]  
--1) kkk123 회원이 작성한 글정보를 모두 가져오는 INNER OUTER JOIN구문을 작성하세요 
SELECT m.id as 아이디, b.content as 글정보
FROM members m
JOIN board b
ON m.id = b.writer
WHERE m.id = 'kkk123';

--2) aaa이 작성한 댓글정보를 모두 가져오는 LEFT OUTER JOIN구문을 작성하세요. 
SELECT m.id as 아이디, r.content as 댓글정보
FROM members m
LEFT OUTER JOIN reply r
ON m.id = r.writer
WHERE m.id = 'aaa';

--3) 게시글에 대해서 댓글의 정보를 모두 가져오는 LEFT OUTER JOIN구문을 작성하세요. 
SELECT b.bno as 게시글, r.rno as 댓글번호, r.content as 댓글정보
FROM board b
LEFT OUTER JOIN reply r
ON b.bno = r.bno;

--4) FULL OUTER JOIN에 대하여 간단하게 기술하세요
LEFT JOIN 과 RIGHT JOIN을 합친 결과로써
양쪽모두 조건이 일치하지 않는 것 까지도 모두 결합해서 출력해준다




INSERT INTO reply VALUES(reply_seq.nextval, 1, 'kkk123', '댓글댓', sysdate);
INSERT INTO reply VALUES(reply_seq.nextval, 2, 'kkk123', '댓글댓', sysdate);
INSERT INTO reply VALUES(reply_seq.nextval, 3, 'kkk123', '댓글댓', sysdate);
INSERT INTO reply VALUES(reply_seq.nextval, 6, 'kkk123', '댓글댓', sysdate);
select * from reply;

-------------------------------------------------------------------------------------------------------------------
/*
[문항7]  
board테이블의 가장최신글 순서대로 ROWNUM을 부여하여 
1-10개의 게시글만 조회하는 페이징 서브쿼리문을 작성하세요.
*/

select rownum,
        content
from (SELECT * 
        FROM board
        ORDER BY bno DESC) --최신글이 나오게 거꾸로 정렬
WHERE ROWNUM >= 1 AND ROWNUM <= 10; -- 1-10개

-------------------------------------------------------------------------------------------------------------------
--[문항8]  
--각 게시글에 대한 모든 정보와 함께, 해당 게시글에 대한 댓글 수를 가져오는 서브쿼리 구문을 작성하세요.
select *
from (SELECT *
        FROM BOARD b
        RIGHT OUTER JOIN reply r
        ON b.bno = r.bno) a
group by a.content;


SELECT *
FROM BOARD b
RIGHT OUTER JOIN reply r
ON b.bno = r.bno
group by b.content;





















