-- UPDATE 문
-- DML 수정
-- UPDATE
-- SET[칼럼,칼럼2,칼럼3...title_emp_id]
-- WHERE절

UPDATE employees 
SET `name` = '준용'
WHERE emp_id = 100006;

-- 100006번 사원의 생일을 2020-01-01, 이름을 마이콜로 변경
UPDATE employees 
SET `name` = '마이콜',
	birth = '2020-01-01'
WHERE emp_id = 100006;
