create table score(
    num number(10),
    name varchar2(30),
    kor VARCHAR2(30),
    eng VARCHAR2(30),
    math VARCHAR2(30)
);
alter table score ADD CONSTRAINT score_pk PRIMARY KEY (num);
CREATE SEQUENCE score_seq START WITH 1 INCREMENT BY 1 NOCACHE;

select * from score;



create table board(
    num number(10),
    name varchar2(30),
    title varchar2(30),
    content varchar2(1000)
);
ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY(NUM);
CREATE SEQUENCE board_seq START WITH 1 INCREMENT BY 1 NOCACHE;
select * from board;
