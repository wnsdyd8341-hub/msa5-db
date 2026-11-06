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

-- 생일 2000-01-01 이후 사원 조회
SELECT *
FROM employees
WHERE birth >= '2000-01-01';

-- 퇴사하지 않은 사원 정보 찾기 퇴사안하면 NULL
SELECT * 
FROM employees
WHERE fire_at is NULL;

-- 퇴사 한 사원 정보 찾기
SELECT * 
FROM employees
WHERE fire_at is NOT NULL;

-- 1990년생인 사원 조회
SELECT *
FROM employees
WHERE birth BETWEEN '1990-01-01' AND '1990-12-31';

-- 이름이 박보람 or 정유리인 사원 조회
SELECT *
FROM employees
WHERE `name` = '박보람' OR `name` = '정유리';

-- 이름이 정유리 이거나 , 1990년생인 사원 조회
SELECT *
FROM employees
WHERE `name` = '정유리' OR birth BETWEEN '1990-01-01' AND '1990-12-31';

-- BETWEEN 연산자 : 범위 내 데이터 조회


-- IN 연산자 : 다수의 지정한 값과 일치하는 데이터를 조회
SELECT *
FROM employees
WHERE `name` IN('정유리','박보람');

-- 사번이 10001, 10005, 10006 정보 조회
SELECT *
FROM employees
WHERE emp_id IN(10001,10005,10006);

-- LIKE 절 : 문자열의 내용 조회
-- % : 글자수 상관없이 조회
-- 이름이 우로 끝나는 사원 조회
SELECT *
FROM employees
WHERE `name` LIKE '%우';

-- (_) : 언더바 개수만큼 글자수 허용해서 조회
-- 중간이 우인사람 출력
SELECT *
FROM employees
WHERE `name` LIKE '_우%';

-- ORDER BY 절 : 데이터 정렬
SELECT *
FROM employees
ORDER BY `name`,birth;

-- LIMIT 키워드 , OFFSET 키워드 : 출력 개수를 제한
SELECT *
FROM employees
LIMIT 5 OFFSET 1;

-- 집계함수
SELECT SUM(salary) sum_sal
FROM salaries
WHERE end_at IS NULL;

SELECT MAX(salary) max_sal
FROM salaries
WHERE end_at IS NULL;

SELECT M/IN(salary) min_sal
FROM salaries
WHERE end_at IS NULL;

SELECT AVG(salary) avg_sal
FROM salaries
WHERE end_at IS NULL;


SELECT COUNT(*)
FROM employees
WHERE fire_at IS NULL;

-- DISTINCT : 중복된 레코드 없이 출력
SELECT DISTINCT `name`
FROM employees
ORDER BY `name`;


-- GROUP BY HAVING   : SELECT절에 적을수있는거 2개뿐  GROUP BY절에 언급한 컬럼 or 집계함수
SELECT dept_code , COUNT(dept_emp_id) cnt_emps
FROM department_emps
WHERE end_at IS null
GROUP BY dept_code;

-- 직급별 사원수가 1만명 이상인 직급 조회
SELECT title_code, COUNT(*) cnt
FROM title_emps
WHERE end_at IS NULL
GROUP BY title_code HAVING COUNT(*) >=10000;








