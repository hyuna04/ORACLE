--1) 성적순으로 학생의 이름을 검색하라
SELECT SNAME
 FROM STUDENT
 ORDER BY AVR DESC;

--2) 학과별 성적순으로 학생의 정보를 검색하라
SELECT *
 FROM STUDENT
 ORDER BY AVR DESC, MAJOR;

--3) 학년별 성적순으로 학생의 정보를 검색하라
SELECT *
    FROM STUDENT
    ORDER BY  SYEAR ASC, AVR DESC;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하라
SELECT *
    FROM STUDENT
    ORDER BY MAJOR, SYEAR, AVR DESC;

--5) 학점순으로 과목 이름을 검색하라
SELECT CNAME
    FROM COURSE
    ORDER BY ST_NUM;

--6) 각 학과별로 교수의 정보를 검색하라
SELECT SECTION, PNAME
    FROM PROFESSOR;

--7) 직위별로 교수의 정보를 검색하라
SELECT ORDERS
    FROM PROFESSOR;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하라
SELECT *
    FROM PROFESSOR
    ORDER BY HIREDATE ASC;