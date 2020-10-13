SELECT * FROM employees;

--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('1', 'JAVA', 'IS...')
--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('2', 'JSP', 'IS..')
--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('3', 'SPRING', 'IS...')
--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('4', 'ORACLE', 'IS...')
--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('5', 'MYSQL', 'IS...')
--INSERT INTO "HR"."INFO" (ID, TITLE, CONTENT) VALUES ('6', 'C', 'IS...')

--INSERT INTO "HR"."AUTH" (USER_ID, NAME, JOB) VALUES ('1', '박인욱', 'TEACHER')
--INSERT INTO "HR"."AUTH" (USER_ID, NAME, JOB) VALUES ('2', '홍길동', 'DEVELOPER')
--INSERT INTO "HR"."AUTH" (USER_ID, NAME, JOB) VALUES ('3', '이순신', 'DESIGNER')
--INSERT INTO "HR"."AUTH" (USER_ID, NAME, JOB) VALUES ('4', '고길동', 'DBA')
--INSERT INTO "HR"."AUTH" (USER_ID, NAME, JOB) VALUES ('5', '박인욱', 'DEVELOPER')


SELECT * FROM info;
SELECT * FROM auth;


--# INNER JOIN
SELECT *
FROM info 
INNER JOIN auth 
ON info.user_id = auth.user_id;
-->연결된 똑같은 컬럼이 2개가 보인다
-->null인 부분은 자동으로 제외해서 출력하지 않는다

--SELECT 구문에 필요한 컬럼 지정 - 보고싶은 것만 뽑아서 확인
--양쪽 테이블에 동일한 이름으로 존재하는 컬럼을 적으면 `열의 정의가 모호하다` 는 에러를 출력하낟
--이런 경우 `테이블이름.컬럼` 으로 지칭해서 정상적인 조회가 가능하다
SELECT id, 
          title,
          content,
          regdate,
          name,
          job,
          info.user_id 
          -->user_id는 두 테이블이 모두 가지고 있기 때문에 하나를 직접 선택해서 뽑아준다
FROM info INNER JOIN auth ON info.user_id = auth.user_id;

--# 테이블이름에 알리아스(Alias)를 이용해서 join을 할 수 있다.
SELECT title,
          content,
          regdate,
          name,
          job,
          a.user_id
FROM info i INNER JOIN auth a ON i.user_id = a.user_id
WHERE name = '홍길동';

--# OUTER JOIN
-- left outer, right outer, full outer
SELECT * FROM info i LEFT OUTER JOIN auth a ON i.user_id = a.user_id;
-->가장 많이 사용하는 것이 left outer join
--> from에 사용된 테이블을 왼쪽으로 기준잡고 오른쪽에 join을 배치한다
--> null인 부분도 출력해서 보여준다.

SELECT * FROM info i RIGHT OUTER JOIN auth a ON i.user_id = a.user_id;
--from테이블을 오른쪽에 기준을 잡고 join테이블을 왼쪽에 넣어준다  

SELECT * FROM info i FULL OUTER JOIN auth a ON i.user_id = a.user_id;

--잘못된 join형태 cross join
SELECT * FROM info i CROSS JOIN auth a;
--> 총테이블 개수 x 총테이블 개수


--3개 테이블을 JOIN하는것도 가능하다. 키 값만 찾아서 구문을 연결해서 쓰면된다.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT * 
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
ON d.location_id = l.location_id;


-------------------------------------연습
--테이블 auth와 info에서 Alias a, i를 이용해서 left join - job컬럼이 DBA인 사람의 ID, TITLE, CONTENT, JOB만 출력
--right join으로 달라지는 결과만 확인

--left outer join
SELECT ID,
          TITLE,
          CONTENT,
          JOB
FROM info i -- 드라이빙 테이블(첫번째로 ACCESS되는 테이블)
LEFT OUTER JOIN auth a ON i.user_id = a.user_id --왼쪽 기준(info)
WHERE job = 'DBA'; --info에는 job이 존재하지 않는다


--right outer join
SELECT id,
          title,
          content,
          job
FROM info i -- 드라이빙 테이블
RIGHT OUTER JOIN auth a ON i.user_id = a.user_id --오른쪽 기준(auth)
WHERE job = 'DBA'; --auth에는 job이 존재한다
-->info left(주), auth right

-- self join (하나의 테이블에 연결된 키값으로 조인)
SELECT * 
FROM employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.manager_id
ORDER BY e1.employee_id;





























