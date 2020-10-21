-- 1. 단순 출력문으로 3 x 1 = 3 문자열을 출력하세요
DECLARE
    x number:=3;
    y number:=1;
BEGIN
    DBMS_Output.Put_Line( x || 'x' || y || '=' || ( x * y ));
END;

--2. 사원 테이블에서 201번의 사원의 이름과 이메일주소를 출력하는
-- 익명블록을 생성하면된다.
select * from employees;
DECLARE
    emp_lastname employees.last_name%TYPE;
    emp_firstname employees.first_name%TYPE;
    emp_email employees.email%TYPE;
BEGIN
    SELECT first_name, last_name, email
    INTO emp_firstname, emp_lastname, emp_email
    FROM employees
    WHERE employee_id = 201;
    
    DBMS_OUTPUT.put_line('이름: ' || emp_firstname || emp_lastname || ', 이메일주소: ' || emp_email);
END;


-- 3. 사원테이블에서 사원번호가 가장 큰 사원을 찾은 후에
-- 이 번호 +1번으로 아래 사원을 emps테이블(employees복사)에 추가하세요.
-- 이름-steven, 이메일 - stevenjobs, 입사일-오늘날짜, job_id - CEO
CREATE TABLE emps AS (SELECT * FROM EMPLOYEES WHERE 1=2); 
--> where 1 = 2로 false를 발생키셔 테이블의 컬럼만 복사하게 되고 데이터는 가져오지 않게된다.

DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id) -- max그룹함수이다
    INTO v_emp_id
    FROM employees;
    
    INSERT INTO emps(employee_id, last_name, email, hire_date, job_id)
    VALUES (v_emp_id + 1, 'steven', 'stevenjobs', sysdate, 'CEO');
END;
select * from emps;















































