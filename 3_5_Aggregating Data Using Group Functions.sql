1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 표시하십시오. 열 레이블을 각각 Maximum, Minimum, Sum 및 Average로 지정하고 결과를 정수로 반올림 하십시오.

SELECT MAX(SALARY) Maximum, MIN(SALARY) Minimum, SUM(SALARY) Sum, ROUND(AVG(SALARY)) Average
FROM EMPLOYEES

2. 1번을 수정하여 각 업무 유형별로 표시하십시오.

SELECT JOB_ID, MAX(SALARY) Maximum, MIN(SALARY) Minimum, SUM(SALARY) Sum, ROUND(AVG(SALARY)) Average
FROM EMPLOYEES
GROUP BY JOB_ID

3. 업무가 동일한 사원 수를 표시하는 질의를 작성하십시오.

SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID

4. 관리자는 나열하지 말고 관리자 수를 확인하십시오. 열 레이블은 Number of Managers로 지정하십시오.

SELECT COUNT(DISTINCT MANAGER_ID) "Number of Managers"
FROM EMPLOYEES

5. 최고 급여와 최저 급여의 차액을 표시하는 질의를 작성하고 열 레이블을 DIFFERENCE로 지정하십시오.

SELECT MAX(SALARY) - MIN(SALARY) DIFFERENCE
FROM EMPLOYEES

6. 관리자 번호 및 해당 관리자에 속한 사원의 최저 급여를 표시하십시오. 관리자를 알 수 없는 사원 및 최저 급여가 $6,000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하십시오.

SELECT e.MANAGER_ID, MIN(e.SALARY)
FROM EMPLOYEES e
GROUP BY e.MANAGER_ID
HAVING e.MANAGER_ID is not NULL AND MIN(e.SALARY) >= 6000
ORDER BY MIN(e.SALARY) DESC

* 7. 각 부서에 대해 부서 이름, 위치, 사원 수 , 부서 내 모든 사원의 평균 급여를 표시하는 질의를 작성하고, 열 레이블을 각각 Name, Location, Number of People 및 Salary 로 지정하십시오. 평균 급여는 소수점 둘째 자리로 반올림하십시오.

SELECT d.DEPARTMENT_NAME "Name", d.LOCATION_ID "Location", COUNT(*) "Number of People", ROUND(AVG(SALARY), 2) "Salary"
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
GROUP BY d.DEPARTMENT_NAME, d.LOCATION_ID

* 8. 총 사원 수 및 2005, 2006, 2007, 2008년에 입사한 사원 수를 표시하는 질의를 작성하고 적합한 열 머리글을 작성하십시오.

SELECT COUNT(*) "TOTAL",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2005', 1, 0)) "2005",
	  SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2006', 1, 0)) "2006",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2007', 1, 0)) "2007",
    SUM(DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2008', 1, 0)) "2008"
FROM EMPLOYEES

* 9. 업무를 표시한 다음 해당 업무에 대해 급여 총액과 부서 별 급여 (20, 50, 80, 90)의 총액을 각각 표시하는 형렬 질의를 작성하고 각 열에 적합한 머리글을 지정하십시오.

SELECT JOB_ID, SUM(SALARY) "TOTAL", 
    SUM(DECODE(DEPARTMENT_ID, '20', SALARY, 0)) "20",
	  SUM(DECODE(DEPARTMENT_ID, '50', SALARY, 0)) "50",
    SUM(DECODE(DEPARTMENT_ID, '80', SALARY, 0)) "80",
    SUM(DECODE(DEPARTMENT_ID, '90', SALARY, 0)) "90"
FROM EMPLOYEES
GROUP BY JOB_ID
