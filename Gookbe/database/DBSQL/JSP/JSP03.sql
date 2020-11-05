/*
DECLARE

    var1 NUMBER := 1;
    
BEGIN

    WHILE var1 <= 300
    LOOP
        INSERT INTO board(bno, writer, title, content) VALUES(BOARD_SEQ.nextval, 'test', 'test', 'test');
        INSERT INTO board(bno, writer, title, content) VALUES(BOARD_SEQ.nextval, 'admin', 'admin', 'admin');
        INSERT INTO board(bno, writer, title, content) VALUES(BOARD_SEQ.nextval, 'test02', 'test02', 'test02');
        
        var1 := var1 + 1;
        
    end LOOP;
    
    commit;--commit빼먹지 발아주기

END;
*/

select BOARD_SEQ.nextval from dual;

SELECT * FROM board;

--1. 가장 안쪽(inline view) 셀렉트구문에서 정렬해서 조회
--2. rownum을 구해서 조회
--3. rownum으로 조건절
SELECT * 
FROM(
    SELECT ROWNUM rn, 
           bno,
           writer,
           title,
           content,
           regdate,
           hit
    FROM (SELECT *
          FROM board
          ORDER BY bno DESC)
    ) 
WHERE rn > 0 AND rn <= 10; 
-->최신글 11~20번만 뽑아오기
























