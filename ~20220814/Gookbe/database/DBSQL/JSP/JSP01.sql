create table users (
    id varchar2(30) not null,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    email VARCHAR2(30),
    address VARCHAR2(30),
    regdate date default sysdate
);

alter table users add CONSTRAINT users_pk PRIMARY KEY (id);

select * from users;
select * from board;

select * from users where id = 'asd123' and pw = '1234';

update board SET title = 'aaa', content = 'aaa' WHERE bno = 2;

DELETE FROM board WHERE bno = 2;

commit
