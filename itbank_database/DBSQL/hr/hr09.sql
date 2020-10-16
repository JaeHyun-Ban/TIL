---------테이블 생성---------
create table dept2(
    dept_no NUMBER(2, 0), --2자리 저장, 실수는 저장x
    dept_name varchar2(14), --byte기반 가변 문자열 
    loca varchar2(13),
    dept_date DATE,
    dept_bonus number(10)
);

select * from dept2;
insert into dept2 values(99, '영업', '서울', sysdate, 2000000000); --자리수 확인

---------------테이블 수정 alter table-----------
alter table dept2
add dept_count number(3); -- 추가
desc dept2;

alter table dept2
modify dept_count number(10); --수정
desc dept2;

alter table dept2
rename column dept_count to emp_count; --컬럼명 변경
desc dept2;

alter table dept2
drop column emp_count; --컬럼 삭제
COMMIT;

---------테이블 삭제----------
drop table dept2;
--drop table dept2 cascade CONSTRAINTS 제약조건명; --해당테이블에 FK제약조건이 들어있더라고 삭제
--왜래키란 다른 테이블의 기본 키 필드를 가지는 데이터의 참조무결성을 확인하기 위해 사용된다.


--테이블데이터 전부삭제
--truncate table dept2;



























