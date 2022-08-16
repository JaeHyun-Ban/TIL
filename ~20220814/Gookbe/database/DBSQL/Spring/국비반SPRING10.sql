select * from freereply;
UPDATE freereply
 		SET reply = '수정된 문장', 
 			updatedate = sysdate 
 		where rno = 1 and replyPw = 1234;
commit;


--DECLARE
--    var1 number := 1;
--BEGIN
--
--    while var1 <= 100
--    LOOP
--        
--        insert into freereply values(303, FREEREPLY_SEQ.nextval, 'test', 'admin', 1234, sysdate, sysdate);
--        var1 := var1 + 1;
--        
--    end loop;
--    commit;
--END;
SELECT *
		FROM (SELECT ROWNUM as rn,
					a.*
		FROM (SELECT *
			FROM freereply
			WHERE bno = 303
			ORDER BY rno DESC) a
) WHERE rn > (페이지넘버 - 1) * 데이터개수 AND rn <= 페이지넘버 * 데이터개수;























