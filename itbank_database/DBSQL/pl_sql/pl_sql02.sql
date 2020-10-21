-- # 랜덤수 뽑기

DECLARE
    -- DBMS_RANDOM.value()는 0~10미만 랜덤 실수
    v_num number := ROUND(DBMS_RANDOM.VALUE(0,10)); -- 0~10 까지 랜덤 수
    -->기본으로 소수까지 출력하는 것을 ROUND로 반올림해서 출력해준다
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_num);
END;


------------------------------------------------------
-- # IF문
-- IF다음에 THEN이 꼭 들어간다
DECLARE
    v_num1 number := 1;
    v_num2 number := 2;
BEGIN
    IF v_num1 > v_num2 THEN -- IF 조건 THEN
        DBMS_OUTPUT.PUT_LINE(v_num1 || '이 큰수');
    ELSE 
        DBMS_OUTPUT.PUT_LINE(v_num2 || '이 큰 수 이다.');
    END IF; -- IF문의 끝을 정해준다
END;

------------------------------------------------------
-- # ELS IF문
-- employees에서 salary값을 구함

DECLARE
    v_salary number := 0;
    v_department_id number := 0;
BEGIN
    --선언된 변수 값을 begin에서 변경 가능하다
    v_department_id := ROUND(DBMS_RANDOM.value(10, 110), -1); --랜덤값으로 새로 대입. -1은 첫번째 자리를 반올림 
    DBMS_OUTPUT.put_line('사원번호: ' || v_department_id); -- 출력확인
    
    -- 사우너테이블에서 랜덤한 department_id를 뽑아서 salary를 조회
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id and ROWNUM = 1; --첫번째 행만 조회
    
    DBMS_OUTPUT.PUT_LINE('급여: ' || v_salary);
    
--    IF v_salary <= 5000 THEN
--        DBMS_OUTPUT.PUT_LINE('낮음');
--    ELSIF v_salary <= 9000 THEN -- else if 
--        DBMS_OUTPUT.PUT_LINE('중간');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('높음');
--    END IF;

-----------------------------------------
-- # CASE 구문
--    CASE WHEN 조건 THEN
--    END CASE;
    CASE WHEN v_salary <= 5000 THEN
                DBMS_OUTPUT.PUT_LINE('낮음');
            WHEN v_salary <= 9000 THEN
                DBMS_OUTPUT.PUT_LINE('중간');
            ELSE --default 문
                DBMS_OUTPUT.PUT_LINE('높음');
    END CASE;
END;



select MAX(department_id) from departments;
































