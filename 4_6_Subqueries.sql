 1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. (Zlotkey는 제외)

SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME = 'Zlotkey')
AND E.LAST_NAME != 'Zlotkey'

- WHERE E.DEPARTMENT_ID in도 가능(뒤 값을 리스트로 해석 가능)
- > in 못쓰는 경우: WHERE E.DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 10000) > 오른쪽에 2개 이상의 값이 생성되기 때문에 동작 안됨
- > 도메인 지식으로 판단 중요

- 부질의 해석: 단일값(스칼라) > WHERE 절에 IN, = 사용 가능

- 부질의 없이: 

SELECT a.LAST_NAME, a.HIRE_DATE
FROM EMPLOYEES a, EMPLOYEES b
WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID
AND b.LAST_NAME = 'Zlotkey'
AND a.LAST_NAME != 'Zlotkey'

 2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 결과를 급여에 대해 오름차순으로 정렬하십시오.

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY E.SALARY

- 부질의 없이: 
SELECT a.EMPLOYEE_ID, a.LAST_NAME
FROM EMPLOYEES a, EMPLOYEES b
GROUP BY a.EMPLOYEE_ID, a.LAST_NAME, a.SALARY
HAVING a.SALARY > AVG(b.SALARY)

- > SELECT절에 나올 수 있는 것: group by에 나온거/aggregation 함수
- > HAVING절에 나올 수 있는 것: group함수만

- 각 사원에 대해, 다른 사원과 쌍을 만드는 질의?
SELECT a.EMPLOYEE_ID, a.LAST_NAME, b.EMPLOYEE_ID, b.LAST_NAME
FROM EMPLOYEES a, EMPLOYEES b
- '', 같은 부서만?
SELECT a.EMPLOYEE_ID, a.LAST_NAME, b.EMPLOYEE_ID, b.LAST_NAME
FROM EMPLOYEES a, EMPLOYEES b
WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID


 3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원번호와 이름을 표시하는 질의를 작성하십시오.

SELECT E.EMPLOYEE_ID, E.LAST_NAME
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%')

- 1, 3번의 포인트: 3번은 1번과 다르게 = 사용 불가(오른쪽 2개 이상)

 4. 부서 위치 ID가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하십시오.

SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.JOB_ID
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID = '1700')

부질의 없이:

SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = '1700'

 5. King에게 보고하는 모든 사원 이름과 급여를 표시하십시오.

SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
WHERE E.MANAGER_ID in (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = 'King')
AND E.LAST_NAME != 'King'

- "king"이름 2번 등장 > = 사용 불가

대안:

SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E
WHERE E.MANAGER_ID in (100, 156)
AND E.LAST_NAME != 'King'

 6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.

SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID
FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive')

- in 대신 = 써도 됨 > 쓸 수 있으면 in 대신 =을 쓰자(더 빠름)

 7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 모든 사원의 번호, 이름 및 급여를 표시하십시오.

SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID
FROM EMPLOYEES E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
AND E.DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%')

 8. 미국(locations.country_id = ‘US’) 내에서 근무하는 사원들의 평균 급여보다 많은 급여를 받는 사원의 번호, 이름 및 급여를 표시하십시오.

SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(E.SALARY) 
    			FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L  
    			WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    			AND D.LOCATION_ID = L.LOCATION_ID
    			AND L.COUNTRY_ID = 'US')

 9. 부서 별로 최고 급여를 받는 사원의 번호, 이름, 급여 몇 부서 번호를 표시하고 부서 번호에 대해 오름 차순 정렬을 하시오.

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY, E.DEPARTMENT_ID
FROM EMPLOYEES E
WHERE E.SALARY = (SELECT MAX(b.SALARY) FROM EMPLOYEES a, EMPLOYEES b
    			WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID
    			AND a.DEPARTMENT_ID = E.DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID

대안: 

select department_id,employee_id,last_name,salary 
from employees 
where employee_id in (select employee_id 
    					from employees 
    					where (salary, department_id) in ( select max(salary), department_id 
    														from employees 
    														group by department_id )) 
    														order by department_id;

 10. FROM 절을 사용하여 9 번 질의를 재 작성하시오.
 = from절에 sub 쿼리

???

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY, E.DEPARTMENT_ID
FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, MAX(salary) "MAX" 
    				  FROM employees 
    				  GROUP BY DEPARTMENT_ID) M
WHERE E.DEPARTMENT_ID = M.DEPARTMENT_ID AND SALARY = MAX
ORDER BY DEPARTMENT_ID

 11. 사원이 한 명 이상 존재하는 부서의 번호 및 부서 이름을 표시하시오.(exists 키워드 사용)

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D
WHERE EXISTS (SELECT DEPARTMENT_ID FROM EMPLOYEES
    		  WHERE DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID

- exists: 뒤 테이블이 empty table 아니면 참, empty table이면 거짓
- e: 현재 튜플을 가리키는 변수(tuple variable)
- 

 12. 다음을 참고하여 급여를 가장 적게 받는 사원 5명에 대한 정보를 표시하시오.

  select rownum, employee_id, last_name, salary
  from employees
  where rownum <= 5

SELECT rownum, E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY
FROM (SELECT * FROM EMPLOYEES ORDER BY SALARY) E
WHERE rownum <= 5

- rownum: 물리적으로 몇번째 행에 저장이 되었는지
- > > 불가, ~ 이하만 가능

SELECT EMPLOYEE_ID, SALARY
FROM EMPLOYEES
ORDER BY SALARY
LIMIT 2

SELECT rownum, E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY
FROM (SELECT * FROM EMPLOYEES ORDER BY SALARY) E
WHERE rownum = 2
