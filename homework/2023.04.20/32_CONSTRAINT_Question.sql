--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 RESULT 60이상 90이하만 입력 가능하도록 하세요.


--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 생성하면서 SNO은 PK로 SNAME은 NOT NULL로 SYEAR의 DEFAULT는 1로 
--   설정하세요.


--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 테이블을 생성하면서 CNO, CNAME을 PK로 PNO은 PROFESSOR_PK의 PNO을 참조하여
--   FK로 설정하고 ST_NUM은 DEFAULT 2로 설정하세요.


--4) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2=--1) SCORE 테이블과 동일한 구조를 갖는 SCORE_CHK를 생성하고 
--RESULT 60이상 90이하만 입력 가능하도록 하세요.
CREATE TABLE SCORE_CHK
(
    SNO NUMBER PRIMARY KEY,
    CNO VARCHAR2(8),
    RESULT NUMBER(3,0)
)
ALTER TABLE SCORE_CHK
ADD CONSTRAINT RE CHEK (RESULT BETWEEN 60 AND 90);

-- -> 
-- SCORE_CHK 테이블 생성
CREATE TABLE SCORE_CHK AS
SELECT *
FROM SCORE
WHERE 1=0; -- SCORE 테이블과 동일한 구조를 갖도록 빈 테이블 생성
-- RESULT 값이 60 이상 90 이하인 값만 입력 가능하도록 제약 조건 추가
ALTER TABLE SCORE_CHK
ADD CONSTRAINT CHK_RESULT_RANGE CHECK (RESULT BETWEEN 60 AND 90);

--2) STUDENT 테이블과 동일한 구조를 갖는 STUDENT_COPY 테이블을 
--생성하면서 SNO은 PK로 SNAME은 NOT NULL로 SYEAR의 DEFAULT는 
--1로 설정하세요.
CREATE TABLE STUDENT_COPY
(
    SNO NUMBER PRIMARY KEY,
    SNAME VARCHAR2(20) NOT NULL,
    SEX VARCHAR2(3),
    SYEAR NUMBER(1) DEFAULT 1,
    MAJOR VARCHAR2(20),
    AVR NUMBER(4,2)
);



--3) COURSE 테이블과 동일한 구조를 갖는 COURSE_CONTSRAINT 
--테이블을 생성하면서 CNO, CNAME을 PK로 PNO은 
--PROFESSOR_PK의 PNO을 참조하여 FK로 설정하고 
--ST_NUM은 DEFAULT 2로 설정하세요.
CREATE TABLE COURSE_CONTSRAINT
(
    CNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(20),
    ST_NUM NUMBER(1,0) DEFAULT 2,
    PNO VARCHAR2(20), 
    CONSTRAINT FK_CO_CO_PNO REFERENCES PROFESSOR_PK(PNO)
);

--4) 다음 구조를 갖는 테이블을 생성하세요.
--   T_SNS                              T_SNS_DETAIL                        T_SNS_UPLOADED
--   SNS_NO(PK)    SNS_NM               SNS_NO(PK, FK)   SNS_BEN            SNS_NO(PK, FK)    SNS_UPL_NO(PK)
--     1            페북                   1               4000                   1                  1
--     2           인스타                  2               10000                  1                  2
--     3           트위터                  3               30000                  2                  1
--                                                                               2                  2=
CREATE TABLE T_SNS(
SNS_NO NUMBER PRIMARY KEY,
SNS_NM VARCHAR2(10)
);
CREATE TABLE T_SNS_DETAIL(
SNS_NO NUMBER PRIMARY KEY,
SNS_BEN NUMBER,
CONSTRAINT SNS_FOR FOREIGN KEY(SNS_NO) REFERENCES T_SNS(SNS_NO)
);
CREATE TABLE T_SNS_DETAIL(
SNS_NO NUMBER,
SNS_UPL_NO NUMBER,
CONSTRAINT SNS_FOR2 FOREIGN KEY(SNS_NO) REFERENCES T_SNS_DETAIL(SNS_NO),
CONSTRAINT UPL_PK PRIMARY KEY(SNS_NO, SNS_UPL_NO)
);

