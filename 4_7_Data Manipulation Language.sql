1. employees 테이블을 복사하여 cpy_emp 테이블을 생성하시오. describe문을 사용하여 employees와 cpy_emp의 스키마가 동일한지 확인하기 바랍니다.

CREATE TABLE cpy_emp AS
SELECT * FROM EMPLOYEES

desc EMPLOYEES
desc cpy_emp

2. 다음 예제 데이터의 첫 번째 데이터 행을 cpy_emp 테이블에 추가하십시오. Insert 절에 열을 나열하지 마십시오.

Employee_id 	First_name 	Last_name 	Email 	Hire_date 	Job_id
300 			Ralph 	Patel 		Rpatel 	Now 		SA_MAN
301 			Dancs 	Betty 		Bdancs 	Now 		SA_REP

INSERT 
INTO cpy_emp
VALUES (300, 'Ralph', 'Patel', 'Rpatel', NULL, 'Now', 'SA_MAN', NULL, NULL, NULL, NULL)

3. 위의 목록에 있는 예제 데이터의 두 번째 행을 cpy_emp 테이블에 추가하십시오. 이번에는 Insert 절에 열을 명시적으로 나열하십시오.

INSERT
INTO cpy_emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES('301','Dancs','Betty','Bdancs', NULL, SYSDATE,'SA_REP', NULL, NULL, NULL, NULL)

4. 301번 사원의 Last_name을 Drexler로 변경하십시오.

UPDATE cpy_emp
SET LAST_NAME = 'Drexler'
WHERE EMPLOYEE_ID = 301

5. 300, 301번 사원의 나머지 사원 정보를 Vance Jones와 동일하게 변경하십시오.

UPDATE cpy_emp
SET PHONE_NUMBER = (SELECT PHONE_NUMBER FROM cpy_emp WHERE FIRST_NAME = 'Vance' and LAST_NAME = 'Jones'),
    SALARY = (SELECT SALARY FROM cpy_emp WHERE FIRST_NAME = 'Vance' and LAST_NAME = 'Jones'),
    COMMISSION_PCT = (SELECT COMMISSION_PCT FROM cpy_emp WHERE FIRST_NAME = 'Vance' and LAST_NAME = 'Jones'),
    MANAGER_ID = (SELECT MANAGER_ID FROM cpy_emp WHERE FIRST_NAME = 'Vance' and LAST_NAME = 'Jones'),
    DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM cpy_emp WHERE FIRST_NAME = 'Vance' and LAST_NAME = 'Jones')
WHERE EMPLOYEE_ID = 300 or EMPLOYEE_ID = 301 

6. 급여가 3000미만인 모든 사원의 급여를 3000으로 변경하십시오.

UPDATE cpy_emp
SET SALARY = 3000
WHERE SALARY < 3000

7. Dancs Drexler 사원의 정보를 삭제하십시오.

DELETE 
FROM cpy_emp
WHERE FIRST_NAME = 'Dancs' and LAST_NAME = 'Drexler'
