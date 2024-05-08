1. EMP 테이블의 ID 열에 테이블 레벨의 PRIMARY KEY 제약 조건을 추가. 제약 조건 이름은 my_emp_id_pk로 지정하시오.

CREATE TABLE EMP(
    ID NUMBER(7), 
    LAST_NAME VARCHAR2(25), 
    FIRST_NAME VARCHAR2(25), 
    DEPT_ID NUMBER(7))

ALTER TABLE EMP
ADD CONSTRAINT "my_emp_id_pk" PRIMARY KEY(ID)

2. ID 열을 사용하여 DEPT 테이블에 PRIMARY KEY 제약 조건을 생성. 제약 조건 이름은 my_dept_id_pk로 지정하시오.

CREATE TABLE DEPT(ID Number(7), NAME VARCHAR2(25))

ALTER TABLE DEPT
ADD CONSTRAINT "my_dept_id_pk" PRIMARY KEY(ID)

3. EMP 테이블에 DEPT_ID 열을 추가. 존재하지 않는 부서에 사원이 배정되지 않도록 외래 키 참조를 EMP 테이블에 추가. 제약 조건 이름은 my_emp_dept_id_fk로 지정하시오.

ALTER TABLE EMP
ADD (DEPT_ID VARCHAR2(25))

ALTER TABLE EMP
ADD CONSTRAINT "my_emp_dept_id_fk" FOREIGN KEY(DEPT_ID)
REFERENCES DEPT(ID)

4. USER_CONSTAINTS 뷰를 질의하여 제약 조건이 추가되었는지 확인하시오. (EMP, DEPT 테이블만 질의)

5. EMP 테이블을 수정하여 십진 자릿수 2, 소수점 이하 자릿수 2인 NUMBER 데이터 유형의 COMMISSION 열을 추가하시오. 커미션 값이 0보다 크도록 커미션 열에 제약 조건을 추가하시오.

ALTER TABLE EMP
ADD (COMMISSION NUMBER(2, 2) CHECK(COMMISSION > 0))
