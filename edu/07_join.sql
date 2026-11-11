-- JOIN 문
-- 복수의 테이블을 묶어서 하나의 결과 집합으로 출력

-- INNER JOIN
-- 공통으로 가지고 있는 레코드 출력
-- 전 사원의 사번 , 이름 , 현재급여를 출력
SELECT emp.emp_id, emp.`name` , sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id AND end_at IS NULL;
		
-- 재직중인 사원의 사번 , 이름, 생일, 부서명
SELECT emp.emp_id , emp.`name` , emp.birth , dep.dept_name
FROM employees emp
	JOIN department_emps depe
		ON emp.emp_id = depe.emp_id AND emp.fire_at IS NULL
	JOIN departments dep
		ON depe.dept_code = dep.dept_code AND depe.end_at IS NULL;
				
				
-- LEFT JOIN 	
-- 재직중 전 사원 정보를 출력하는데, 부서장인 사원이면 부서장 정보도 같이 출력
SELECT emp.emp_id , emp.`name` , depm.dept_code
FROM employees emp
	LEFT JOIN department_managers depm
		ON emp.emp_id = depm.emp_id AND emp.fire_at IS NULL AND depm.end_at IS NULL
ORDER BY depm.dept_code IS NULL , depm.dept_code ASC;
-- depm.dept_code IS NULL 이렇게 하면 IS NULL을 넣어주면 NULL인값은 1로 아닌값은 0으로 바꿔줘서 정렬이 된다


-- UNION
-- 두개 이상의 결과를 합쳐서 출력
-- UNION 중복 레코드를 제거

SELECT * FROM employees 
WHERE emp_id IN(1,3)
UNION 
SELECT * FROM employees 
WHERE emp_id IN(1,5);

-- UNION ALL 중복 레코드를 제거 안함
SELECT * FROM employees 
WHERE emp_id IN(1,3)
UNION ALL
SELECT * FROM employees 
WHERE emp_id IN(1,5);

-- SELF JOIN
-- 같은 테이블 끼리 조인
-- 현재 슈퍼바이저인 사원 정보 출력
-- 대댓글 같은거 쓸때 셀프조인씀
SELECT emp.emp_id junior_emp_id , emp.`name` junior_name ,sup.emp_id , sup.`name` 
FROM employees emp
	JOIN employees sup
		ON emp.sup_id = sup.emp_id AND emp.sup_id IS NOT NULL;





