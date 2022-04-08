-- DAY3_SELECT3.SQL
--����Ŭ�� �����ϴ� �Լ� 

--�Լ�(FUNCTION)*************
-- �÷��� ��ϵ� ���� �о ó���� ����� ��ȯ�ϴ� �����̴� 
-- �Լ���(�÷���) ��� 
-- ������ �Լ� : ���� ���� N���̸� ��ȯ���� N���� 
-- �׷��Լ� : ���� ���� N �� �� ��ȯ���� 1���� 

-- �׷��Լ� 
--SUM(), AVG(), MAX(), MIN(), COUNT

-- SUM(�÷���)| SUM(DISTINCT �÷���)
-- �հ踦 ���ؼ� ��ȯ�Ѵ� 

--�Ҽ� �μ��� "50" �̰ų� �μ��� �������� ���� �������� �޿��� �հ踦 ��ȸ
SELECT SUM(SALARY) �޿��հ�, SUN(DISTNCT SALARY) " �ߺ� ���� �޿� �հ�"
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;

--������ �Լ��� �׷��ռ��� SELECT ���� ���� ����Ҽ� ���� 
--ORDB(Object Relational DataBase) ; ��ü ������ ����Ÿ ���̽� 
-- 2���� ���̺�(ǥ) ������ ���� �����͸� ǥ����(�簢���̾�� �� 
--����� ����� ����� ǥ�� �Ҽ�����)
SELECT UPPER(EMAIL, SUM(SALARY)) --22��, 1��
FROM EMPLOYEE -- ���� 

-- WHERE ������ �񱳰��� �׷��Լ� ����� �� ����
-- WHERE ���� �� �྿ ���� �񱳸� �ϱ� ������ 
-- �� : �� ������ �޿� ��պ��� �޿��� ���� �޴� ���� ���� ��ȸ
--          ��� , �̸�, �޿�
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > AVG(SALARY); --ERROR

-- �ذ� : �������� ��� 
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- �ذ� 2 ��ü �޿� ����� ���� ��ȸ�ؼ� ���� ������� ��� 
SELECT AVG(SALARY)
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > 2961818; 

-- AVG(�÷���) | AVG(DISTINCT �÷���)
-- ����� ���ؼ� ��ȯ��

-- �Ҽ� �μ��� 50 �Ǵ� 90 �Ǵ� NULL�� �������� ���ʽ�����Ʈ ��� ��ȸ
SELECT AVG(BONUS_PCT),
          AVG(DLSTINCT BONUS_PCT),
          AVG(NVL(BONUS_PCT, 0))
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90' ) OR DEPT_ID IS NULL;

-- MAX(�÷���) | MAX(DISTINCT �÷���)
-- ����ū�� ��ȯ 
--MIN(�÷���) | MIN (DISTLINCT �÷���)
-- ���� ���� �� ��ȯ

--������(CHAR, VARCHAR2, LONG, CLOB), ������(NUMBER), ��¥��(DATE)
--��� ����Ҽ����� 

-- �μ��ڵ尡 50 �Ǵ� 90�� �������� 
-- �����ڵ�l �ִ밪, �ּҰ�
-- �Ի��� �ִ밪 �ּҰ�
--�޿��� �ִ밪, �ּҰ� ��ȸ 
SELECT MAX(JOB_ID), MIN(JOB_ID),
MAX(HIRE_DATE), MIN(HIRE_DATE), 
MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IN ('50','90');


--COUNT(*) | COUNT(�÷���) | COUNT(DISTINCT �÷���)
-- * : ���̺� ��ü �� ���� ��ȯ
-- �÷��� : NULL �� ������ ��ϰ��� �� ���� ��ȯ

SELECT COUNT(*),
            COUNT(DEPT_ID),
            COUNT(DISTINCT DEPT_ID) 
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;

-- ������ �Լ� (SINGLE ROW FUNCTION) **************************

-- ���� ó���Լ� -----------------------

--LENGTH('���ڸ��ͷ�' | ���ڰ� ��ϵ� �÷��� )
--���� ���� ��ȯ��

SELECT LENGTH('ORACLE'), LENGTH('����Ŭ')
FROM DUAL;
--���̺� ���� �ܼ��� ��� ����� SELECT �ϴ� ��쿡�� 
-- FROM�� ����(DUMMY) ���̺��� ����ϸ�� 
--����Ŭ �����ϴ� DUAL�� �����
/*
SELECT ����
FROM DUAL;
*/

SELECT 12 + 3 * 5
FROM DUAL;

SELECT SYSDATE
FROM DUAL 

SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- LENGTHB('���ڸ��ͳ�' | ���ڰ� ��ϵ� �÷���)
-- ��� ������ ����Ʈ ũ��� ��ȯ�� 
SELECT LENGTH('ORACLE'), LENGTHB('ORACLE'),
            LENGTH('����Ŭ'), LENGTHB('����Ŭ')
FROM DUAL;
-- ����Ŭ ������ǰ�� ���� �ѱ� 1���ڰ� 2����Ʈ��.
-- EXPRESS EDITION ��ǰ�� �ѱ� 1���ڰ� 3 ����Ʈ�� ó����

-- INSTR('���ڸ��ͷ�' | ���ڰ� ��ϵ� �÷���, ã�� ����, ã�� ������ġ, ���° ����)
-- ã�� ������ ��ġ�� ��ȯ 

-- �����Ͽ��� '@' ���� ��ġ ��ȸ 
SELECT EMAIL, INSTR(EMAIL, '@')
FROM EMPLOYEE;

-- �̸��Ͽ��� '@' ���� �ٷ� �ڿ� �ִ� 'K' ��ġ�� ��ȸ
-- ��, �ڿ��� ���� �˻���
SELECT EMAIL, INSTR(EMAIL, 'k', -1, 3)
FROM EMPLOYEE;

-- �̸��Ͽ��� '.'���� �ٷ� �ڿ� �ִ� 'c'�� ��ġ�� ��ȸ
-- ��, '.'���� �ٷ� �ձ��ں��� �˻� �����ϵ��� �� 
SELECT EMAIL, INSTR(EMAIL, 'c', INSTR(EMAIL, '.') - 1)
FROM EMPLOYEE;

-- LPAD('���ڸ��ͳ�' | ���ڰ� ��ϵ� �÷���, ����� �ʺ� ���ڼ�, ���¿��� ä�﹮��
-- ä�� ���ڰ� �����Ǹ� �⺻���� ' '(���� ������)
-- LPAD() : ���� ä���, RPAD() :������ ä��� 
SELECT EMAIL ����, LENGTH(EMAIL) ��������,
            LPAD(EMAIL, 20, '*' ),
            LENGTH(RPAD(EMAIL, 20, '*' ))
FROM EMPLOYEE;

SELECT EMAIL ����, LENGTH(EMAIL) ��������,
            RPAD(EMAIL, 20, '*' ),
            LENGTH(LPAD(EMAIL, 20, '*' ))
FROM EMPLOYEE;

-- LTRIM('���� ���ͳ�' | ���ڰ� ��ϵ� �÷���, '������ ���ڵ�')
-- ���ʿ� �ִ� ���ڵ��� ������ ���ڸ� ��ȯ�� 
-- RTRIM() : �����ʿ� �ִ� ���ڵ��� ������ ���ڸ� ��ȯ��
SELECT ' 01234abxyORCLExxxyy573 ',
        LTRIM('    01234abxyORCLExxxyy573      '),
        LTRIM('    01234abxyORCLExxxyy573      ',  ' '),
        LTRIM('    01234abxyORCLExxxyy573      ', '0123456789'),
        LTRIM('    01234abxyORCLExxxyy573      ', 'abxy012345')
FROM DUAL; 

SELECT ' 01234abxyORCLExxxyy573 ',
        RTRIM('    01234abxyORCLExxxyy573      '),
        RTRIM('    01234abxyORCLExxxyy573      ',  ' '),
        RTRIM('    01234abxyORCLExxxyy573      ', '0123456789'),
        RTRIM('    01234abxyORCLExxxyy573      ', 'abxy012345')
FROM DUAL;

--TRIM(LEADING | TRAILNG | BOTH '���� �� ����' FROM '���ڸ��ͷ�' | �÷���)
SELECT 'aaORACLEaa',
            TRIM('a' FROM 'aaORACLEaa'),
            TRIM(LEADING 'a' FROM 'aaORACLEaa'),
            TRIM(TRAILING 'a' FROM 'aaORACLEaa'),
            TRIM(BOTH 'a' FROM 'aaORACLEaa')
FROM DUAL;

-- SUBSTR('���ڸ��ͳ�' | ���ڰ� ��ϵ� �÷���, ������ ������ġ, ������ ���� ����)
-- ������ ������ġ : ���(�տ��� ������ ��ġ), ����(�ڿ��������� ��ġ)
-- ������ ���� ���� : �����Ǹ� ������ ������ �ǹ��� 
SELECT 'ORACLE 18C',
         SUBSTR('ORACLE 18C', 5),
         SUBSTR('ORACLE 18C', 8, 2),
         SUBSTR('ORACLE 18C', -7, 3)
FROM DUAL; 
-- ���� ���̺��� �ֹι�ȣ���� ����, ����, ������ ���� �и� ��ȸ
SELECT EMP_NO,
        SUBSTR(EMP_NO,  1, 2),
        SUBSTR(EMP_NO,  3, 2),
        SUBSTR(EMP_NO,  5, 2)
FROM EMPLOYEE; 

-- ��¥�� ǥ��ÿ� �ݵ�� ���ڿ� ���� '' ����
-- '21/11/11' ǥ���� 
-- SUBSTR() �� ��¥�����͵� ����Ҽ� ����
-- �������� �Ի��Ͽ��� �Ի�⵵, �Ի��, �Ի����� �и� ��ȸ
SELECT HIRE_DATE, 
        SUBSTR(HIRE_DATE,  1, 2),
        SUBSTR(HIRE_DATE,  4, 2),
        SUBSTR(HIRE_DATE,  7, 2)
FROM EMPLOYEE; 

--SUBSTRB('���ڸ��ͳ�' | ���ڰ� ��ϵ� �÷���, ������ ����Ʈ ��ġ, ������ ����Ʈ)
SELECT SUBSTR('ORACLE', 3, 2), 
            SUBSTRB('ORACLE', 3, 2),
            SUBSTR('����Ŭ', 2, 2),
            SUBSTRB('����Ŭ', 4, 6)
FROM DUAL;

-- UPPER('���� ���ͳ�' | ���ڰ� ��ϵ� �÷���)
-- �������ϋ� �빮�ڷ� �ٲٴ� �Լ� 
-- LOWER('���� ���ͳ�' | ���ڰ� ��ϵ� �÷���)
-- �������ϋ� �ҹ��ڷ� �ٲٴ� �Լ� 
-- INITCAP('���� ���ͳ�' | ���ڰ� ��ϵ� �÷���)
-- �������ϋ� ù���ڸ� �빮�ڷ� �ٲٴ� �Լ� 
SELECT UPPER('ORACLE'), UPPER('oracle'),
            LOWER('ORACLE'), LOWER('oracle'),
            INITCAP('ORACLE'), INITCAP('oracle')
FROM DUAL;

--�Լ���ø ��� ������ : �Լ��ȿ� �� ��ſ� �Լ��� ����Ҽ� ���� 
-- ���� �Լ��� ��ȯ�ϴ� ���� �ٱ� �Լ��� ����Ѵٴ� �ǹ��� 

-- ���� �������� �̸�, ���̵� ��ȸ
-- ���̵��  �̸��Ͽ��� �и� ������
SELECT EMP_NAME �̸�, EMAIL �̸���,
            SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')- 1)
FROM employee;      

--���� ���̺��� ��� , �̸�, �ֹι�ȣ ��ȸ
-- �ֹι�ȣ�� ���� ���ϸ� ���̰� �ϰ� ���ڸ��� "*"�� ó���� : 781125-********
SELECT EMP_ID �纻, EMP_NAME �̸�,
            RPAD(SUBSTR(EMP_NO, 1, 7), 14, ' * ' )
FROM EMPLOYEE;

-- ���� ó�� �Լ� ********************
-- ROUND(), TRUNC(), FLOOR(), ABS(), MOD()

--ROUND(���� | ���ڰ� ��ϵ� �÷��� | ����, �ݿø��� �ڸ���)
-- �������� �ڸ��� ���� ���� 5 �̻��̸�  �ڵ� �ݿø��Ѵ� 
-- �ݿø��� �ڸ����� ����̸� �Ҽ��� �Ʒ� �ڸ��� �ǹ��� 
-- �ݿø��� �����̸� �Ҽ��� ���� ���� �ڸ��� �ǹ��� 
SELECT 123.456,
        ROUND(123.456), -- 123
        ROUND(123.456, 0), -- 123
        ROUND(123.456, 1), -- 123.5
        ROUND(123.456, -1)
FROM DUAL;


-- ���� �������� ���, �̸�, ���ʽ� ����Ʈ, ���ʽ� ����Ʈ�� ����� ���� ��ȸ
-- ������ ��Ī : 1�� �޿� 
-- ������ õ�������� �ݿø���
SELECT EMP_ID ��� , EMP_NAME �̸�, SALARY �޿�, BONUS_PCT ���ʽ�����Ʈ,
            ROUND(((SALARY + (SALARY * NVL(BONUS_PCT, 0))) * )
FROM;

--TRUNC(���� | ���ڰ� ��ϵ� �÷��� | ����, �ڸ���)
-- ������ �ڸ����Ʒ��� ���� ������ �����Լ�, �ݿø� ���� 
SELECT 145.678
            TRUNC(145.678),
            TRUNC(145.678, 0),
            TRUNC(145.678, 1),
            TRUNC(145.678, -1),
            TRUNC(145.678, -3)
FROM DUAL;

-- ���� �������� �޿��� ����� ��ȸ
-- 10 �������� ������ 
SELECT AVG(SALARY), TRUNC(AVG(SALARY), -2)
FROM EMPLOYEE;

-- FLOOR(���� | ���ڰ� ��ϵ� �÷��� | ����)
-- ������ ����� �Լ� (�Ҽ��� �Ʒ��� ������ ����)
SELECT ROUND(123.5), TRUNC(123.5) FLOOR(123.5)
FROM DUAL;

-- ABS(���� | ���ڰ� ��ϵ� �÷��� | ����)
-- ���밪 ��ȯ�� (����� �״��, ������ ����� �ٲ�)
SELECT ABS(123), ABS(-123)
FROM DUAL;

--���� �������� �Ի��� - ����, �¤�


-- MOD(������, ������)
-- �������� �������� ��ȯ��
-- ���α׷��� % (MOD) ������ ��� ���� 
SELECT FLOOR(25 / 7) ��, MOD(25,7)������
FROM DUAL;

-- ���� �������� ����� Ȧ���� �������� ��ȸ 
-- ���, �̸� 
SELECT EMP_ID TKQJS, EMP_NAME �̸�
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2)= 1;


-- ��¥ ó�� �Լ� ******************************
-- SYSDATE �Լ� 
--�ý��� ���� ���� ���� ������ �ð��� ��ȸ�� �� 
SELECT SYSDATE
FROM DUAL;

-- ����Ŭ������ ȯ�� ���� , ��ü ���� �������� ��� ���� ���� �ϰ� �ִ� 
-- ����Ÿ ��ųʸ�(����Ÿ ����) ������ ���̺� ���·� ���� ���� �����ϰ� �ִ� 
-- ������ ��ųʸ��� DB �ý����� ������ . ����ڴ� �� ���  ���� 
-- ����� ������ ��ȸ�� ������ �ִ� 

-- ȯ�漳���� ���õ� �κ��� ���� ������ �Ϻ� �����Ҽ� ���� 
SELECT *
FROM SYS.NLS_SESSION_PARAMETERS;

-- ��¥ ����� ���õ� ���� ���� ��ȸ�Ѵٸ� 
SELECT VALUE
FROM SYS.NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- ��¥ ������ �����Ѵٸ� 
ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-RR';

-- Ȯ�� 
SELECT SYSDATE
FROM DUAL;

-- ���� �������� ����
ALTER NLS_DATE_FORMAT = 'RR/MM/DD'

-- ADD_MONTHS ('��¥' | ��¥�� ��ϵ� �÷���, ���� ������)
-- ���� �������� ���� ��¥�� ��ȯ��

--���� ��¥���� 6������ ��¥��?
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

-- ���� �������� �Ի��Ͽ��� 20��� ��¥ ��ȸ 
-- ���, �Ի��� 20��� ��¥ 
SELECT EMP_ID ���, EMP_NAME �̸�, HIRE_DATE �Ի���,
            ADD_MONTHS(HIRE_DATE, 240)"20�� �� ��¥"
FROM employee;

SELECT EMP_ID ���, EMP_NAME �̸�, HIRE_DATE �Ի���, DEPT_ID �μ��ڵ�, HIRE_DATE �Ի��� ,
            FLOOR((SYSDATE - HIRE_DATE) / 365)
FROM EMPLOYEE
WHERE ADD_MONTHS(HIRE_DATE, 240) < SYSDATE;

-- MONTHS_BETWEEN('��¥' | ��¥�� ��ϵ� �÷��� | ��¥�Լ�, �ι��� ��¥)
-- �� ��¥�� �������� ���̸� ��ȯ��

-- �������� �̸�, �л���, ��������� �ٹ��ϼ�, �ٹ� ������, �ٹ���� ��ȸ
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���,
        FLOOR(SYSDATE - HIRE_DATE) �ٹ��ϼ�, 
        FLOOR(MONTNHS_BETWEEN (SYSTATE, HIRD_DATE)) �ٹ�������,
        FLOOR(MONTNHS_BETWEEN (SYSTATE, HIRD_DATE) 12) �׹���� 
FROM EMPLOYEE; 

-- ���� �������� �̸�, �Ի���, �Ի��� ��(ù��)�� �ٹ��ϼ� ��ȸ
-- �ָ� ���� �ϼ� 
SELECT EMP_NAME �̸�, HIRE_DATE �Ի���,
         LAST_DAY(HIRE_DATE) - HIRE_DATE "�Ի� ù�� �ٹ��ϼ�"
FROM EMPLOYEE;

-- ���� ��¥ ��ȸ �Լ� 
SELECT SYSDATE, SYSTIMESTAMP,
            CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;

--EXTRACT(������ ���� FROM ��¥)
-- ��¥ ������ ���� ���ϴ� ������ ������ 
-- ������ ���� : YEAR, MONTH, HOUR, MINUTE, SECOND

--���� ��¥���� �⵵, ��, �� ���� ����
SELECT extract(YEAR FROM SYSDATE),
            extract(MONTH FROM SYSDATE),
            extract(DAY FROM SYSDATE)
FROM DUAL;

-- �������� �̸�, �Ի���, �ٹ���� ��ȸ
 SELECT EMP_NAME �̸�, HIRE_DATE �Ի���,
            EXTRACT(YEAR FROM SYSDATE) -  EXTRACT(YEAR FROM HIRE_DATE),
            FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)
FROM EMPLOYEE;
            
            
-- Ÿ�� (�ڷ��� ) ��ȯ �Լ� ************************************************

-- �ڵ��� ��ȯ(�Ͻ�����ȯ)�� ��� 
SELECT 25 + '10'












        
        
        






    



















