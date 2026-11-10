-- 1번
SELECT *
FROM titles;

-- 2번
SELECT emp_id
FROM salaries
WHERE salary <=60000000 AND end_at IS NULL;

-- 3번
SELECT emp_id 
FROM salaries
WHERE (salary BETWEEN 60000000 AND 70000000 ) AND end_at IS NULL;


-- 4번 
SELECT *
FROM employees
WHERE emp_id IN(10001,10005);

-- 5번
SELECT title_code , title
FROM titles
WHERE title LIKE '%사%';

-- 6번
SELECT *
FROM employees
ORDER BY `name` ASC;

-- 7번
SELECT emp_id , AVG(salary)
FROM salaries 
GROUP BY emp_id;

-- 8번 
SELECT emp_id , AVG(salary)
FROM salaries 
GROUP BY emp_id HAVING AVG(salary) BETWEEN 30000000 AND 50000000; 

-- 9번
SELECT emp.emp_id , emp.`name` , emp.gender
FROM employees emp
WHERE emp.emp_id IN (SELECT sal.emp_id
							FROM salaries sal
							WHERE sal.end_at IS NULL
							GROUP BY emp_id HAVING AVG(sal.salary)>=70000000);

-- 10번
SELECT emp.emp_id , emp.`name`
FROM employees emp
WHERE emp.emp_id IN (SELECT te.emp_id
							FROM title_emps te
					WHERE te.title_code = 'T005' AND (te.end_at IS NULL));

