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
    
    commit;--commit������ �߾��ֱ�

END;
*/

select BOARD_SEQ.nextval from dual;

SELECT * FROM board;

--1. ���� ����(inline view) ����Ʈ�������� �����ؼ� ��ȸ
--2. rownum�� ���ؼ� ��ȸ
--3. rownum���� ������
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
-->�ֽű� 11~20���� �̾ƿ���
























