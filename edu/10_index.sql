-- INDEX

-- INDEX 확인
SHOW INDEX FROM employees;

-- 0.04초 -> 0초 인덱스 부여해서 이렇게 짧아짐 
SELECT * FROM employees WHERE `name` = '이미경';

-- INDEX 생성 
ALTER TABLE employees
ADD INDEX idx_employees_name (`name`);

-- INDEX 제거
ALTER TABLE employees
DROP INDEX idx_employees_name;