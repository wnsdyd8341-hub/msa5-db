-- SubQuery
-- WHERE 절 서브쿼리
-- 단일 행 서브쿼리
-- 반드시 서브쿼리 결과수가 1개여야함
-- 만약 2건 이상일 경우 오류 발생
-- D001 부서장의 사번과 이름 출력

SELECT emp.`name` , emp.emp_id 
FROM employees emp
WHERE emp.emp_id = (SELECT dept.emp_id
						FROM department_managers dept
						WHERE dept.dept_code = 'D001' AND dept.end_at IS NULL);

-- 현재 부사장인 사원의 사번과 이름을 출력
SELECT emp.`name` , emp.emp_id 
FROM employees emp
WHERE emp.emp_id IN (SELECT dept.emp_id
						FROM department_managers dept
						WHERE dept.end_at IS NULL);

-- 다중 열 서브쿼리
-- 현재 'D002' 부서장이 해당 부서에 소속 된 날짜를 출력
SELECT depe.start_at
FROM department_emps depe
WHERE (depe.emp_id,depe.dept_code) IN( 
	SELECT  depm.emp_id , depm.dept_code
	FROM department_managers depm
	WHERE depm.dept_code = 'D002'
	AND depm.end_at IS NULL
);

-- 연관 서브쿼리
-- 서브쿼리 내에서 메인쿼리의 컬럼이 사용된 서브쿼리
-- 부서장직을 지냈던 경력이 있는 사원의 정보를 출력
SELECT emp.*
FROM employees emp
WHERE emp.emp_id IN(SELECT depm.emp_id
							FROM department_managers depm
							WHERE depm.emp_id = emp.emp_id);


-- SELECT 절에서 사용하는 서브쿼리
-- 사원별 역대 전체 급여 평균
SELECT emp.emp_id , (SELECT AVG(sal.salary)
							FROM salaries sal
							WHERE sal.emp_id = emp.emp_id) avg_sal
FROM employees emp;

-- FROM 절에서 사용
SELECT * 
FROM  (SELECT emp.emp_id , emp.`name`
					FROM employees emp) tmp


-- INSERT 문 사용
INSERT INTO employees
(employees.emp_id, employees.`name` , employees.birth , employees.gender, employees.hire_at)
VALUES ((SELECT MAX(emp.emp_id) + 1 FROM employees emp) , '둘리' , '1980-01-01' , 'M',NOW());


-- UPDATE 문 사용
-- 퇴사한 사원의 퇴사일로 직급 테이블의 직급 종료일도 갱신
UPDATE title_emps
SET title_emps.end_at = ( SELECT employees.fire_at
									FROM employees
									WHERE employees.emp_id = 100017)
WHERE title_emps.emp_id = 100017 AND title_emps.end_at  IS NULL;



