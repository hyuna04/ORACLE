--1) 송강 교수가 강의하는 과목을 검색한다
SELECT *
    FROM PROFESSOR
    WHERE PNAME = '송강';

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT *
    FROM PROFESSOR
    WHERE SECTION = '화학';

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
--    SELECT C.ST_NUM, C.CNAME, P.PNAME
--    FROM COURSE C 
--    INNER JOIN PROFESSOR P
--    ON C.ST_NUM = 2 AND C.PNO = P.PNO;
-- -> X
SELECT C.ST_NUM, C.CNAME, P.PNAME
    FROM COURSE C 
    INNER JOIN PROFESSOR P
    ON C.PNO = P.PNO
    WHERE C.ST_NUM = 2 AND C.PNO = P.PNO;

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT PF.SECTION, CR.PNO, CR.CNAME
    FROM PROFESSOR PF
    INNER JOIN COURSE CR
    ON PF.SECTION = '화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT ST.MAJOR, ST.SYEAR, ST.SNO, ST.SNAME, SC.RESULT
    FROM STUDENT ST
    INNER JOIN SCORE SC
    ON ST.SNO = SC.SNO
    WHERE ST.MAJOR = '화학' AND ST.SYEAR = 1;

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT CR.CNAME, SC.RESULT, SC.SNO
    FROM COURSE CR
    INNER JOIN SCORE SC
    ON CR.CNO = SC.CNO
    WHERE CR.CNAME = '일반화학';

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT ST.MAJOR, ST.SYEAR, SC.RESULT
    FROM STUDENT ST
    INNER JOIN SCORE SC
    ON ST.SNO = SC.SNO
    WHERE ST.SYEAR = 1 AND ST.MAJOR = '화학';

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT ST.SNO
     , ST.SNAME
     , ST.SYEAR
     , ST.MAJOR
     , CO.CNO
     , CO.CNAME
    FROM STUDENT ST
    JOIN SCORE SC
    ON ST.SNO = SC.SNO
    JOIN COURSE CO
    ON CO.CNO = SC.CNO
    WHERE ST.MAJOR = '화학'
      AND ST.SYEAR = 1;

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT ST.SNO
     , ST.SNAME
     , ST.SYEAR
     , ST.MAJOR
     , SC.RESULT
     , SG.GRADE
    FROM STUDENT ST, COURSE CO, SCORE SC, SCGRADE SG
    WHERE SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
    AND GRADE = 'F';
    
SELECT * FROM SCGRADE;
