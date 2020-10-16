--문제1 
drop table membners;
create table members(
    m_name varchar2(20), 
    m_num number(20),
    reg_date date DEFAULT sysdate,
    gender varchar2(1),
    loca number(20)
);
desc members;
insert into members values('AAA', 1, '2018-07-01', 'M', 1800); -->지정된 날짜형식이라 자동으로 형 변환되어 들어간다
insert into members values('BBB', 2, '2018-07-02', 'F', 1900);
insert into members values('CCC', 3, '2018-07-03', 'M', 2000);
insert into members values('DDD', 4, sysdate, 'M', 2000);
commit;
select * from mem;



--조건) M_NAME 는 가변문자형, 널값을 허용하지 않음
alter table members modify m_name not null;

--조건) M_NUM 은 숫자형, 이름(mem_memnum_pk) primary key
alter table members add constraints mem_memnum_pk primary key (m_num);

--조건) REG_DATE 는 날짜형, 널값을 허용하지 않음, 이름:(mem_regdate_uk) UNIQUE키
alter table members modify reg_date not null add constraints mem_regdate_uk unique (reg_date);

--조건) GENDER 가변문자형 -->생성시 varchar2로 진행

--조건) LOCA 숫자형, 이름:(mem_loca_loc_locid_fk) foreign key – 참조 locations테이블(location_id)
alter table members add constraints mem_loca_loc_locid_fk foreign key (loca) references locations(location_id);

/*
문제 2.
MEMBERS테이블과 LOCATIONS테이블을 INNER JOIN 하고 
m_name, m_mum, street_address, location_id 컬럼만 조회 m_num기준으로 오름차순 조회
*/
select 
    m.m_name,
    m.m_num,
    l.street_address,
    l.location_id
from members m
inner join locations l
on m.loca = l.location_id
order by m.m_num;






























