-- Autogenerated: do not edit this file
DROP TABLE IF EXISTS BATCH_STAGING_SEQ ;
DROP TABLE IF EXISTS TRADE_SEQ ;
DROP TABLE IF EXISTS CUSTOMER_SEQ ;
DROP TABLE IF EXISTS BATCH_STAGING ;
DROP TABLE IF EXISTS TRADE ;
DROP TABLE IF EXISTS CUSTOMER ;
DROP TABLE IF EXISTS PLAYERS ;
DROP TABLE IF EXISTS GAMES ;
DROP TABLE IF EXISTS PLAYER_SUMMARY ;
DROP TABLE IF EXISTS ERROR_LOG ;

-- Autogenerated: do not edit this file

CREATE TABLE CUSTOMER_SEQ (ID BIGINT NOT NULL) type=MYISAM;
INSERT INTO CUSTOMER_SEQ values(5);
CREATE TABLE BATCH_STAGING_SEQ (ID BIGINT NOT NULL) type=MYISAM;
INSERT INTO BATCH_STAGING_SEQ values(0);
CREATE TABLE TRADE_SEQ (ID BIGINT NOT NULL) type=MYISAM;
INSERT INTO TRADE_SEQ values(0);

CREATE TABLE BATCH_STAGING  (
	ID BIGINT  NOT NULL PRIMARY KEY ,  
	JOB_ID BIGINT NOT NULL,
	VALUE BLOB NOT NULL,
	PROCESSED CHAR(1) NOT NULL
) type=InnoDB;

CREATE TABLE TRADE  (
	ID BIGINT  NOT NULL PRIMARY KEY ,  
	VERSION BIGINT ,
	ISIN VARCHAR(45) NOT NULL, 
	QUANTITY BIGINT ,
	PRICE DECIMAL(8,2) , 
	CUSTOMER VARCHAR(45) 
) type=InnoDB;
 
CREATE TABLE CUSTOMER (
	ID BIGINT  NOT NULL PRIMARY KEY ,  
	VERSION BIGINT ,
	NAME VARCHAR(45) ,
	CREDIT DECIMAL(10,2) 
) type=InnoDB;
 
INSERT INTO CUSTOMER (ID, VERSION, NAME, CREDIT) VALUES (1, 0, 'customer1', 100000);
INSERT INTO CUSTOMER (ID, VERSION, NAME, CREDIT) VALUES (2, 0, 'customer2', 100000);
INSERT INTO CUSTOMER (ID, VERSION, NAME, CREDIT) VALUES (3, 0, 'customer3', 100000);
INSERT INTO CUSTOMER (ID, VERSION, NAME, CREDIT) VALUES (4, 0, 'customer4', 100000);

CREATE TABLE PLAYERS (
	PLAYER_ID CHAR(8) NOT NULL PRIMARY KEY,  
	LAST_NAME VARCHAR(35) NOT NULL,
	FIRST_NAME VARCHAR(25) NOT NULL,
	POS VARCHAR(10) ,
	YEAR_OF_BIRTH BIGINT NOT NULL,
	YEAR_DRAFTED BIGINT NOT NULL
) type=InnoDB;

CREATE TABLE GAMES (
   PLAYER_ID CHAR(8) NOT NULL,
   YEAR_NO      BIGINT NOT NULL,
   TEAM      CHAR(3) NOT NULL,
   WEEK      BIGINT NOT NULL,
   OPPONENT  CHAR(3) ,
   COMPLETES BIGINT ,
   ATTEMPTS  BIGINT ,
   PASSING_YARDS BIGINT ,
   PASSING_TD    BIGINT ,
   INTERCEPTIONS BIGINT ,
   RUSHES BIGINT ,
   RUSH_YARDS BIGINT ,
   RECEPTIONS BIGINT ,
   RECEPTIONS_YARDS BIGINT ,
   TOTAL_TD BIGINT 
) type=InnoDB;

CREATE TABLE PLAYER_SUMMARY  (
		  ID CHAR(8) NOT NULL, 
		  YEAR_NO BIGINT NOT NULL,
		  COMPLETES BIGINT NOT NULL , 
		  ATTEMPTS BIGINT NOT NULL , 
		  PASSING_YARDS BIGINT NOT NULL , 
		  PASSING_TD BIGINT NOT NULL , 
		  INTERCEPTIONS BIGINT NOT NULL , 
		  RUSHES BIGINT NOT NULL , 
		  RUSH_YARDS BIGINT NOT NULL , 
		  RECEPTIONS BIGINT NOT NULL , 
		  RECEPTIONS_YARDS BIGINT NOT NULL , 
		  TOTAL_TD BIGINT NOT NULL
) type=InnoDB;

CREATE TABLE ERROR_LOG  (
		JOB_NAME CHAR(20) ,
		STEP_NAME CHAR(20) ,
		MESSAGE VARCHAR(300) NOT NULL
) type=InnoDB;
