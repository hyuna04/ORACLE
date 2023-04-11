--1--1) 화학과 학생을 검색하라
SELECT *
    FROM STUDENT
    WHERE MAJOR = '화학';

--2) 평점이 2.0 미만인 학생을 검색하라
SELECT *
    FROM STUDENT
    WHERE AVR < 2.0;

--3) 관우 학생의 평점을 검색하라
SELECT SNAME, AVR
    FROM STUDENT
    WHERE SNAME = '관우';

--4) 정교수 명단을 검색하라
SELECT *
    FROM PROFESSOR
    WHERE ORDERS = '정교수';

--5) 화학과 소속 교수의 명단을 검색하라
SELECT *
    FROM PROFESSOR
    WHERE SECTION = '화학';

--6) 송강 교수의 정보를 검색하라
SELECT *
    FROM PROFESSOR
    WHERE PNAME = '송강';

--7) 학년별로 화학과 학생의 성적을 검색하라
SELECT SNAME, MAJOR, AVR
    FROM STUDENT
    WHERE MAJOR = '화학';

--8) 담당 교수가 없는 과목의 정보를 검색하라
SELECT *
    FROM COURSE
    WHERE PNO IS NULL;

