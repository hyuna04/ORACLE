--1) STUDENT 테이블을 참조하여 ST_TEMP 테이블을 만들고 모든 학생의 성적을 
--4.5만점 기준으로 수정하세요
-- ST_TEMP 테이블 생성
CREATE TABLE ST_TEMP AS
SELECT SNO, SNAME, SEX, SYEAR, MAJOR, AVR
FROM STUDENT;

-- AVR 필드를 4.5 만점 기준으로 수정
UPDATE ST_TEMP
SET AVR = AVR / 100 * 4.5;

-- 결과 확인
SELECT *
FROM ST_TEMP;

--2) PROFESSOR 테이블을 참조하여 PF_TEMP 테이블을 만들고 모든 교수의 부임일자를 
--100일 앞으로 수정하세요
-- PF_TEMP 테이블 생성
CREATE TABLE PF_TEMP1 AS SELECT * FROM PROFESSOR;

SELECT *
FROM PF_TEMP1;
-- 모든 교수의 HIREDATE(임용일시)를 100일 앞으로 수정
UPDATE PF_TEMP1 SET HIREDATE = HIREDATE - 100;

SELECT *
FROM PF_TEMP1;
--3) ST_TEMP 테이블에서 화학과 2학년 학생의 정보를 삭제하세요
DELETE FROM ST_TEMP1 WHERE MAJOR='화학' AND SYEAR=2;

SELECT *
FROM ST_TEMP1;
--4) PF_TEMP 테이블에서 조교수의 정보를 삭제하세요
DELETE FROM PF_TEMP2 WHERE ORDERS = '조교수';

SELECT *
FROM PF_TEMP2;
--5) EMP 테이블을 참조하여 EMP2 테이블을 만들고 DNO = 30인 사원의 보너스를 15프로 상승시킨 값으로 변경하시고 
--   DNO = 20인 사원의 급여를 10프로 상승시킨 값으로 변경하세요.
CREATE TABLE EMP2
    AS (SELECT * FROM EMP);

UPDATE EMP2
    SET
        COMM = COMM * 1.15
        WHERE DNO = '30';
    SET
        SAL = SAL * 1.10
        WHERE DNO = '20';



SELECT ENO
     , ENAME
     , SAL
     ...

--6) 화학과 2학년 학생중 기말고사 성적의 등급이 A, B인 정보를 갖는 테이블 SCORE_STGR을 생성하세요.
--(SNO, SNAME, MAJOR, SYEAR, RESULT, GRADE)
CREATE TABLE SCORE_STGR
    AS (
        SELECT ST.SNO
             , ST.SNAME
             , ST.MAJOR
             , ST.SYEAR
             , SC.RESULT
             , SG.GRADE
            FROM STUDENT ST
            JOIN SCORE SC
            ON ST.SNO = SC.SNO
            JOIN SCGRADE SG
            ON SC.RESULT BETWEEN LOSCORE AND HISCORE
            WHERE SG.GRADE IN ('A', 'B')
            AND (ST.MAJOR, ST.SYEAR) IN (('화학', 2))
    );

SELECT *
FROM SCORE_STGR;

--7) 생물학과 학생중 평점이 2.7이상인 학생이 수강중인 과목의 정보를 갖는 테이블 ST_COURSEPF를 생성하세요. 
--(SNO, SNAME, CNO, CNAME, PNO, PNAME, AVR)
CREATE TABLE ST_COURSEPF
    AS (
        SELECT SNO
             , SNAME
             , CNO
             , CNAME
             , PNO
             , AVR
            FROM STUDENT
            NATURAL JOIN COURSE
            NATURAL JOIN PROFESSOR
            WHERE AVR >= 2.7
            AND MAJOR = '생물'
        );
       
SELECT *
FROM ST_COURSEPF;