--SELECT ���� 
/* 
���̺� ����� ����Ÿ�� �˘�(��ȸ : ã�Ƴ�������) �ϱ� ���� ����ϴ� SQL �����̴� 
DQL(Data Query Language : ������ ��ȸ��)����Ѵ� 

SELECT ���� �⺻ �ۼ���:
    SELECT * |�÷���, �÷���,�Լ�ǥ����| ����
    FROM ��ȸ�� ����� ���̺��;
    
* : ���̺� ���� ��� �÷��� �ǹ��Ѵ�
*/

-- ����(EMPLOYEE)���̺� ����� ��ü �����͸� ��ȸ�Ѵٸ� 
SELECT* 
FROM employee;

-- ���� ���̺��� ���, �̸� ,�ֹι�ȣ�� ��ȸ�Ѵٸ� 
SELECT EMP_ID, EMP_NAME, EMP_NO
FROM employee;

-- ���� ���̺��� ���, �̸�, �����ڵ�, �޿�, ����(�޿� * 12)
SELECT EMP_ID, EMP_NAME, JOB_ID, SALARY, SALARY * 12 
FROM EMPLOYEE;

-- ���̺��� ���ϴ� �����͸� ��ȸ�ϴ� ���°� 
--1. Ư�� �÷��� ��ȸ�ϴ� ��� 
SELECT EMP_NAME, JOB_ID, DEPT_ID
FROM EMPLOYEE;

-- 2. Ư������ ��ȸ�ϴ� ���
-- ���� ������ ������: �����ڵ尡 'J4'�� �������� ������ ��ȸ
SELECT *
FROM employee
WHERE JOB_ID = 'J4';

-- 3. Ư�� ��� Ư�� �÷��� ��ȸ�ϴ°�� 
-- Ư�� �� ��� ���� ������ ��� : WHERE ��
SELECT EMP_ID, EMP_NAME, JOB_ID, SALARY, BONUS_PCT
FROM employee
WHERE JOB_ID = 'J4';

-- 4. SELECT ������ �⺻ �Ѱ��� ���̺� ���� ������ ��ȸ��.
-- �ʿ��� ��쿡�� �������� ���̺��� ���ļ�(����) ���ϴ� �÷� �� ��ȸ�Ҽ� �ִ� 
SELECT emp_id, emp_name, dept_id, dept_name
FROM employee
JOIN department USING (dept_id);






