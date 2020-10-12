SELECT * FROM employees;

--형변환 함수 TO_CHAR, TO_NUMBER, TO_DATE
--NUMBER -> CHARACTER -> DATE
--DATE -> CHARACTER -> NUMBER
-----------------------------------------------------------------------------------------------
--# 날짜를 문자로 TO_CHAR(날짜, 형식)
SELECT to_char(sysdate, 'YYYY-MM-DD') FROM dual; --날짜fnt 형식은 대문자로 표기
SELECT to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') FROM dual;
SELECT to_char(sysdate, 'YY-MM-DD HH24:MI') FROM dual;-- 24시간으로 표기

SELECT to_char(sysdate, 'YYYY"년"MM"월"DD"일"')FROM dual; 
-->날짜 fnt형식이 아니면 사용이 불가능한 경우 " " 묶어서(한글) 표현
SELECT first_name, to_char(hire_date, 'YYYY-MM-DD') FROM employees;

-- #숫자를 문자로 TO_CHAR(숫자, 형식)
SELECT to_char(20000, '99999999') FROM dual;
-->99999999 = 8자리 형식으로 들어가겟다, 9 = 자리수의 표현
SELECT to_char(20000, '999') FROM dual;

SELECT to_char(20000.21, '99999')FROM dual;
SELECT to_char(20000.21, '99999.99') FROM dual;
SELECT to_char(salary, '$99999') FROM employees; 
-->달러도 숫자에서 사용 가능한 fnt형식이다
SELECT to_char(salary, '$99,999') FROM employees; 
--> ' , '도 가능한 fnt형식

-----------------------------------------------------------------------------------------------
--# 문자를 숫자로 TO_NUMBER(문자, 형식)
SELECT '2000' + 2000 FROM dual; -- 자동 형 변환되서 계산한다
SELECT to_number('2000') + 2000 FROM dual;-- 명시적형변환
SELECT '$2000'  + 2000 FROM dual;--문자형이 $ , 같은 특정문자를 지니고 있다면 자동형변환이 불가능하다.
SELECT to_number('$2000', '$9999') FROM dual;-- 숫자 fnt이 지원되는 형식을 가진경우, 명시적인 형변환이 가능하다

-----------------------------------------------------------------------------------------------
-- (중요)★# TO_DATE(char, 'fmt')★
--문자를 날짜 형식으로 변환
SELECT TO_DATE('2020-03-31') FROM dual; --이런 경우는 ㅂ자로 사용이 가능하다.
SELECT to_date('2020/12/12', 'YY/MM/DD') FROM dual; --날짠 fnt를 이용해서 변경도 가능
SELECT to_date('2020-03-21 12:23:03', 'YY-MM-DD HH:MI:SS') FROM dual;
-->이런 경우는 시/분/초 또한 같이 fnt형식으로 작성해 주어야 한다, 날짜fnt이 지원하는 형식을 가진경우. 형변환이 가능

-----------------------------------------------------------
--# null값일 경우- 1.null일 경우, 2. null이 아닐 경우
--★NVL(데이터, null일경우 처리할 것) -null제거
SELECT nvl(null, 0)FROM dual;
SELECT concat(first_name, last_name) as name
        , salary
        , salary + salary * nvl(commission_pct, 0) 
FROM employees;
-->commission_pct에 null연산이 들어가는 경우 null값이 나오게 되는데, null인 경우 0으로 변경해서 사용


-----------------------------------------------------------
--#★NVL2(데이터, null이 아닌경우 처리, null인 경우처리) -null제거
SELECT nvl2(null, '널아닐때', '널일때') FROM dual;
SELECT first_name,
        nvl2(commission_pct, 'true', 'false')
FROM employees;
SELECT first_name,
        nvl2(commission_pct,
                salary + salary * commission_pct,
                salary) as 최종급여
FROM employees;
-->null이라면 단순히 salary null이 아니라면 보너스 급액 + salary를 출력

-----------------------------------------------------------
--#★DECODE(데이터, '비교값1', 결과1,
--                        '비교값2', 결과2
--                                 기본값(선택이 없다면)) 마지막은 ELSE구문처럼 쓰인다
SELECT DECODE('A',  'A', 'A입니다',
                            'B', 'B입니다',
                            'C', 'C입니다',
                                'A, B, C가 아닙니다') 
FROM dual;

SELECT job_id,
          salary,
          decode(job_id, 'IT_PROG', salary * 100,
                              'AD_VP', salary * 200,
                              'FI_MGR', salary * 300,
                                         salary)
FROM employees;

-- case when then end
-->특정 조건에 따라 다른 결과값으로 보내주게 한다
SELECT job_id,
          salary,
          (CASE job_id WHEN 'IT_PROG' THEN salary * 100
                           WHEN 'AD_VP' THEN salary * 200
                           WHEN 'FI_MGR' THEN salary * 300
                           else salary
            END)
FROM employees;

--------------------연습 문제------------------------------------
--문제 1.
--현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 근속년수가 10년 이상인
--사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
SELECT employee_id AS 사원번호,
--         first_name ||' '|| last_name AS 사원명, 
         CONCAT(first_name, last_name) AS 사원명,
         hire_date AS 입사일자,
         TRUNC((SYSDATE - hire_date) / 365) AS 근속년수
FROM employees
WHERE TRUNC((SYSDATE - hire_date) / 365) >= 10 
ORDER BY hire_date ASC;

--문제 2
SELECT first_name,
          manager_id,
          DECODE(manager_id, 100, '사원'
                                    ,120, '주임'
                                    ,121, '대리'
                                    ,122, '과장'
                                         , '임원') AS 직급
FROM employees
WHERE department_id = 50;




















