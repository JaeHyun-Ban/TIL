select * from employees;

-- # 트랜잭션 - 작업수행단위(데이터베이스의 안전장치)
-- 현재 트랜젝션여부

show autocommit; 
set autocommit on;
set autocommit off;

select * from depts; 
delete from depts where department_id = 10;
--세이브포인트 생성
savepoint delete_10;

delete from depts where department_id = 20;
savepoint delete_20;

delete from depts; --전부 삭제
ROLLBACK; --최종커밋 이후까지 되돌림
ROLLBACK TO delete_10;
ROLLBACK to delete_20;

commit; -- 커밋 이후에는 어떤 방법으로도 되돌릴 수 없음



















