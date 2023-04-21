--1) 과목번호, 과목이름, 교수번호, 교수이름을 담을 수 있는 변수들을 선언하고 
--   유기화확 과목의 과목번호, 과목이름, 교수번호, 교수이름을 출력하세요.
DECLARE
    CNO   VARCHAR2(20);
    CNAME VARCHAR2(20);
    PNO   VARCHAR2(20);
    PNAME VARCHAR2(20);
BEGIN
    SELECT C.CNO, C.CNAME, P.PNO, P.PNAME
    INTO CNO,CNAME,PNO,PNAME
    FROM COURSE C
             JOIN PROFESSOR P on C.PNO = P.PNO
    WHERE CNAME = '유기화학';

    DBMS_OUTPUT.PUT_LINE(CNO);
    DBMS_OUTPUT.PUT_LINE(CNAME);
    DBMS_OUTPUT.PUT_LINE(PNO);
    DBMS_OUTPUT.PUT_LINE(PNAME);
end;
/
--2) 위 데이터들을 레코드로 선언하고 출력하세요.
DECLARE
    TYPE STU_REC IS RECORD
                    (
                        CNO   VARCHAR2(20),
                        CNAME VARCHAR2(20),
                        PNO   VARCHAR2(20),
                        PNAME VARCHAR2(20)
                    );
    REC STU_REC;
BEGIN
    SELECT C.CNO, C.CNAME, P.PNO, P.PNAME
    INTO REC.CNO,REC.CNAME,REC.PNO,REC.PNAME
    FROM COURSE C
             JOIN PROFESSOR P on C.PNO = P.PNO
    WHERE CNAME = '유기화학';
    DBMS_OUTPUT.PUT_LINE(REC.CNO);
    DBMS_OUTPUT.PUT_LINE(REC.CNAME);
    DBMS_OUTPUT.PUT_LINE(REC.PNO);
    DBMS_OUTPUT.PUT_LINE(REC.PNAME);
end;
/

--3) 과목번호, 과목이름, 과목별 평균 기말고사 성적을 갖는 
--레코드의 배열을 만들고
--기본 LOOP문을 이용해서 모든 과목의 
--과목번호, 과목이름, 과목별 평균 기말고사 성적을 출력하세요.
DECLARE
   TYPE course_rec IS RECORD (
      course_id COURSE.CNO%TYPE,
      course_name COURSE.CNAME%TYPE,
      avg_final_score NUMBER
   );
   TYPE course_arr IS TABLE OF course_rec INDEX BY PLS_INTEGER;

   -- 과목별 평균 기말고사 성적을 계산하는 쿼리
   CURSOR c_courses IS 
      SELECT c.CNO, c.CNAME, AVG(s.RESULT) AS avg_final_score
      FROM COURSE c JOIN SCORE s ON c.CNO = s.CNO
      GROUP BY c.CNO, c.CNAME;
   
   v_courses course_arr;
BEGIN
   -- 레코드 배열에 과목별 평균 기말고사 성적을 저장
   FOR c IN c_courses LOOP
      v_courses(v_courses.COUNT+1) := c;
   END LOOP;
   
   -- 모든 과목의 과목번호, 과목이름, 과목별 평균 기말고사 성적을 출력
   FOR i IN 1..v_courses.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('과목번호: ' || v_courses(i).course_id || 
         ', 과목이름: ' || v_courses(i).course_name || 
         ', 평균 기말고사 성적: ' || v_courses(i).avg_final_score);
   END LOOP;
END;
/

--4) 학생번호, 학생이름과 학생별 평균 기말고사 성적을 갖는 
--테이블 T_STAVGSC를 만들고
-- 커서를 이용하여 학생번호, 학생이름, 학생별 평균 기말고사 성적을 조회하고 
-- 조회된 데이터를 생성한 테이블인 T_STAVGSC에 저장하세요.
CREATE TABLE T_STAVSGC
(
    SNO    VARCHAR2(20),
    SNAME  VARCHAR2(20),
    RESULT VARCHAR2(20)
);
DROP TABLE T_STAVSGC

SELECT *
FROM T_STAVSGC;

DECLARE
    CURSOR CURST IS
        SELECT ST.SNO, SNAME, RESULT
        FROM STUDENT ST
                 JOIN SCORE S2 on ST.SNO = S2.SNO
        WHERE ST.SNO = '915302';
    SS T_STAVSGC%ROWTYPE;
BEGIN
    OPEN CURST;
    FETCH CURST INTO SS;
    DBMS_OUTPUT.PUT_LINE(SS.SNO);
    DBMS_OUTPUT.PUT_LINE(SS.SNAME);
    DBMS_OUTPUT.PUT_LINE(SS.RESULT);
    INSERT INTO T_STAVSGC
    VALUES (SS.SNO, SS.SNAME, SS.RESULT);
    CLOSE CURST;
end;
/
