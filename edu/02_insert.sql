-- INSERT INTO문
-- DML 
-- INSERT INTO 테이블명 [(컬럼1, 컬럼2 ...)]
-- VALUES (값1, 값2...);

INSERT INTO employees (
	`name`
	, birth
	, gender
	, hire_at)
VALUES ('김준용', '1998-12-03','M',NOW());

SELECT *
FROM employees;


-- 복수의 레코드를 삽입하고 싶을 경우
INSERT INTO employees (`name`, birth, gender, hire_at)
VALUES ('갑순이', '1998-03-03','M',NOW())
, ('홍길동', '1998-02-03','M',NOW())
, ('갑돌이', '1998-01-03','M',NOW());


-- SELECT INSERT
-- 조회된 결과를 가지고 INSERT를 실행
INSERT INTO title_emps(emp_id, title_code, start_at)
SELECT emp_id, 'T001', NOW() 
FROM employees
WHERE emp_id >=100000;

SELECT *
FROM title_emps
WHERE title_code = 'T001';

