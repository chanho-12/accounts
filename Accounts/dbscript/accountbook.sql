drop table accountbook;

CREATE TABLE ACCOUNTBOOK(
    ACCOUNT_NUM INT CONSTRAINT PK_ACCOUNT_NUM PRIMARY KEY,
    ACCOUNTBOOKWRITER VARCHAR2(20) NOT NULL,
    CAMERA_NUM INT NOT NULL,
    CAMEARA_TOTAL1 INT NOT NULL,
    CAMEARA_TOTAL2 INT NOT NULL,
    CAMEARA_TOTAL3 INT NOT NULL,
    ACCOUNT_DATE DATE,
    CONSTRAINT FK_ACCOUNTBOOKWRITER FOREIGN KEY (ACCOUNTBOOKWRITER) 
      REFERENCES MEMBER ON DELETE CASCADE
);
       
INSERT INTO ACCOUNTBOOK VALUES(1,'user01',1,1000,10000,100000,sysdate);
INSERT INTO ACCOUNTBOOK VALUES(2,'user02',2,2000,20000,200000,sysdate);
INSERT INTO ACCOUNTBOOK VALUES(3,'user03',3,3000,30000,300000,sysdate);I
INSERT INTO ACCOUNTBOOK VALUES(4,'user02',2,5000,30000,300000,sysdate);
INSERT INTO ACCOUNTBOOK VALUES(5,'user02',2,13000,30000,300000,sysdate);
INSERT INTO ACCOUNTBOOK VALUES(6,'user03',3,63000,70000,1300000,sysdate);

commit;

select TO_CHAR(ACCOUNT_DATE, 'DAY') from ACCOUNTBOOK;