--1. 서브쿼리
--단일 행 쿼리
SELECT *
    FROM PROFESSOR
    WHERE PNAME = '송강';
    
--1-1. 단일 행 서브쿼리
--송강보다 부임일시가 빠른 교수들의 목록 조회
SELECT P.*
    FROM PROFESSOR P
    WHERE P.HIREDATE < (
                            SELECT HIREDATE
                                FROM PROFESSOR
                                WHERE PNAME = '송강'
                        );

--손하늘 사원보다 급여가 높은 사원목록 조회
SELECT E.*
    FROM EMP E
    JOIN (
                SELECT *
                    FROM EMP
                    WHERE ENAME = '손하늘'
            ) B
    ON E.SAL != B.SAL;

--1-2. 다중 행 서브쿼리
--노육학생의 정보
SELECT * 
    FROM STUDENT
    WHERE SNAME = '노육';
    
--노육이라는 학생들과 학점이 같은 학생 목록 조회
SELECT ST.*
    FROM STUDENT ST
    WHERE AVR IN (
                    SELECT AVR
                        FROM STUDENT
                        WHERE SNAME = '노육'
                 );

SELECT ST.*
    FROM STUDENT ST
    JOIN (
            SELECT *
                FROM STUDENT
                WHERE SNAME = '노육'
         ) B
    ON ST.AVR = B.AVR;

--기말고사 성적이 95점이상인 학번, 과목번호, 과목명, 성적 => 서브쿼리
--학생테이블이랑 조인해서 학번, 학생이름, 과목번호, 과목명, 성적, 전공
SELECT SC.SNO
     , SC.CNO
     , C.CNAME
     , SC.RESULT
    FROM SCORE SC
    JOIN COURSE C
    ON SC.CNO = C.CNO
    AND RESULT >= 95;
    
SELECT B.SNO
     , ST.SNAME
     , ST.SYEAR
     , ST.MAJOR
     , B.CNO
     , B.CNAME
     , B.RESULT
    FROM (
            SELECT SC.SNO
                 , SC.CNO
                 , C.CNAME
                 , SC.RESULT
                FROM SCORE SC
                JOIN COURSE C
                ON SC.CNO = C.CNO
                AND RESULT >= 95
        ) B
    JOIN STUDENT ST
    ON B.SNO = ST.SNO;
    
SELECT SC.SNO
     , ST.SNAME
     , ST.SYEAR
     , ST.MAJOR
     , SC.CNO
     , C.CNAME
     , SC.RESULT
    FROM SCORE SC
    JOIN COURSE C
    ON SC.CNO = C.CNO
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    AND SC.RESULT >= 95;

--기말고사의 성적을 조회할 건데 과목이름, 담당교수 이름, 학생이름, 점수등급 함께 조회 과목번호 순서로 정렬
SELECT SC.SNO
     , ST.SNAME
     , SC.CNO
     , C.CNAME
     , SC.RESULT
     , SG.GRADE
     , C.PNO
     , P.PNAME
    FROM SCORE SC
    JOIN COURSE C
    ON SC.CNO = C.CNO
    JOIN PROFESSOR P
    ON C.PNO = P.PNO
    JOIN SCGRADE SG
    ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    ORDER BY SNO, CNO;

--score, scgrade, student => 하나의 서브쿼리
SELECT SC.SNO
     , ST.SNAME
     , SC.CNO
     , SC.RESULT
     , SG.GRADE
    FROM SCORE SC
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    JOIN SCGRADE SG
    ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE;
    
--course, professor -> 하나의 서브쿼리로(담당교수가 없는 과목도 조회)
SELECT C.CNO
     , C.CNAME
     , C.PNO
     , P.PNAME
    FROM COURSE C
    LEFT JOIN PROFESSOR P
    ON C.PNO = P.PNO;

--위 서브쿼리 테이블 2개를 다시 조인해서 결과
--기말고사의 성적을 조회할 건데 담당교수가 없는 과목도 나올 수 있도록
--과목이름, 담당교수 이름, 학생이름, 점수등급 함께 조회 과목번호 순서로 정렬
SELECT A.SNO
     , A.SNAME
     , B.CNO
     , B.CNAME
     , B.PNO
     , B.PNAME
     , A.RESULT
     , A.GRADE
    FROM (
            SELECT SC.SNO
                 , ST.SNAME
                 , SC.CNO
                 , SC.RESULT                                                        
                 , SG.GRADE
                FROM SCORE SC
                JOIN STUDENT ST
                ON SC.SNO = ST.SNO
                JOIN SCGRADE SG
                ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
        ) A
    RIGHT JOIN (
            SELECT C.CNO
                 , C.CNAME
                 , C.PNO
                 , P.PNAME
                FROM COURSE C
                LEFT JOIN PROFESSOR P
                ON C.PNO = P.PNO
        ) B
    ON A.CNO = B.CNO
    ORDER BY B.CNO;




SELECT SC.SNO
     , ST.SNAME
     , SC.CNO
     , PCS.CNAME
     , SC.RESULT
     , SG.GRADE
     , PCS.PNO
     , PCS.PNAME
    FROM SCORE SC
    JOIN SCGRADE SG
    ON SC.RESULT BETWEEN SG.LOSCORE AND SG.HISCORE
    JOIN STUDENT ST
    ON SC.SNO = ST.SNO
    RIGHT JOIN (
        SELECT CS.*
             , P.PNAME
            FROM COURSE CS
            LEFT JOIN PROFESSOR P
            ON CS.PNO = P.PNO
    ) PCS
    ON SC.CNO = PCS.CNO
    ORDER BY SNO, CNO;