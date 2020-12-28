select * from users;

select userid,
        username,
        userphone1,
        userphone2,
        useremail1,
        useremail2,
        addrbasic,
        addrdetail,
        addrzipnum,
        f.bno,
        f.title,
        f.regdate
from users u left OUTER join freeboard f
on u.userid = f.writer
where u.userid = 'asdasd2'
order by f.bno desc;