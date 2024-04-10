1. 모든 사원의 이름, 부서 번호, 부서 이름을 표시하는 질의를 작성하십시오.

SELECT e.LAST_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID

2. 부서 80에 속하는 모든 업무의 고유 목록을 작성하고 출력 결과에 부서의 위치를 포함시키십시오. (중복 제거)

SELECT DISTINCT e.JOB_ID, d.LOCATION_ID
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.DEPARTMENT_ID = 80

* 3. 커미션을 받는 모든 사원의 이름, 부서 이름, 위치 ID 및 도시를 표시하는 질의를 작성하십시오.

SELECT e.LAST_NAME, d.DEPARTMENT_NAME, d.LOCATION_ID, l.CITY
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND d.LOCATION_ID = l.LOCATION_ID
AND e.COMMISSION_PCT is not NULL

4. 이름에 a(소문자)가 포함된 모든 사원의 이름과 부서 이름을 표시하는 질의를 작성하십시오.

SELECT e.LAST_NAME, d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.LAST_NAME like '%a%'

* 5. Toronto에서 근무하는 모든 사원의 이름, 업무, 부서 번호 및 부서 이름을 표시하는 질의를 작성하십시오. (join, on 키워드 사용)

SELECT e.LAST_NAME, e.JOB_ID, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM EMPLOYEES e join DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
	join LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID AND l.CITY = 'Toronto'

6. 사원의 이름 및 사원 번호를 관리자의 이름 및 관리자 번호와 함께 표시하고, 각각의 열 레이블을 Employee, Emp#, Manager, Mgr#로 지정하십시오. (관리자가 없는 사원도 포함)

SELECT e.LAST_NAME Employee, e.EMPLOYEE_ID Emp#, m.LAST_NAME Manager, m.EMPLOYEE_ID Mgr#
FROM EMPLOYEES e left outer join EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID

* 7. 지정한 사원의 이름, 부서 번호 및 지정한 사원과 동일한 부서에서 근무하는 모든 사원을 표시하도록 질의를 작성하고, 각 열에 적합한 레이블을 지정하십시오. 또한 부서 번호, 사원 이름, 동일한 부서에서 근무하는 사원의 이름으로 오름 차순 정렬하시오.

SELECT a.DEPARTMENT_ID, a.LAST_NAME EMPLOYEE, b.LAST_NAME COLLEAGUE
FROM EMPLOYEES a inner join EMPLOYEES b
ON a.DEPARTMENT_ID = b.DEPARTMENT_ID
AND a.LAST_NAME < b.LAST_NAME
ORDER BY a.DEPARTMENT_ID, a.LAST_NAME, b.LAST_NAME

8. Davies라는 사원보다 늦게 입사한 사원의 이름과 입사일을 표시하는 질의를 작성하십시오.

SELECT a.LAST_NAME EMPLOYEE, a.HIRE_DATE
FROM EMPLOYEES a inner join EMPLOYEES b
ON a.HIRE_DATE > b.HIRE_DATE
AND b.LAST_NAME = 'Davies'

SELECT a.LAST_NAME EMPLOYEE, a.HIRE_DATE
FROM EMPLOYEES a
WHERE a.HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Davies')

9. 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 표시하는 질의를 작성하십시오.

SELECT e.LAST_NAME, e.HIRE_DATE, m.LAST_NAME, m.HIRE_DATE
FROM EMPLOYEES e, EMPLOYEES m
WHERE e.MANAGER_ID = m.MANAGER_ID
AND e.HIRE_DATE < m.HIRE_DATE
