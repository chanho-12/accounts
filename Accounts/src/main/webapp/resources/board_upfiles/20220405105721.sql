-- DAY 7_DDL_DML.SQL
-- DDL ������ DML ���� 

/*
DDL (DAYA DEFINITION LANGUAGE : ������ ���Ǿ�)
- ������ ���̽� ��ü�� ���鋚 ����ϴ� ���� 
-- ������ ���̽� ��ü : ���̺�(TABLE), ��(VIEW), ������(SEQUENCE), �ε���(INDEX) ��
--- ��ɱ��� : CREAT(����), ALTER(����), DROP(����)
*/

--���̺� ����� : CREATE TABLE
/*
�ۼ����� : 
CREATE RABLE ���̺��(
 �÷��� �ڷ���(����Ʈ ũ��) [DEFAULT �⺻��],
 �÷��� �ڷ���(ũ��) [��������]
 �÷��� �ڷ���(ũ��),
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

-- �÷��� ���� �ޱ� : COMMENT ON COLUMN ���� ����� 
-- COMMENT ON COLUMN ���̺��.�ķ��� IS '����';
COMMENT ON COLUMN TEST3.MEMBER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN TEST3.MEMBER_PWD IS 'ȸ����ȣ';
COMMENT ON COLUMN TEST3.MEMBER_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN TEST3.MEMBER_DATE IS 'ȸ�����Գ�¥';
COMMENT ON COLUMN TEST3.GENDER IS 'ȸ������';




CREATE TABLE ORDERS(
        ORDERNO CHAR(4),
        CUSTNO CHAR(4),
        ORDERDATE DATE  DEFAULT SYSDATE, 
        SHIPDATE DATE,
        SHIPADDRESS VARCHAR2(40),
        QUANTITY NUMBER
        );
COMMENT ON COLUMN ORDERS.ORDERNO IS '�ֹ���ȣ';       
COMMENT ON COLUMN ORDERS.CUSTNO IS '����ȣ'; 
COMMENT ON COLUMN ORDERS.ORDERDATE IS '�ֹ�����'; 
COMMENT ON COLUMN ORDERS.SHIPDATE IS '�������'; 
COMMENT ON COLUMN ORDERS. SHIPADDRESS IS '����ּ�'; 
COMMENT ON COLUMN ORDERS. QUANTITY IS '�ֹ�����'; 
      
-- *********************************************************************
-- ���Ἲ �������ǵ� (CONSTRAINTS)
-- ���̺� �����Ͱ� ��� �Ǵ� ����ɶ� �ùٸ� ���� ��ϵǵ��� �˻��ϴ� ��� 
-- ���̺� ����� �������� �ŷڼ��� ���̱� ���� ����� : ������ ���Ἲ
/*
�������� ���� ��� : 
1. ���̺� ���鶧 �÷��� ������ 
2. ���̺� ���� �Ŀ� ���̺� ������ �������� �߰��� 

CREATE TABLE ���̺��(
        �÷��� �ڷ���(ũ��) [DEFAULT �⺻��] ��������,
        �÷��� �ڷ���(ũ��) CONSTRAINT ���������̸�  ��������,
        -- �÷� ���� ���� : �÷����� 
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���(ũ��),
        --�÷� ���� �Ϸ��Ŀ� �������ǵ��� ���� ��Ƽ� �����Ҽ��� ���� 
        -- ���̺��� 
        �������� (�������÷���), 
        CONSTRAINT ���������̸� �������� (������ �÷���)
);

������ ���������� �۵��Ǵ� ���� ���̺꿡 ����Ÿ�� ����� �� �� �۵��� 
*/        


-- DML (DATA MANIPULATION LANGUAGE : ������ ���۾�)
-- INSERT (���ο� ���߰�), UPDATE(��ϰ� ����), DELETE(�� ����)
/*
INSERT �� �ۼ����� :
INSERT INTO ���̺��[(�÷���, �÷���, �÷���, ......)]
VALUES (����� ��, ����� ��, ��, ��, ...........);

���̺��� ���� ��� �÷��� ���� ����� ���� ���� �÷��� ������ �����Ҽ��� ����
INSERT INTO ���̺�� VALUES(����� ��, ��, .............)
-���ǻ��� : �÷� ���� ������ ���缭 ����ؾ���   
*/

-- TEST ���̺� ������ ��� ���� 
INSERT INTO TEST (USERID, USERNAME, PASSWORD, AGE, ENROLL_DATE)
VALUES ('user007', 'ȫ�浿', 'pass007', 27, SYSDATE); --���߰� 

INSERT INTO TEST 
VALUES ('user001', '������', 'pass001', 35, TO_DATE('20201225', 'RRRRMMDD')); --���߰� 

SELECT * FROM TEST;

-- �������� : NOT NULL -------------------
-- �÷��� �ݵ�� ���� ����ؾ� �ɶ� ���� (�ʼ��Է��׸��� ����) 
-- �÷��� NULL �����Ѵ� 
-- �÷����������� �����Ҽ� ���� (���̺������� ���� ����)

CREATE TABLE TESTNN (
        NID NUMBER(5) NOT NULL, -- �÷�����, �������� �̸������� SYS_C....�̸��� �־�����
        N_NAME VARCHAR2(20)
);

INSERT INTO TESTNN
VALUES (12, '����Ŭ');

INSERT INTO TESTNN
VALUES (NULL, '���̽�'); -- NOT NULL ERROR

INSERT INTO TESRNN (N_NAME)
VALUES ('���̽�');  -- ���ܵ� �÷��� NULL, NOT NULL ERROR

INSERT INTO TESTNN
VALLUES (23, NULL);

SELECT * FROM TESTNN;


-- ���̺� ���� ���� Ȯ�� 
CREATE TABLE TESTNN2(
                    NID NUMBER(5),
                    N_NAME VARCHAR2(20),
                    --���̺� ����
                    CONSTRAINT NN_T2_NID NOT NULL ()NID
 );
 
 -- �������� : UNIQUE --------------
 -- �÷��� �ߺ��� (������ �ι����)������ ���������� 
 -- �ߺ� ����� ���� ���� �Ļ��� 
 
 --�������� ���ڿ� 
 
-- ���� ���� �÷��� ��� �ϳ��� ���� ������ ������ ��� 
-- ������ �÷������� �ϳ��� ������ ���� �ߺ� �Ǵ��� 

CONSTRAINT UN_TUN4_COMP UNIQUE (UN_ID, UN_NAME)

CREATE TABLE TESTPK (
        PID NUMBER PRIMARY KEY,
        PNAME VARCHAR2(15) NOT NULL,
        PDATE DATE
);

INSERT INTO TESTPK VALUES (1, 'ȫ�浿', '15/02/15');
INSERT INTO TESTPK VALUES (2, 'ȫ�浿', TO_DATE('17/05/20'));
INSERT INTO TESTPK VALUES (NULL , 'ȫ�浿', SYSDATE); -- ERROR
INSERT INTO TESTPK VALUES (1, 'ȫ�浿', '15/02/15')

SELECT * FROM

CREATE TABLE TESTPK2 (
            PID NUMBER CONSTRAINT PK_TPK2_PID PRIMARY KEY,
            PNAME VARCHAR2(15) PRIMARY KEY
 );           
    
    
CREATE TABLE RSTPK4(
        PID NUMBER,
        PNAME VARCHAR2(15),
        PDATE DATE,
        --���̺� ���� 
        CONSTRAINT PK_TPK4_COMP PRIMARY KEY (PID, PNAME)
);

INSERT INTO RSTPK4 VALUES ('100', 'ORACLE', SYSDATE);
--����Ű�� ������ �Ѱ��� ������ ���� �Ǵ��� 
INSERT INTO RSTPK4 VALUES ('120', 'ORACLE', '20/11/17');
--NULL ��� ����     
    
    
    
    
    
    
    
    
    
