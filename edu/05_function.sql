-- 내장 함수 (Function)

-- 데이터 타입 변환 함수
SELECT 
-- 1234의 데이터 타입을 CHAR(6)으로 변경
-- 값 부분에 컬럼도 들어갈수있다 
	CAST(1234 AS CHAR(6)) , CONVERT(1234,CHAR(6));
	

SELECT CONVERT(emp_id, CHAR(20))
FROM employees
WHERE emp_id = 100006;

-- 제어 흐름 함수
-- IF(수식, 참일 경우의 값 , 거짓일 경우의 값)
SELECT 
	`name`
	, gender 
	, IF(gender = 'M', '남자' , '여자') ko_gender
FROM employees;

-- IFNULL(수식1,수식2)
--  수식1이 null이면 수식2 반한 , 아니면 수식1 반환
SELECT IFNULL(fire_at, '재직중'), fire_at
FROM employees;

-- NULLIF(수식1,수식2)
-- 수식1과 수식2가 같으면 NULL , 다르면 수식1 반환
SELECT NULLIF(gender,'M')
FROM employees;

-- CASE ~ WHEN ~ ELSE ~ END
SELECT CASE gender
			WHEN 'M' THEN '남자'
			WHEN 'F' THEN '여자'
			ELSE '기타'
		END ko_gender
FROM employees;

-- 문자열 함수

-- CONCAT : 문자열 연결
SELECT CONCAT('안녕', '','하세요');
SELECT CONCAT(`name`, gender) FROM employees;

-- CONCAT_WS () : 구분자로 문자열을 연결
SELECT CONCAT_WS(', ', '자바', 'JS', 'HTML');

-- 숫자에 자릿수 (,) 및 소수점 자리수 표시
SELECT FORMAT(salary,0) FROM salaries;

-- 문자열 왼/오른쪽부터 길이만큼 잘라 반환
SELECT LEFT('123456',2) , RIGHT('123456',2);

-- 문자열의 좌/우에 문자열 길이만큼 채울 문자열 삽입
SELECT LPAD('123',10,'0') , RPAD('123',10,'0');

-- 문자열의 좌/우 공백 제거
SELECT TRIM('  TEST   ') , LTRIM('      TEST ') , RTRIM('      TEST    ');
-- 특정 문자 제거 / 양쪽 a 제거
SELECT TRIM(BOTH 'a' FROM 'abcdefa'); 

-- 특정 문자 제거 / 왼쪽  a 제거
SELECT TRIM(LEADING 'a' FROM 'abcdefa'); 

-- 특정 문자 제거 / 오른쪽 a 제거
SELECT TRIM(TRAILING 'a' FROM 'abcdefa'); 

-- 문자열을 시작위치에서 길이만큼 잘라서 반환
SELECT SUBSTRING('123456', 3,2 );

-- 왼쪽부터 구분자가 n번째 만큼 나오면 그 이후를 버림
-- SUBSTRING_INDEX('abc_test_123.txt', '_' , 2)  문자열에서 두번째 _ 전 까지 반환 abc_test 
SELECT SUBSTRING_INDEX('abc_test_123.txt', '_' , 2);

-- 대소문자 변경
SELECT UPPER('abcABC') , LOWER('abcABC');

-- 수학함수
-- 올림 ,반올림, 버림
SELECT CEIL(3.14) , ROUND(3.14) , FLOOR(3.14);

-- 절대값
SELECT ABS(-1) , ABS(1);

-- 소수점 기준으로 특정 자리수까지 구하고 나머지를 버림
SELECT TRUNCATE(1.19,1);

-- 날짜 및 시간관련 함수
-- 현재 날짜 및 시간 반환
SELECT NOW();
-- YYYY-MM-DD 형식으로 변경하는 함수 DATE('날짜') DATE타입으로 변경
SELECT DATE(NOW());

-- 날짜의 단위기간에 따라 더한 날짜/시간을 반환
SELECT ADDDATE(NOW(),INTERVAL 1 YEAR); -- 1년 더하기
SELECT ADDDATE(NOW(),INTERVAL 5 DAY); -- 5일 더하기
SELECT ADDDATE(NOW(),INTERVAL -1 YEAR); -- 1년전
SELECT SUBDATE(NOW(),INTERVAL 3 MINUTE); -- 3분전

-- 순차 함수
-- RANK() OVER(ORDER BY 컬럼 ASC/DESC)
-- 지정한 컬럼을 기준으로 순위를 매겨 반환
-- 동일한 값이 있는 경우는 동일한 순위 부여
SELECT emp_id,salary,RANK() OVER(ORDER BY salary DESC) `rank`
FROM salaries
WHERE end_at IS NULL;

-- ROW_NUMBER() OVER(ORDER BY 컬럼 DESC)
-- 레코드의 순위를 매겨 반환
-- 동일한 값이 있어도 각 행에 고유한 번호 부여

SELECT emp_id,salary,ROW_NUMBER() OVER(ORDER BY salary DESC) `rank`
FROM salaries
WHERE end_at IS NULL;





