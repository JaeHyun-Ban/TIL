
SELECT * FROM employees;

--숫자 함수
-- # ROUND - 반올림, TRUNC - 절삭
SELECT ROUND(34.145, 2) -->2번째 자리까지 반올림
        , ROUND(34.145, -1) --> 소수점 왼쪽 자리 수 만큼 반올림
        , ROUND(34.145)
FROM DUAL;

SELECT trunc(34.145)
        , trunc(34.145, -1)
FROM DUAL;

-----------------------------------------------------------------------------------------------------
-- 날짜 함수
SELECT SYSDATE FROM dual; --년월일
-->사칙연산이 가능하다
SELECT SYSTIMESTAMP  FROM dual; --년월일 시분초 시간차

-----------------------------------------------------------------------------------------------------
--# 날짜의 연산
SELECT SYSDATE + 3 FROM dual; -- 일 + 3
SELECT SYSDATE - 3 FROM dual; --일 - 3
SELECT sysdate - hire_date from employees; --일수의 값으로 리턴된다
SELECT (sysdate - hire_date) / 7 from employees; -- 주( / 7)
SELECT (sysdate - hire_date) / 365 from employees; --년(365)


-----------------------------------------------------------------------------------------------------
--# 날짜 반올림, 절삭
SELECT trunc(sysdate - hire_Date)FROM employees;

-- 특정 포맷형식으로 날짜 절삭
SELECT trunc(sysdate, 'year') FROM dual; --년 기준으로 절삭
SELECT trunc(sysdate, 'month') FROM dual;--월 기준으로 절삭
SELECT trunc(sysdate, 'day') FROM dual;-- 일 기준으로 절삭
























