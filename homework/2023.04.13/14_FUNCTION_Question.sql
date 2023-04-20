--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT LAST_DAY(HIREDATE) - HIREDATE
FROM PROFESSOR;

--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT P.PNAME, TRUNC((SYSDATE - P.HIREDATE) / 7) AS weeks_worked
FROM PROFESSOR P;

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT *
FROM PROFESSOR
WHERE HIREDATE BETWEEN '1991-01-01' AND '1995-12-31';

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT ST.SNO, ST.SNAME, ROUND(AVG(C.ST_NUM * SC.RESULT / 100) * 4.5, 2) AS AVR
FROM STUDENT ST
JOIN SCORE SC ON ST.SNO = SC.SNO
JOIN COURSE C ON SC.CNO = C.CNO
GROUP BY ST.SNO, ST.SNAME;

--5) 사원들의 오늘까지 근무 기간이 몇 년 몇 개월 며칠인지 검색하세요
--!!!
SELECT ENO
    , ENAME
    , TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)/12) AS YEARS,            --년도 수
    MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, HDATE)),12) AS MONTHS,        --월 수
    TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, HDATE), 1) * 30.44) AS DAYS   --일 수
    FROM EMP;
