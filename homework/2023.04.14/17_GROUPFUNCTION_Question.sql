--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR, COUNT(*)
FROM STUDENT
group by MAJOR

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT MAJOR, AVG(AVR * 1.125)
FROM STUDENT 
group by MAJOR
HAVING MAJOR IN ('화학', '생물')

--3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS, COUNT(*)
FROM PROFESSOR
where HIREDATE <= add_months(sysdate, -120)
group by ORDERS

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT SUM(ST_NUM)
FROM COURSE
WHERE CNAME LIKE '%화학%'
group by ST_NUM

--6) 학과별 기말고사 평균을 성적순(성적 내림차순)으로 검색하세요
SELECT st.MAJOR, AVG(s2.RESULT)
FROM STUDENT st
         join SCORE S2 on st.SNO = S2.SNO
group by st.MAJOR

--7) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT E.JOB, ROUND(AVG(E.SAL), 2)
FROM EMP E
group by JOB

--8) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요
SELECT SYEAR, MAX(AVR)
FROM STUDENT
-- JOIN SCORE S2 on STUDENT.SNO = S2.SNO AND MAJOR = '물리'
WHERE MAJOR = '물리'
group by SYEAR





--------------------------------------------
SELECT ~
   FROM 테이블명
   JOIN 테이블명
   ON  ~
   WHERE 조건
   GROUP BY
   HAVING
   ORDER BY

--7) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)      
SELECT DNO, JOB, ROUND(AVG(SAL), 2)
       FROM EMP
       GROUP BY DNO, JOB
       HAVING DNO = 30;
       
SELECT DNO, JOB, AVG(SAL)
       FROM EMP
       GROUP BY DNO, JOB
       HAVING DNO = 30;

--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR, COUNT(*)
       FROM STUDENT
       GROUP BY MAJOR;
       
SELECT MAJOR, COUNT(AVR)
       FROM STUDENT
       GROUP BY ROLLUP(MAJOR);