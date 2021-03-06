DROP TABLE CALBOARD;
CREATE TABLE "CALBOARD"
    (   "SEQ" NUMBER NOT NULL ENABLE,
        "ID" VARCHAR2(20) NOT NULL ENABLE,
        "TITLE" VARCHAR2(1000) NOT NULL ENABLE,
        "CONTENT" VARCHAR2(4000) NOT NULL ENABLE,
        "MDATE" VARCHAR2(12) NOT NULL ENABLE,
        "REGDATE" DATE NOT NULL ENABLE,
        CONSTRAINT "CALBOARD_PK" PRIMARY KEY ("SEQ")
    ); 
    
INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목1', '일정내용1', '202203201420', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목2', '일정내용2', '202203211620', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목3', '일정내용3', '202203221520', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목4', '일정내용4', '202203231820', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목5', '일정내용5', '202203231920', SYSDATE);


INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목2', '일정내용2', '202203251620', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목3', '일정내용3', '202203225520', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목4', '일정내용4', '202203235820', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'K001', '일정제목5', '일정내용5', '202203250120', SYSDATE);

COMMIT;

SELECT * FROM CALBOARD;

alter session set NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS'; --날짜포멧변경 혹시나

alter session set NLS_DATE_FORMAT='YYYY-MM-DD';  --날짜포멧원래대로

commit;

DELETE FROM CALBOARD WHERE ID='K001';

DELETE FROM CALBOARD WHERE SEQ='27';

--캘리더 날짜칸마다 3개씩 목록나오게
SELECT RN, SEQ, ID, TITLE, CONTENT, MDATE, REGDATE
FROM (
        SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(MDATE,1,8) ORDER BY MDATE) AS RN, 
                    SEQ, ID, TITLE, CONTENT, MDATE, REGDATE
        FROM CALBOARD
        WHERE ID='K001' AND SUBSTR(MDATE,1,6)='202203'
      )
WHERE RN BETWEEN 1 AND 3;


INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'user02', '편의점1', '35000원', '202204011120', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'user03', '편의점2', '15000원', '202204021220', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'user01', '편의점3', '55000원', '202204031620', SYSDATE);

INSERT INTO CALBOARD
VALUES(CALBOARD_SEQ.NEXTVAL, 'admin', '편의점4', '34000원', '202204042220', SYSDATE);

commit;


alter table CALBOARD add constraint CALBOARD_PK primary key(SEQ);  --SEQ를기본키로

ALTER TABLE CALBOARD ADD CONSTRAINT FK_CALWRITER foreign KEY(id) references MEMBER (USERID);  --외래키적용
