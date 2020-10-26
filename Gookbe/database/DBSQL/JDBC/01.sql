create table member(
    id varchar2(30) primary key,
    pw varchar2(30),
    name varchar2(30),
    email varchar2(30)
);

insert into member values ('test01', '1234', '홍길동', 'naver');
insert into member values ('test02', '1234', '이순신', 'naver');
insert into member values ('test03', '1234', '홍길자', 'google');


commit; -- commit 잊지말고 꼭 해주기, 이게 일어나야 진짜 데이터가 들어 간 거다

select * from member;

























