--1) 각 학과별 학년별 학생 수를 ROLLUP함수로 검색하세요
SELECT MAJOR
    , SYEAR
    , COUNT(*)
    FROM STUDENT
    GROUP BY ROLLUP( MAJOR, SYEAR);

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하는데 
--화학과 생물이 열로 만들어지도록 하세요.(PIVOT 사용)
SELECT *
    FROM (SELECT MAJOR
            , AVR 
            FROM STUDENT
            ) PIVOT (AVG(AVR*(4.5/4))
                FOR MAJOR IN (
                    '화학' 화학
                    , '생물' 생물
                        )
                    );
--3) 학과별 학생이름을 ,로 구분하여 성적순으로(내림차순) 조회하세요.(LISTAGG 사용)
SELECT MAJOR
    , LISTAGG(SNAME, ', ')
    WITHIN GROUP(ORDER BY AVR)
    FROM STUDENT
    GROUP BY ROLLUP(MAJOR);
    
--4) 부서별 업무별 연봉의 평균을 검색하세요
--(부서와 업무 컬럼의 그룹화 여부도 같이 검색, GROUPING 사용)
SELECT D.DNAME
    , E.JOB
    , AVG(SAL)
    , COUNT(*)
    ,GROUPING(DNAME)
    ,GROUPING(JOB)
    FROM EMP E
    JOIN DEPT D
    ON E.DNO = D.DNO
    GROUP BY GROUPING SETS(D.DNAME, E.JOB)
    ORDER BY D.DNAME, E.JOB;