-- Select 문
-- DML 중 하나
-- 조회하는 쿼리
-- 조회한 데이터 중 특정 컬럼 출력
SELECT emp_id
	,`name`
	,gender
FROM employees;

-- Asterrisk (*)
SELECT *	
FROM employees;

-- WHERE 절 : 조건에 맞는 데이터 조회
-- 사번이 10009인 사원의 모든정보 조회
SELECT *
FROM employees
WHERE emp_id = 10009;

-- 사원명이 박보람인사람 정보 조회
SELECT *
FROM employees
WHERE `name` = "박보람";

SELECT *
FROM employees
WHERE birth >= "2000-01-01";

