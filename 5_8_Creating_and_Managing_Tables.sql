1. 다음 테이블 인스턴트 차트를 기반으로 DEPT 테이블을 생성하십시오.

이름 		키 	유형 	널/고유 	FK 테이블 	FK 열 	데이터 유형 	길이
ID 										Number 		7
NAME 									VARCHAR2 		25

CREATE TABLE DEPT(ID Number(7), NAME VARCHAR2(25))

2. DEPARTMENT 테이블의 데이터를 DEPT 테이블에 추가하십시오.

ALTER TABLE  DEPT
ADD (SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES)

3. 다음 테이블 인스턴스 차트를 기반으로 EMP 테이블을 생성하십시오.

이름 		키 	유형 	널/고유 	FK 테이블 	FK 열 	데이터 유형 	길이
ID 										Number 		7
LAST_NAME 								VARCHAR2 		25
FIRST_NAME 								VARCHAR2 		25
DEPT_ID 									Number 		7

CREATE TABLE EMP(
    ID NUMBER(7), 
    LAST_NAME VARCHAR2(25), 
    FIRST_NAME VARCHAR2(25), 
    DEPT_ID NUMBER(7))

4. EMP 테이블의 LAST_NAME 열의 최대 길이를 50으로 수정하십시오.

ALTER TABLE EMP
MODIFY (LAST_NAME VARCHAR2(50))

5. EMP 테이블을 삭제하십시오.

DROP TABLE EMP

6. EMPLYEES 테이블 구조를 기반으로 EMPLOYEES2 테이블을 생성하십시오. EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY 및 DEPARTMENT_ID 열만 포함시키고 새 테이블의 열 이름을 각각 ID, FIRST_NAME, LAST_NAME, SALARY 및 DEPT_ID로 지정하십시오.

CREATE TABLE EMPLOYEES2 AS
(SELECT EMPLOYEE_ID "ID", FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID "DEPT_ID"
FROM EMPLOYEES)

7. EMPLOYEES2 테이블의 이름을 EMP로 변경하십시오.

	RENAME table_name1 to table_name2

RENAME EMPLOYEES2 to EMP

8. EMP 테이블에서 FIRST_NAME 열을 삭제하십시오.

ALTER TABLE EMP
DROP (FIRST_NAME)
