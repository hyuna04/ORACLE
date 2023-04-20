-- 2번
--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT MAJOR, AVG(AVR)
FROM STUDENT
group by MAJOR
HAVING MAJOR != '화학';

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT MAJOR, AVG(AVR)
FROM STUDENT
group by MAJOR
HAVING MAJOR != '화학'
   AND AVG(AVR) >= 2.0;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요

SELECT S2.SNO, AVG(RESULT)
FROM STUDENT
         JOIN SCORE S2 on STUDENT.SNO = S2.SNO
group by S2.SNO
HAVING AVG(RESULT) >= 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT PNAME, SECTION, ST_NUM
FROM PROFESSOR
JOIN COURSE C2
on PROFESSOR.PNO = C2.PNO AND ST_NUM >= 3;

--5) 기말고사 평균 성적이 
-- 핵 화학과목보다 우수한 과목의 과목명과 
-- 담당 교수명을 검색하세요
SELECT DISTINCT course.cname, professor.pname  --DISTINCT->중복제거
FROM score
INNER JOIN course ON score.cno = course.cno
INNER JOIN professor ON course.pno = professor.pno
INNER JOIN scgrade ON score.result BETWEEN scgrade.loscore AND scgrade.hiscore
WHERE course.section != '핵 화학'
AND scgrade.grade = 'A'
GROUP BY course.cname, professor.pname
HAVING AVG(score.result) > (SELECT AVG(result) FROM score WHERE cno IN (SELECT cno FROM course WHERE section = '핵 화학'));

--6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT DNAME, COUNT(DNAME)
FROM EMP
         JOIN DEPT D on EMP.DNO = D.DNO
group by DNAME
HAVING COUNT(DNAME) >= 4;

--7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT JOB, ROUND(AVG(SAL))
FROM EMP
group by JOB
HAVING AVG(SAL) >= 3000;

--8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT MAJOR, SYEAR, COUNT(*)
FROM STUDENT
group by MAJOR, SYEAR
HAVING COUNT(*) >= 5;