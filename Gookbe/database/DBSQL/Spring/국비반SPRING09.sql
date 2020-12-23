select count(*) from freeboard;


select * 
from(select rownum as rn, a.*
        from (select * 
		        from freeboard
--                where title like '%'|| '100' || '%'
--                where writer like '%'|| 'adm' || '%'
                where content like '%'|| '단어' || '%'
		        ORDER BY bno DESC) a
                )
where rn > 0 and rn <= 10;


