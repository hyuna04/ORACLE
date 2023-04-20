--1) 각 과목의 과목번호, 과목명, 담당 교수의 교수번호, 교수명을 검색하라
--(NATURAL JOIN 사용)
SELECT CNO
    , CNAME
    , PNO
    , PNAME
    FROM COURSE
    NATURAL JOIN PROFESSOR;
  
--2) 화학과 학생의 기말고사 성적을 모두 검색하라(JOIN USING 사용)
SELECT SNO
    , SNAME
    , MAJOR
    , RESULT
    FROM STUDENT
    JOIN SCORE SC USING (SNO)
    WHERE MAJOR = '화학';
--3) 화학 관련 과목을 강의하는 교수의 명단을 검색한다(NATURAL JOIN 사용)
SELECT CNAME
    , PNO
    , PNAME
    FROM COURSE
    NATURAL JOIN PROFESSOR
   WHERE CNAME LIKE '%화학%';

--4) 화학과 1학년 학생의 기말고사 성적을 검색한다(NATURAL JOIN 사용)
SELECT MAJOR
    , SNAME
    , SYEAR
    , RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    WHERE MAJOR = '화학' AND SYEAR = '1';

--5) 일반화학 과목의 기말고사 점수를 검색한다(JOIN USING 사용)
SELECT C.CNAME
    , S.RESULT
    FROM COURSE C
    JOIN SCORE S
    USING (CNO)
    WHERE C.CNAME = '일반화학';
    
--6) 화학과 1학년 학생이 수강하는 과목을 검색한다(NATURAL JOIN 사용)
SELECT MAJOR
    , SYEAR
    , CNAME
    FROM STUDENT
    NATURAL JOIN COURSE
    WHERE MAJOR = '화학' AND SYEAR = '1';
