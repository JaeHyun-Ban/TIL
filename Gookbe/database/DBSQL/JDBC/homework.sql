drop table book;
drop table users;
drop table rental;

drop table rental;
drop table book;
drop table users;

--책 테이블
create table book(
   bno varchar2(255) primary key,
   name varchar2(50),
   writer varchar2(50),
   regdate date default sysdate
);
--회원정보
create table users(
   id varchar2(50) primary key,
   name varchar2(50),
   phone varchar2(50)
);

--대여목록
create table rental(
   rental_id varchar2(50),
   rental_bno varchar2(255),
   rental_date date default sysdate,
   return_date date,
   CONSTRAINT rental_id_fk FOREIGN key (rental_id) REFERENCES users(id),
   CONSTRAINT rental_bno_fk FOREIGN key (rental_bno) REFERENCES book(bno)
);


commit;
select * from users;
