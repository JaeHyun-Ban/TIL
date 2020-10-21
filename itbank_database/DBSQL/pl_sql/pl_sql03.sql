-- # While 구문
-- WHILE 조건
-- LOOP -->참 일시 루프 실행
-- END LOOP;

DECLARE
    v_dan number := 3; -- 3단
    v_count number := 1;
BEGIN
    
    WHILE v_count <= 9 --v_count가 9보다 작으면 실행
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || v_count || ' = ' || v_dan * v_count);
                
        v_count := v_count + 1; -- `+=`는 사용안됨
    END LOOP;
END;

-----------------------------------------------------------
-- # 탈출문
-- EXIT WHEN 조건
DECLARE
    v_count number := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        DBMS_OUTPUT.PUT_LINE('숫자: ' || v_count);
        
        EXIT WHEN v_count = 5; --v_count가 5라면 탈출
        
        v_count := v_count + 1;
    END LOOP;
    
END;

-----------------------------------------------------------
-- # FOR문
DECLARE 
    v_dan number := 3;
BEGIN
    FOR i in 1..9 -- 1~9가지
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || i || ' = ' || v_dan * i);
    END LOOP;
END;

-----------------------------------------------------------
-- # continue문
-- CONTINUE WHEN 조건
DECLARE
    
BEGIN
    FOR i in 1..9
    loop
        CONTINUE WHEN I = 5; -- i 가 5라면 넘김
        DBMS_OUTPUT.PUT_LINE('i = ' || I);
    end loop;
END;

--------------------------------------
-- quiz ) 모든 구구단을 출력하는 익명 블록을 출력!!!
DECLARE
    v_dan number := 2;
BEGIN
    WHILE v_dan <= 9 
    LOOP
        DBMS_OUTPUT.PUT_LINE('-----' || v_dan || '단-----');
        FOR i IN 1..9
            LOOP
                DBMS_OUTPUT.PUT_LINE(v_dan || ' x ' || i || ' = ' || v_dan * i);
            END LOOP;
        DBMS_OUTPUT.PUT_LINE('--------------------------------');
    v_dan := v_dan + 1;
    END LOOP;
END;
-->for문을 2번 작성해서 만드는 것도 가능











































