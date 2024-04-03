1. 급여가 $12,000를 넘는 사원의 이름과 급여를 표시

SELECT LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY > 12000

2. 사원 번호가 176인 사원의 이름과 부서 번호를 표시

SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 176

3. 급여가 $5,000에서 $12,000 사이에 포함되지 않는 모든 사원의 이름과 급여를 표시

SELECT LAST_NAME, SALARY
FROM EMPLOYEES 
WHERE SALARY not between 5000 and 12000

4. 2007년 2월 20일과 2007년 5월 1일 사이에 입사한 사원의 이름, 업무 ID 및 시작일을 표시하되, 시작일을 기준으로 오름차순으로 정렬하는 질의
– 날짜는 DATE ‘2007-02-20’ 같은 형태로 표시하면 됨

SELECT LAST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES 
WHERE HIRE_DATE between DATE'2007-02-20' and DATE'2007-05-01'
ORDER BY HIRE_DATE asc

5. 부서 20 및 50에 속하는 모든 사원의 이름과 부서 번호를 이름을 기준으로 영문자순으로 표시

SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID in (20, 50)
ORDER BY LAST_NAME asc

6. 급여가 $5,000와 $12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하고, 열 레이블을 Employee와 Monthly Salary로 각각 지정

SELECT LAST_NAME "Employee", SALARY "Monthly Salary"
FROM EMPLOYEES 
WHERE DEPARTMENT_ID in (20, 50) and SALARY between 5000 and 12000
ORDER BY LAST_NAME asc

* 7. 1994년에 입사한 모든 사원의 이름과 입사일을 표시

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') like '1994%'

8. 관리자가 없는 모든 사원의 이름과 업무 ID를 표시

SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES 
WHERE MANAGER_ID is NULL

9. 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 급여 및 커미션을 기준으로 내림차순으로 정렬하여 표시

SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES 
WHERE COMMISSION_PCT is not NULL
ORDER BY SALARY desc, COMMISSION_PCT desc

10. 이름의 세 번째 문자가 a인 모든 사원의 이름을 표시

SELECT LAST_NAME
FROM EMPLOYEES 
WHERE LAST_NAME like '__a%'

11. 이름에 a와 e가 있는 모든 사원의 이름을 표시

SELECT LAST_NAME
FROM EMPLOYEES 
WHERE LAST_NAME like '%a%' and LAST_NAME like '%e%'

12. 업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 급여가 $2,500, $3,500 또는 $7,000가 아닌 모든 사원의 이름, 업무 및 급여를 표시

SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES 
WHERE JOB_ID in ('SA_REP', 'ST_CLERK') and SALARY not in (2500, 3500, 7000)

13. 커미션 비율이 20%인 모든 사원의 이름, 급여 및 커미션을 표시

SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES 
WHERE COMMISSION_PCT = .2
