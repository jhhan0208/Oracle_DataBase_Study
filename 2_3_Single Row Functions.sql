* 1. 현재 날짜를 표시하는 질의를 작성하고 열 레이블을 Data로 지정하십시오.

SELECT SYSDATE AS DATA
FROM DUAL

2. 각 사원에 대해 사원 번호, 이름 , 급여 및 15% 인상된 급여를 정수로 표시하십시오. 인상된 급여 열의 레이블을 New Salary 로 지정하십시오.

SELECT EMPLOYEE_ID, LAST_NAME, SALARY, ROUND(SALARY*1.15) "New Salary"
FROM EMPLOYEES

3. 이름이 J, A또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는 질의를 작성하고 각 열에 적합한 레이블을 지정하십시오. 결과를 사원의 이름에 따라 정렬하십시오.

SELECT INITCAP(LAST_NAME) name, LENGTH(LAST_NAME) length
FROM EMPLOYEES
WHERE SUBSTR(LAST_NAME,1,1) in ('J', 'A', 'M')
ORDER BY LAST_NAME	

* 4. 각 사원의 이름을 표시하고 근무 달 수(입사일로부터 현재까지의 달 수)를 계산하여 열 레이블을 MONTHS_WORKED로 지정하십시오. 결과는 정수로 반올림하여 표시하고 근무 달 수를 기준으로 정렬하십시오.

SELECT LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS "MONTHS_WORKED"
FROM EMPLOYEES e
ORDER BY "MONTHS_WORKED"

5. 각 사원에 대해 다음 항목을 생성하는 질의를 작성하십시오. <employee last name> earn <salary> monthly but wants <3 times salary> 열 레이블을 Dream Salaries로 지정하십시오.

SELECT e.LAST_NAME || ' earn ' || e.SALARY || ' monthly but wants ' || 3*e.SALARY as "Dream Salaries"
FROM EMPLOYEES e

* 6.모든 사원의 이름과 급여를 표시하는 질의를 작성하십시오. 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열 레이블을 SALARY로 지정하십시오.

SELECT e.LAST_NAME, LPAD(e.SALARY, 15, '$') as "SALARY"
FROM EMPLOYEES e

* 7. 사원의 이름, 입사일 및 급여 검토일을 표시하십시오. 급여 검토일은 여섯 달이 경과한 후 첫 번째 월요일입니다. 열 레이블을 REVIEW로 지정하고 날짜는 “Monday, the Thirty-First of July, 2000”과 같은 형식으로 표시되도록 지정하십시오.

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIRE_DATE, 6), 'MONDAY'), 'FMday,"the" DDSPTH "of" Month,YYYY') AS REVIEW
FROM EMPLOYEES

8. 이름, 입사일 및 업무 시작 요일을 표시하고 열 레이블을 DAY로 지정하십시오. Monday를 시작으로 해서 요일을 기준으로 결과를 정렬하십시오.

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE, 'Day') as DAY
FROM EMPLOYEES e
ORDER BY TO_CHAR(HIRE_DATE-1, 'D')

* 9. 사원의 이름과 커미션을 표시하는 질의를 작성하십시오. 커미션을 받지 않는 사원일 경우 “No Commission”을 표시하십시오. 열 레이블은 COMM으로 지정하십시오.

SELECT LAST_NAME, NVL(TO_CHAR(COMMISSION_PCT), 'No Commission') as "COMM"
FROM EMPLOYEES e

* 10. 사원의 이름을 표시하고 급여 총액을 별표(*)로 나타내는 질의를 작성하십시오. 각 별표는 1,000달러를 나타냅니다. 급여를 기준으로 데이터를 내림차순으로 정렬하고 열 레이블을 EMPLOYEES_AND_THEIR_SALARIES로 지정하십시오.

SELECT LAST_NAME || ', ' || RPAD('*', ROUND(SALARY / 1000), '*') AS EMPLOYEES_AND_THEIR_SALARIES
FROM EMPLOYEES 
ORDER BY SALARY DESC

* 11. DECODE 함수를 사용하여 다음 데이터에 따라 JOB_ID 열의 값을 기준으로 모든 사원의 등급을 표시하는 질의를 작성하십시오. 
업무 등급
AD_PRES   A
ST_MAN    B
IT_PROG   C
SA_REP    D
ST_CLERK  E
기타      0

SELECT LAST_NAME, JOB_ID, 
    DECODE(JOB_ID, 'AD_PRES', 'A',
    				'ST_MAN', 'B',
    				'IT_PROG', 'C',
    				'SA_REP', 'D',
    				'ST_CLERK', 'E',
    				'0') AS RANK
FROM EMPLOYEES
ORDER BY SALARY DESC

* 12. 11번 문제의 명령문을 CASE 구문을 사용하여 재작성하십시오.

SELECT LAST_NAME, JOB_ID, 
    CASE JOB_ID WHEN 'AD_PRES' THEN 'A'
				WHEN 'ST_MAN' THEN 'B'
				WHEN 'IT_PROG' THEN 'C'
    				WHEN 'SA_REP' THEN 'D'
    				WHEN 'ST_CLERK' THEN 'E'
				ELSE '0'
				END AS RANK
FROM EMPLOYEES
ORDER BY SALARY DESC
