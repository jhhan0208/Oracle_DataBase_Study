1. DEPARTMENTS 테이블의 구조를 표시하고 테이블의 모든 데이터를 검색한다.

describe DEPARTMENTS
select * from DEPARTMENTS

2. EMPLOYEES 테이블의 내용을 검색시 사원번호, 사원이름, 업무코드, 입사일이 오도록 질의를 작성한다. HIRE_DATE 열에 STARTDATE라는 별칭을 지정한다.

select EMPLOYEE_ID, LAST_NAME, JOB_ID, HIRE_DATE AS "STARTDATE"
from EMPLOYEES

3. 이름과 JOB_ID를 연결한 다음 쉼표 및 공백으로 구분하여 표시하고, 열이름을 Employee and Title로 지정한다.

select LAST_NAME || ', ' || JOB_ID AS "Employee and Title"
from EMPLOYEES
