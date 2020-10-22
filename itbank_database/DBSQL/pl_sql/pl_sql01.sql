/*
절차형 SQL문(PL/SQL)

자바에서 하는거 대부분 오라클에서 된다
오라클에서 제공되는 프로그래밍 같은 기능이다
쿼리문을 순서대로 어떤 동작을 일괄처리하기 위해서 사용된다. -- 실행문을 통째로 컴파일 해버린다

정차형 SQL은 필요한 코드부분만 선택해서 F5 컴파일 시킨다
*/

--오라클 접속시 출력구문을 사용할 수 잇게 변경
set SERVEROUTPUT ON; 
-->이걸 F5로 한번 실행시켜 준다

DECLARE -- 변수를 선언하는 부분
    v_num number; --숫자같은 경우는 크기가 지정되지 않아도 된다.
BEGIN
    v_num := 100;
    DBMS_OUTPUT.put_line(v_num);
END;

--내가 실행시키고 싶은 부분만 `드래그 후 F5로 실행`해준다
-->무조껀 내가 실행하고 싶은 부분만 골라서 실행해준다.

------------------------------------------------------------------------------
/*
연산자
일반 SQL문에서 사용하는 모든 연산자가 사용가능하다. ex)<>, !=, ==...

- 특별한 연산자 `**` - 제곱
- `||` - 문자열 붙이기 연산자

*/
DECLARE
    a number := (1+2) ** 2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('a는: ' || a);
END;


------------------------------------------------------------------------------
/*
-- # DML문(Data Mainpulation Language) 
한마디로 데이터를 입력(insert),수정(update),삭제(delete),수행(merge)하는 기능이다
DDL이 사용이 불가능
일반적인 SQL문의 SELECT구문을 사용하는데.(begin에서)
SELECT절 아래에는 `INTO절`을 이용해서 변수를 할당한다.
*/

DECLARE
    v_emp_name varchar2(50); --문자열은 선언시 길이제약을 해줘야 한다
    v_dep_name varchar2(50);
BEGIN
    SELECT last_name, department_name --이름, 부서이름
    INTO v_emp_name, v_dep_name --DECLARE에서 선언한 변수에 할당해준다
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE e.employee_id = 100;
    
    --출력해보기
    DBMS_OUTPUT.put_line('이름: ' || v_emp_name || ', 부서이름: ' || v_dep_name);
END;


------------------------------------------------------------------------------
/*
# TYPE 키워드
-- 해당 테이블의 같은 타입의 컬럼을 변수타입으로 선언하려면
-- (테이블).(컬럼명)%TYPE  으로 작성해줕다.
*/

DECLARE
    v_emp_name employees.last_name%TYPE; --v_emp_name 타입(employees.last_name와 똑같이)
    v_dep_name departments.department_name%TYPE;
BEGIN
    SELECT last_name, department_name
    INTO v_emp_name, v_dep_name
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;
    
    INSERT INTO emp_test VALUES (v_emp_name, v_dep_name); --생성한 테이블에 선언한 값을 넣어준다
    
    DBMS_OUTPUT.put_line('이름: ' || v_emp_name || ', 회사이름: ' || v_dep_name); -- 출력해서 확인
END;


CREATE TABLE emp_test(  
    emp_name varchar2(50),
    dep_name varchar2(50)
);
SELECT * FROM emp_test; --선언한 값이 제대로 들어왔는지 확인





























