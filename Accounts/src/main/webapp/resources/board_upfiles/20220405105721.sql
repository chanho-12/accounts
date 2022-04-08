-- DAY 7_DDL_DML.SQL
-- DDL 구문과 DML 구문 

/*
DDL (DAYA DEFINITION LANGUAGE : 데이터 정의어)
- 데이터 베이스 객체를 만들떄 사용하는 구문 
-- 데이터 베이스 객체 : 테이블(TABLE), 뷰(VIEW), 시퀀스(SEQUENCE), 인덱스(INDEX) 등
--- 명령구문 : CREAT(생성), ALTER(수정), DROP(제거)
*/

--테이블 만들기 : CREATE TABLE
/*
작성형식 : 
CREATE RABLE 테이블명(
 컬럼명 자료형(바이트 크기) [DEFAULT 기본값],
 컬럼명 자료형(크기) [제약조건]
 컬럼명 자료형(크기),
 .....
);
*/

CREATE TABLE TEST(
        USERID VARCHAR2(20),
        USERNAME VARCHAR2(30),
        PASSWORD VARCHAR2(20),
        AGE NUMBER,
        ENROLL_DATE DATE
        );
        
CREATE TABLE TEST2(
        MEMBER_ID VARCHAR2(15),
        MEMBER_PWD VARCHAR2(15),
        MEMBER_NAME VARCHAR2(20),
        MEMBER_DATE DATE DEFAULT SYSDATE,
        GENDER CHAR(1) DEFAULT 'M'
);

CREATE TABLE TEST3(
        MEMBER_ID VARCHAR2(15) PRIMARY KEY,
        MEMBER_PWD VARCHAR2(15) NOT NULL,
        MEMBER_NAME VARCHAR2(20) NOT NULL,
        MEMBER_DATE DATE DEFAULT SYSDATE,
        GENDER CHAR(1) DEFAULT 'M' CHECK (GENDER IN ('F', 'M'))
);

-- 컬럼에 설명 달기 : COMMENT ON COLUMN 구문 사용함 
-- COMMENT ON COLUMN 테이블명.컴럼명 IS '설명';
COMMENT ON COLUMN TEST3.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN TEST3.MEMBER_PWD IS '회원암호';
COMMENT ON COLUMN TEST3.MEMBER_NAME IS '회원이름';
COMMENT ON COLUMN TEST3.MEMBER_DATE IS '회원가입날짜';
COMMENT ON COLUMN TEST3.GENDER IS '회원성별';




CREATE TABLE ORDERS(
        ORDERNO CHAR(4),
        CUSTNO CHAR(4),
        ORDERDATE DATE  DEFAULT SYSDATE, 
        SHIPDATE DATE,
        SHIPADDRESS VARCHAR2(40),
        QUANTITY NUMBER
        );
COMMENT ON COLUMN ORDERS.ORDERNO IS '주문번호';       
COMMENT ON COLUMN ORDERS.CUSTNO IS '고객번호'; 
COMMENT ON COLUMN ORDERS.ORDERDATE IS '주문일자'; 
COMMENT ON COLUMN ORDERS.SHIPDATE IS '배송일자'; 
COMMENT ON COLUMN ORDERS. SHIPADDRESS IS '배송주소'; 
COMMENT ON COLUMN ORDERS. QUANTITY IS '주문수량'; 
      
-- *********************************************************************
-- 무결성 제약조건등 (CONSTRAINTS)
-- 테이블에 데이터가 기록 또는 변경될때 올바른 값이 기록되도록 검사하는 기능 
-- 테이블에 저장된 데이터의 신뢰성을 높이기 위한 기술임 : 데이터 무결성
/*
제약조건 설정 방법 : 
1. 테이블 만들때 컬럼에 설정함 
2. 테이블 만든 후에 테이블 수정시 제약조건 추가함 

CREATE TABLE 테이블명(
        컬럼명 자료형(크기) [DEFAULT 기본값] 제약조건,
        컬럼명 자료형(크기) CONSTRAINT 제약조건이름  제약조건,
        -- 컬럼 옆에 설정 : 컬럼레벨 
        컬럼명 자료형(크기),
        컬럼명 자료형(크기),
        --컬럼 구성 완료후에 제약조건들을 따로 모아서 설정할수도 있음 
        -- 테이블레벨 
        제약조건 (적용할컬럼명), 
        CONSTRAINT 제약조건이름 제약조건 (적용할 컬럼명)
);

설정된 제약조건이 작동되는 때는 테이브에 데이타가 기록이 될 때 작동됨 
*/        


-- DML (DATA MANIPULATION LANGUAGE : 데이터 조작어)
-- INSERT (새로운 행추가), UPDATE(기록값 변경), DELETE(행 삭제)
/*
INSERT 문 작성형식 :
INSERT INTO 테이블명[(컬럼명, 컬러명, 컬럼명, ......)]
VALUES (기록할 값, 기록할 값, 값, 값, ...........);

테이블이 가진 모든 컬럼에 값을 기록해 넣을 때는 컬럼명 나열을 생략할수도 있음
INSERT INTO 테이블명 VALUES(기록할 값, 값, .............)
-주의사항 : 컬럼 생성 순서에 맞춰서 기록해야함   
*/

-- TEST 테이블에 데이터 기록 저장 
INSERT INTO TEST (USERID, USERNAME, PASSWORD, AGE, ENROLL_DATE)
VALUES ('user007', '홍길동', 'pass007', 27, SYSDATE); --행추가 

INSERT INTO TEST 
VALUES ('user001', '김유신', 'pass001', 35, TO_DATE('20201225', 'RRRRMMDD')); --행추가 

SELECT * FROM TEST;

-- 제약조건 : NOT NULL -------------------
-- 컬럼에 반드시 값을 기록해야 될때 적용 (필수입력항목을 뜻함) 
-- 컬럼에 NULL 사용못한다 
-- 컬럼레벨에서만 설정할수 있음 (테이블레벨에서 설정 못함)

CREATE TABLE TESTNN (
        NID NUMBER(5) NOT NULL, -- 컬럼레벨, 제약조건 이름없으면 SYS_C....이름이 주어진다
        N_NAME VARCHAR2(20)
);

INSERT INTO TESTNN
VALUES (12, '오라클');

INSERT INTO TESTNN
VALUES (NULL, '파이썬'); -- NOT NULL ERROR

INSERT INTO TESRNN (N_NAME)
VALUES ('파이썬');  -- 제외된 컬럼은 NULL, NOT NULL ERROR

INSERT INTO TESTNN
VALLUES (23, NULL);

SELECT * FROM TESTNN;


-- 테이블 레벨 설정 확인 
CREATE TABLE TESTNN2(
                    NID NUMBER(5),
                    N_NAME VARCHAR2(20),
                    --테이블 레벨
                    CONSTRAINT NN_T2_NID NOT NULL ()NID
 );
 
 -- 제약조건 : UNIQUE --------------
 -- 컬럼의 중복값 (같은값 두번기록)을막는 제약저건임 
 -- 중복 기록을 막는 막는 컴사기능 
 
 --고정길이 문자열 
 
-- 여려 개의 컬럼을 묶어서 하나의 제약 조건을 설정한 경우 
-- 묶여진 컬럼값들을 하나의 값으로 보고 중복 판다함 

CONSTRAINT UN_TUN4_COMP UNIQUE (UN_ID, UN_NAME)

CREATE TABLE TESTPK (
        PID NUMBER PRIMARY KEY,
        PNAME VARCHAR2(15) NOT NULL,
        PDATE DATE
);

INSERT INTO TESTPK VALUES (1, '홍길동', '15/02/15');
INSERT INTO TESTPK VALUES (2, '홍길동', TO_DATE('17/05/20'));
INSERT INTO TESTPK VALUES (NULL , '홍길동', SYSDATE); -- ERROR
INSERT INTO TESTPK VALUES (1, '홍길동', '15/02/15')

SELECT * FROM

CREATE TABLE TESTPK2 (
            PID NUMBER CONSTRAINT PK_TPK2_PID PRIMARY KEY,
            PNAME VARCHAR2(15) PRIMARY KEY
 );           
    
    
CREATE TABLE RSTPK4(
        PID NUMBER,
        PNAME VARCHAR2(15),
        PDATE DATE,
        --테이블 레벨 
        CONSTRAINT PK_TPK4_COMP PRIMARY KEY (PID, PNAME)
);

INSERT INTO RSTPK4 VALUES ('100', 'ORACLE', SYSDATE);
--복합키는 값들을 한개의 값으로 보고 판단함 
INSERT INTO RSTPK4 VALUES ('120', 'ORACLE', '20/11/17');
--NULL 사용 못함     
    
    
    
    
    
    
    
    
    
