/*
 # 프로시저 생성
create or replace procedure 프로시저이름 (
    입력 파라미터

)

참고하면 좋은곳 
- https://goddaehee.tistory.com/163
- https://coding-factory.tistory.com/453
*/
create or replace procedure new_job_proc (
    -- 프로시저이름 in 테이블.컬럼%타입
    p_job_id in jobs.job_id%TYPE,
    p_job_title in jobs.job_title%TYPE,
    p_min_salary in jobs.min_salary%TYPE,
    p_max_salary in jobs.max_salary%TYPE    
)
is
-- 변수의 선언 영역
begin
    insert into jobs(job_id, job_title, min_salary, max_salary) --insert into 테이블(컬럼)
    values (p_job_id, p_job_title, p_min_salary, p_max_salary);
    
    commit; -- 커밋
end;


-----------------------------------------------------
-- # 프로시저 실행
execute new_job_proc('JOBS1', 'test...', 1000, 5000);
execute new_job_proc('JOBS2', 'test2...', 2000, 10000); -- 두번 넣으면 무결성제약조건 에러
-->jobs테이블에 입력받은 값이 바로 추가되었다.
select * from jobs;

--------------------------------------------------------------
-- # 프로시저 수정은 동일한 이름으로 수정
CREATE OR REPLACE PROCEDURE new_job_proc( --구문 그대로 생성(CREATE) 또는(OR) 수정(REPLACE)로 쓰이는구나
    p_job_id in jobs.job_id%TYPE,
    p_job_title in jobs.job_title%TYPE,
    --    p_job_min_salary in jobs.min_salary%TYPE,
    p_job_min_salary in jobs.min_salary%TYPE := 0, -->미리 값을 지정할 수 있다.
    p_job_max_salary in jobs.max_salary%TYPE := 0
)
IS
    v_count number := 0;
BEGIN
    --중복을 확인해보자
    SELECT COUNT(*)
    INTO v_count --존재하면 그 값을 카운트에 넣어준단
    FROM jobs
    WHERE job_id = p_job_id; -- 매개변수 p_job_id기반으로 조회를 해서 카운트해준다
    
    --없다면 insert
    IF v_count = 0 THEN
        INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
        VALUES (p_job_id, p_job_title, p_job_min_salary, p_job_max_salary);
    ELSE -- 있다면
        UPDATE jobs SET job_title = p_job_title,
                               min_salary = p_job_min_salary,
                               max_salary = p_job_max_salary
        WHERE job_id = p_job_id;
    END IF;
    
    commit; -- 커밋 해주기
END;

--값을 넣어서 확인해보기
EXECUTE new_job_proc('JOBS2', 'test2...', 5000, 30000); --중복된부분의 값이 수정된 것을 확인 할 수 있다.
EXECUTE new_job_proc('JOBS2', 'test2...'); 
--> 파라미터의 갯수가 부족하면 실행되지 않는다
-->하지만 프로시저에 기본 매개값이 선언되어 있다면, 생략이 가능하다.
select * from jobs;


--------------------------------------------------------
-- # OUT 매개변수
-- OUT변수를 사용하는 프로시저는 익명블록에서 실행을 한다.
CREATE OR REPLACE PROCEDURE new_job_proc02(
    p_job_id in jobs.job_id%TYPE, -- IN 매개변수는 값을 넣어주기만 한다
    p_job_title in jobs.job_title%TYPE,
    p_min_salary in jobs.min_salary%TYPE := 0, -- 기본값 설정
    p_max_salary in jobs.max_salary%TYPE,
    p_result OUT varchar2 -- OUT 매개변수는 외부로 출력을 위한것이다
    
) IS
    v_count number := 0;
    v_result varchar(100) := '값이 없어서 insert처리 되었습니다.';

BEGIN
    -- job_id로 조회해서 있다면 v_count에 담아주자
    SELECT COUNT(*)
    INTO v_count
    FROM jobs
    WHERE job_id = p_job_id;
    -- 없다면 파라미터값을 insert 
    IF v_count = 0 THEN
        INSERT INTO jobs 
        values (p_job_id, p_job_title, p_min_salary, p_max_salary);
    ELSE -- 필요한 결과 추출
        SELECT p_job_id || '의 최대연봉: ' || max_salary || ', 최소연봉: ' || min_salary
        INTO v_result
        FROM jobs
        WHERE job_id = p_job_id;
    END IF;
    
    p_result := v_result; --out변수에 결과를 할당
    
END;

-- OUT프로시저의 실행
DECLARE
    str varchar2(100); --문자열 크기 지정 필수!
    
BEGIN
    --OUT변수를 프로시저에 전달해서, 할당된 결과값을 받아서 처리
    new_job_proc02('SM_JOB1', 'sample job1', 2000, 6000, str);
    DBMS_OUTPUT.put_line(str);
    new_job_proc02('CEO', 'sample ceo', 10000, 90000, str);
    DBMS_OUTPUT.put_line(str);
END;
/*
SM_JOB1의 최대연봉: 6000, 최소연봉: 2000
값이 없어서 insert처리 되었습니다.

PL/SQL 프로시저가 성공적으로 완료되었습니다.

SM_JOB1의 최대연봉: 6000, 최소연봉: 2000
CEO의 최대연봉: 90000, 최소연봉: 10000
*/

---------------------------------------------------
-- # IN 0UT 처리 형태
CREATE OR REPLACE PROCEDURE testProc(
    p_var1 in varchar2, -- 좋지않은 형태
    p_var2 out varchar2,
    p_var3 in out varchar2
    
) IS

BEGIN
   
    DBMS_OUTPUT.PUT_LINE(p_var1); -- x, IN, OUT이 없다면 단순히 사용만 가능
    DBMS_OUTPUT.PUT_LINE(p_var2); -- out, OUT변수는 프로시저가 끝나기 전까지 값의 할당이 안됨.
    DBMS_OUTPUT.PUT_LINE(p_var3); -- in out, IN, OUT은 둘 다 사용 가능
    
--    p_var1 := '결과1'; --'P_VAR1' 식은 피할당자로 사용될 수 없습니다, 할당 불가
    p_var2 := '결과2';
    p_var3 := '결과3';
    
END;

--실행해보자
DECLARE 
    var1 varchar2(50) := 'A'; -- 출력 o
    var2 varchar2(50) := 'B'; -- 출력 x
    var3 varchar2(50) := 'C'; -- 출력 o
BEGIN
    testProc(var1, var2, var3);
    -- OUT만 작성된 것은 오로지 나가는것 밖에 안된다
    DBMS_OUTPUT.put_line(var2);
    DBMS_OUTPUT.put_line(var3);
    
END;


---------------------------------------------------------------------------
-- # return 구문
/*
1. employees에서
job_id만 in변수로 입력받아서, 해당 아이디가 있는지 확인하고,
없다면, 단순히 프로시저 안에서 출력만 해준다.

2. job_id가 있다면, 동일한 job_id를 가진 급여의 합계를 출력해주세요.
*/
CREATE OR REPLACE PROCEDURE new_emp_proc(
    p_job_id IN employees.job_id%TYPE --job_id만 in으로 입력
) IS
    v_count number := 0; --중복확인용 v_count
    v_salary number := 0; --급여 합계
    
BEGIN
    SELECT COUNT(*)
    INTO v_count --값을 대입
    FROM employees
    WHERE job_id = p_job_id; --존재한다면
    
    IF v_count = 0 THEN -- 중복이 아니라면
        DBMS_OUTPUT.PUT_LINE('p_job_id: ' || p_job_id); --단순 출력해주기
    ELSE -- 존재한다면    
        SELECT sum(salary) -- 급여의 합만 추출해서
        INTO v_salary -- 저장해주고
        FROM employees
        WHERE job_id = p_job_id; --중복인 id의 
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(p_job_id || '의 급여 합: ' || v_salary);
    
END;

EXECUTE new_emp_proc('IT_PROG'); --job_id입력해서 확인하기






































