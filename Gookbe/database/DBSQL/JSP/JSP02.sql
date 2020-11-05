
-- �Խ��� ���̺� ����
--�۹�ȣ,�ۼ���,����,����,�����, ��ȸ��(�⺻0)
create table board(
    bno NUMBER(10, 0) not null,
    writer VARCHAR2(50) not null,
    title VARCHAR2(200) not null,
    content VARCHAR2(2000) not null,
    regdate date default sysdate,
    hit NUMBER(10,0) default 0
);
commit;
ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY (bno);
create SEQUENCE board_seq start with 1 INCREMENT by 1 NOCACHE;

select * from board order by bno desc;