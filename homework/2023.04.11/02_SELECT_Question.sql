--1) 각 학생의 평점을 검색하라(별칭을 사용)
SELECT SNAME , AVR AS 평점
FROM STUDENT;

--2) 각 과목의 학점수를 검색하라(별칭을 사용)
SELECT CNAME, ST_NUM AS 학점
FROM COURSE;

--3) 각 교수의 지위를 검색하라(별칭을 사용)
ELECT PNAME, ORDERS AS 지위
FROM PROFESSOR;

--4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별칭을 사용)
SELECT SAL AS 이전급여, SAL*1.1 AS 이후급여
FROM EMP;

--5) 현재 학생의 평균 평점은 4.0만점이다. 
--이를 4.5만점으로 환산해서 검색하라(별칭을 사용)
SELECT AVR AS 이전평점, AVR/4*4.5 AS 이후평점
FROM STUDENT;


