-- 유저 테이블
-- pk , 생년월일, 전화번호,  성별, 이름, 프로필, 주소, 이메일 , 비번
-- 가입일자 , 탈퇴일  , 작성일 ,  수정일 , 삭제일 
CREATE TABLE users(
	id 			   BIGINT 		 PRIMARY KEY AUTO_INCREMENT
	, email 		   VARCHAR(100) NOT NULL
	, `password`   VARCHAR(255) NOT NULL
	, user_name    VARCHAR(30)  NOT NULL
	, birth 		   DATE         NOT NULL
	, phone 		   CHAR(13)     NOT NULL COMMENT '\'010-xxxx-xxxx\'하이폰 포함 13자리'
	, gender 	   CHAR(1)      NOT NULL COMMENT '\'M\',\'F\''
	, addr_number  CHAR(5) 
	, addr1 		   VARCHAR(50)
	, addr2 		   VARCHAR(50)
	, `profile`    VARCHAR(100)
	, hired_at     DATE         NOT NULL DEFAULT (CURRENT_DATE()) -- 소괄호 안하면 에러남
	, withdrawn_at DATE 			 DEFAULT NULL
	, created_at   DATETIME 	 NOT NULL DEFAULT CURRENT_TIMESTAMP()
	, updated_at   DATETIME 	 NOT NULL DEFAULT CURRENT_TIMESTAMP()
	, deleted_at   DATETIME 	 DEFAULT NULL
	-- CONSTRAINT 키워드로 이름을 별도로 지정
	, CONSTRAINT uk_users_email UNIQUE (email)
); 

-- 게시글 테이블
-- pk , 제목 	, 본문 , 이미지  , 작성자 , 게시글 삭제일 , 작성일 ,  수정일 , 삭제일
CREATE TABLE posts(
	id 				BIGINT 			PRIMARY KEY AUTO_INCREMENT
	, user_id 		BIGINT 			NOT NULL COMMENT 'user_id 참조 작성자'
	, title 			VARCHAR(100) 	NOT NULL
	, contents 		VARCHAR(500) 
	, image 			VARCHAR(100) 	NOT NULL 
	, deactived_at DATE  			DEFAULT NULL
	, created_at 	DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP()
	, updated_at 	DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP()
	, deleted_at 	DATETIME 		DEFAULT NULL
	-- , CONSTRAINT fk_user_id 	FOREIGN KEY (user_id)  REFERENCES users (id)
);

-- ALTER 문
-- post 테이블에 fk 제약조건 추가
-- 현업에서는 CREATE에 fk 선언을 안하고 ALTER문에서 fk 선언을 해준다 
ALTER TABLE posts
ADD CONSTRAINT fk_posts_user_id FOREIGN KEY (user_id) REFERENCES users(id);

-- 제약조건 제거
ALTER TABLE posts
DROP CONSTRAINT fk_posts_user_id;

ALTER TABLE posts
DROP INDEX fk_posts_user_id;	

-- 컬럼 추가
-- NOT NULL 컬럼엔 DELAULT 값을 넣어서 만드는편 과부하 방지
ALTER TABLE users
ADD COLUMN birth_month CHAR(2) NOT NULL COMMENT '\'MM\''
-- DEFAULT (LPAD(MONTH(users.birth),2,'0'))  DEFAULT 값을 00으로 지정하는?거
;

-- 컬럼 수정 MODIFY

ALTER TABLE users	
MODIFY COLUMN birth_month CHAR(2) COMMENT '\'MM\'';

-- 컬럼 삭제
ALTER TABLE users
DROP COLUMN birth_month;

-- AUTO_INCREMENT 값 변경
-- 이건 안쓰는 쿼리문
ALTER TABLE users AUTO_INCREMENT = 1 ; 

-- TRUNCATE 문 : 테이블의 모든 데이터를 깨끗하게 제거하는 문

TRUNCATE TABLE users;

-- 테이블 삭제 

DROP TABLE users,posts;

DROP DATABASE test;
