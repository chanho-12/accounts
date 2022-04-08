-- DAY3_SELECT3.SQL
--오라클이 제공하는 함수 

--함수(FUNCTION)*************
-- 컬럼에 기록된 값을 읽어서 처리한 결과를 반환하는 형태이다 
-- 함수명(컬럼명) 사용 
-- 단일행 함수 : 읽은 값이 N계이면 반환값도 N개임 
-- 그룹함수 : 읽은 값이 N 개 면 반환값은 1개임 

-- 그룹함수 
--SUM(), AVG(), MAX(), MIN(), COUNT

-- SUM(컬럼명)| SUM(DISTINCT 컬럼명)
-- 합계를 구해서 반환한다 

--소속 부서가 "50" 이거나 부서가 배정되지 않은 직원들의 급여를 합계를 조회
SELECT SUM(SALARY) 급여합계, SUN(DISTNCT SALARY) " 중복 제외 급여 합계"
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;

--단일행 함수와 그룹합수는 SELECT 절에 같이 사용할수 없다 
--ORDB(Object Relational DataBase) ; 객체 관계형 데이타 베이스 
-- 2차원 테이블(표) 구조로 저장 데이터를 표현함(사각형이어야 함 
--계단형 모양의 결과는 표현 할수없다)
SELECT UPPER(EMAIL, SUM(SALARY)) --22행, 1행
FROM EMPLOYEE -- 에러 

-- WHERE 절에서 비교값에 그룹함수 사용할 수 없음
-- WHERE 절이 한 행씩 조건 비교를 하기 때문임 
-- 예 : 전 직원의 급여 평균보다 급여를 많이 받는 직원 정보 조회
--          사번 , 이름, 급여
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > AVG(SALARY); --ERROR

-- 해결 : 서브쿼리 사용 
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 해결 2 전체 급여 평균을 따로 조회해서 나온 결과값을 사용 
SELECT AVG(SALARY)
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > 2961818; 

-- AVG(컬럼명) | AVG(DISTINCT 컬럼명)
-- 평균을 구해서 반환함

-- 소속 부서가 50 또는 90 또는 NULL인 직원들의 보너스포인트 평균 조회
SELECT AVG(BONUS_PCT),
          AVG(DLSTINCT BONUS_PCT),
          AVG(NVL(BONUS_PCT, 0))
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90' ) OR DEPT_ID IS NULL;

-- MAX(컬럼명) | MAX(DISTINCT 컬럼명)
-- 가장큰값 반환 
--MIN(컬럼명) | MIN (DISTLINCT 컬럼명)
-- 가장 작은 값 반환

--문자형(CHAR, VARCHAR2, LONG, CLOB), 숫자형(NUMBER), 날짜형(DATE)
--모두 사용할수있음 

-- 부서코드가 50 또는 90인 직원들의 
-- 직급코드릐 최대값, 최소값
-- 입사일 최대값 최소값
--급여의 최대값, 최소값 조회 
SELECT MAX(JOB_ID), MIN(JOB_ID),
MAX(HIRE_DATE), MIN(HIRE_DATE), 
MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_ID IN ('50','90');


--COUNT(*) | COUNT(컬럼명) | COUNT(DISTINCT 컬럼명)
-- * : 테이블 전체 핼 갯수 반환
-- 컬럼명 : NULL 을 제외한 기록값의 행 갯수 반환

SELECT COUNT(*),
            COUNT(DEPT_ID),
            COUNT(DISTINCT DEPT_ID) 
FROM EMPLOYEE
WHERE DEPT_ID = '50' OR DEPT_ID IS NULL;

-- 단일행 함수 (SINGLE ROW FUNCTION) **************************

-- 문자 처리함수 -----------------------

--LENGTH('문자리터럴' | 문자가 기록된 컬럼명 )
--글자 갯수 반환함

SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;
--테이블 없이 단순한 계산 결과면 SELECT 하는 경우에는 
-- FROM에 더미(DUMMY) 테이블을 사용하면됨 
--오라클 제공하는 DUAL을 사용함
/*
SELECT 계산식
FROM DUAL;
*/

SELECT 12 + 3 * 5
FROM DUAL;

SELECT SYSDATE
FROM DUAL 

SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

-- LENGTHB('문자리터널' | 문자가 기록될 컬럼명)
-- 기록 글자의 바이트 크기롤 반환함 
SELECT LENGTH('ORACLE'), LENGTHB('ORACLE'),
            LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;
-- 오라클 구입제품일 때는 한글 1글자가 2바이트임.
-- EXPRESS EDITION 제품은 한글 1글자가 3 바이트로 처리됨

-- INSTR('문자리터럴' | 문자가 기록된 컬럼명, 찾을 문자, 찾을 시작위치, 몇번째 문자)
-- 찾을 문자의 위치를 반환 

-- 이케일에서 '@' 문자 우치 조회 
SELECT EMAIL, INSTR(EMAIL, '@')
FROM EMPLOYEE;

-- 이메일에서 '@' 문자 바로 뒤에 있는 'K' 위치를 조회
-- 단, 뒤에서 부터 검색함
SELECT EMAIL, INSTR(EMAIL, 'k', -1, 3)
FROM EMPLOYEE;

-- 이메일에서 '.'문자 바로 뒤에 있는 'c'의 우치를 조회
-- 단, '.'문자 바로 앞글자부터 검색 시작하도록 함 
SELECT EMAIL, INSTR(EMAIL, 'c', INSTR(EMAIL, '.') - 1)
FROM EMPLOYEE;

-- LPAD('문자리터널' | 문자가 기록된 컬럼명, 출력할 너비 글자수, 남는영역 채울문자
-- 채울 문자가 생략되면 기본값은 ' '(공백 문자임)
-- LPAD() : 왼쪽 채우기, RPAD() :오르쪽 채우기 
SELECT EMAIL 원본, LENGTH(EMAIL) 원본길이,
            LPAD(EMAIL, 20, '*' ),
            LENGTH(RPAD(EMAIL, 20, '*' ))
FROM EMPLOYEE;

SELECT EMAIL 원본, LENGTH(EMAIL) 원본길이,
            RPAD(EMAIL, 20, '*' ),
            LENGTH(LPAD(EMAIL, 20, '*' ))
FROM EMPLOYEE;

-- LTRIM('문자 리터널' | 문자가 기록된 컬럼명, '제거할 문자들')
-- 왼쪽에 있는 문자들을 제거한 문자를 반환함 
-- RTRIM() : 오른쪽에 있는 문자들을 제거한 문자를 반환함
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

--TRIM(LEADING | TRAILNG | BOTH '제거 할 문자' FROM '문자리터럴' | 컬럼명)
SELECT 'aaORACLEaa',
            TRIM('a' FROM 'aaORACLEaa'),
            TRIM(LEADING 'a' FROM 'aaORACLEaa'),
            TRIM(TRAILING 'a' FROM 'aaORACLEaa'),
            TRIM(BOTH 'a' FROM 'aaORACLEaa')
FROM DUAL;

-- SUBSTR('문자리터널' | 문자가 기록된 컬럼명, 추출할 시작위치, 추출할 글자 갯수)
-- 추출할 시작위치 : 양수(앞에서 부터의 위치), 음수(뒤에서부터의 위치)
-- 추출할 글자 갯수 : 생략되면 끝글자 까지를 의미함 
SELECT 'ORACLE 18C',
         SUBSTR('ORACLE 18C', 5),
         SUBSTR('ORACLE 18C', 8, 2),
         SUBSTR('ORACLE 18C', -7, 3)
FROM DUAL; 
-- 직원 테이블의 주민번호에서 생년, 생월, 생일을 각각 분리 조회
SELECT EMP_NO,
        SUBSTR(EMP_NO,  1, 2),
        SUBSTR(EMP_NO,  3, 2),
        SUBSTR(EMP_NO,  5, 2)
FROM EMPLOYEE; 

-- 날짜값 표기시에 반드시 문자와 같이 '' 묶음
-- '21/11/11' 표기함 
-- SUBSTR() 은 날짜데이터도 사용할수 있음
-- 직원들의 입사일에서 입사년도, 입사월, 입사일을 분리 조회
SELECT HIRE_DATE, 
        SUBSTR(HIRE_DATE,  1, 2),
        SUBSTR(HIRE_DATE,  4, 2),
        SUBSTR(HIRE_DATE,  7, 2)
FROM EMPLOYEE; 

--SUBSTRB('문자리터널' | 문자가 기록된 컬럼명, 추출할 바이트 위치, 추출할 바이트)
SELECT SUBSTR('ORACLE', 3, 2), 
            SUBSTRB('ORACLE', 3, 2),
            SUBSTR('오라클', 2, 2),
            SUBSTRB('오라클', 4, 6)
FROM DUAL;

-- UPPER('문자 리터널' | 문자가 기록된 컬럼명)
-- 영문자일떄 대문자로 바꾸는 함수 
-- LOWER('문자 리터널' | 문자가 기록된 컬럼명)
-- 영문자일떄 소문자로 바꾸는 함수 
-- INITCAP('문자 리터널' | 문자가 기록된 컬럼명)
-- 영문자일떄 첫들자만 대문자로 바꾸는 함수 
SELECT UPPER('ORACLE'), UPPER('oracle'),
            LOWER('ORACLE'), LOWER('oracle'),
            INITCAP('ORACLE'), INITCAP('oracle')
FROM DUAL;

--함수중첩 사용 가능함 : 함수안에 값 대신에 함수를 사용할수 있음 
-- 안쪽 함수가 반환하는 값을 바깥 함수가 사용한다는 의미임 

-- 직원 정보에서 이름, 아이디 조회
-- 아이디는  이메일에서 분리 추출함
SELECT EMP_NAME 이름, EMAIL 이메일,
            SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')- 1)
FROM employee;      

--직원 테이블에서 사번 , 이름, 주민번호 조회
-- 주민번호는 생년 월일만 보이게 하고 뒤자리는 "*"로 처리함 : 781125-********
SELECT EMP_ID 사본, EMP_NAME 이름,
            RPAD(SUBSTR(EMP_NO, 1, 7), 14, ' * ' )
FROM EMPLOYEE;

-- 숫자 처리 함수 ********************
-- ROUND(), TRUNC(), FLOOR(), ABS(), MOD()

--ROUND(숫자 | 숫자가 기록된 컬럼명 | 계산식, 반올림할 자릿수)
-- 버려지는 자리의 값이 값이 5 이상이면  자동 반올림한다 
-- 반올림할 자릿수가 양수이면 소숫점 아래 자리를 의미함 
-- 반올림할 음수이면 소숫점 왼쪽 정수 자리를 의미함 
SELECT 123.456,
        ROUND(123.456), -- 123
        ROUND(123.456, 0), -- 123
        ROUND(123.456, 1), -- 123.5
        ROUND(123.456, -1)
FROM DUAL;


-- 직원 정보에서 사번, 이름, 보너스 포인트, 보너스 포인트가 적용된 연봉 조회
-- 연봉은 별칭 : 1년 급여 
-- 연봉은 천단위에서 반올림함
SELECT EMP_ID 사번 , EMP_NAME 이름, SALARY 급여, BONUS_PCT 본너스포인트,
            ROUND(((SALARY + (SALARY * NVL(BONUS_PCT, 0))) * )
FROM;

--TRUNC(숫자 | 숫자가 기록될 컬럼명 | 계산식, 자릿수)
-- 지정한 자릿수아래의 값을 버리는 절석함수, 반올림 없음 
SELECT 145.678
            TRUNC(145.678),
            TRUNC(145.678, 0),
            TRUNC(145.678, 1),
            TRUNC(145.678, -1),
            TRUNC(145.678, -3)
FROM DUAL;

-- 직원 정보에서 급여의 평균을 조회
-- 10 단위에서 절삭함 
SELECT AVG(SALARY), TRUNC(AVG(SALARY), -2)
FROM EMPLOYEE;

-- FLOOR(숫자 | 숫자가 기록될 컬럼명 | 계산식)
-- 정수로 만들기 함수 (소숫점 아래값 무조건 버림)
SELECT ROUND(123.5), TRUNC(123.5) FLOOR(123.5)
FROM DUAL;

-- ABS(숫자 | 숫자가 기록될 컬럼며 | 계산식)
-- 절대값 반환함 (양수는 그대로, 음수는 양수로 바꿈)
SELECT ABS(123), ABS(-123)
FROM DUAL;

--직원 정보에서 입사일 - 오늘, 온ㄹ


-- MOD(나눌값, 나눌수)
-- 나누기한 나머지를 반환함
-- 프로그램의 % (MOD) 연산자 사용 못함 
SELECT FLOOR(25 / 7) 몫, MOD(25,7)나머지
FROM DUAL;

-- 직원 정보에서 사번이 홀수인 직원들을 조회 
-- 사번, 이름 
SELECT EMP_ID TKQJS, EMP_NAME 이름
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2)= 1;


-- 날짜 처리 함수 ******************************
-- SYSDATE 함수 
--시스템 으로 부터 현재 날씨와 시간을 조회헤 옴 
SELECT SYSDATE
FROM DUAL;

-- 오러클에서는 환경 설정 , 객체 관련 정보들을 모두 저장 관리 하고 있다 
-- 데이타 딕셔너리(데이타 사전) 영역에 테이블 형태로 가각 저장 관리하고 있다 
-- 데이터 딕셔너리는 DB 시스템이 관리함 . 사용자는 손 댈수  없음 
-- 저장된 정보를 조회해 볼수는 있다 

-- 환경설정과 관련된 부분은 샛팅 정보를 일부 변경할수 있음 
SELECT *
FROM SYS.NLS_SESSION_PARAMETERS;

-- 날짜 포멧과 관련된 변수 값만 조회한다면 
SELECT VALUE
FROM SYS.NLS_SESSION_PARAMETERS
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 날짜 포멧을 수정한다면 
ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-RR';

-- 확인 
SELECT SYSDATE
FROM DUAL;

-- 원래 포멧으로 변경
ALTER NLS_DATE_FORMAT = 'RR/MM/DD'

-- ADD_MONTHS ('날짜' | 날짜가 기록된 컬럼명, 더할 개월수)
-- 더한 개월수에 대한 날짜가 반환됨

--오늘 날짜에서 6개월뒤 날짜는?
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

-- 직원 정보에서 입사일에서 20년된 날짜 조회 
-- 사번, 입사일 20년된 날짜 
SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일,
            ADD_MONTHS(HIRE_DATE, 240)"20년 된 날짜"
FROM employee;

SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일, DEPT_ID 부서코드, HIRE_DATE 입사일 ,
            FLOOR((SYSDATE - HIRE_DATE) / 365)
FROM EMPLOYEE
WHERE ADD_MONTHS(HIRE_DATE, 240) < SYSDATE;

-- MONTHS_BETWEEN('날짜' | 날짜가 기록된 컬럼명 | 날짜함수, 두번쨰 날짜)
-- 두 날짜의 개월수의 차이를 변환함

-- 직원들의 이름, 압사일, 현재까지는 근무일수, 근문 개월수, 근무년수 조회
SELECT EMP_NAME 이름, HIRE_DATE 입사일,
        FLOOR(SYSDATE - HIRE_DATE) 근무일수, 
        FLOOR(MONTNHS_BETWEEN (SYSTATE, HIRD_DATE)) 근무개월수,
        FLOOR(MONTNHS_BETWEEN (SYSTATE, HIRD_DATE) 12) 그무년수 
FROM EMPLOYEE; 

-- 직원 정보에서 이름, 입사일, 입사한 월(첫달)의 근무일수 조회
-- 주말 포함 일수 
SELECT EMP_NAME 이름, HIRE_DATE 입사일,
         LAST_DAY(HIRE_DATE) - HIRE_DATE "입사 첫달 근무일수"
FROM EMPLOYEE;

-- 오늘 날짜 조회 함수 
SELECT SYSDATE, SYSTIMESTAMP,
            CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;

--EXTRACT(추출할 정보 FROM 날짜)
-- 날짜 데이터 에서 원하는 정보만 추출함 
-- 추출할 정보 : YEAR, MONTH, HOUR, MINUTE, SECOND

--오늘 날짜에서 년도, 월, 일 따로 추출
SELECT extract(YEAR FROM SYSDATE),
            extract(MONTH FROM SYSDATE),
            extract(DAY FROM SYSDATE)
FROM DUAL;

-- 직원들의 이름, 입사일, 근무년수 조회
 SELECT EMP_NAME 이름, HIRE_DATE 입사일,
            EXTRACT(YEAR FROM SYSDATE) -  EXTRACT(YEAR FROM HIRE_DATE),
            FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12)
FROM EMPLOYEE;
            
            
-- 타입 (자료형 ) 변환 함수 ************************************************

-- 자동형 변환(암시적변환)의 경우 
SELECT 25 + '10'












        
        
        






    



















