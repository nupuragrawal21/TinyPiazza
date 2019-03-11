DROP DATABASE IF EXISTS PROJECT1;

CREATE DATABASE PROJECT1;

USE PROJECT1;


CREATE TABLE PROJECT1.USER (
	  email_ID varchar(155) NOT NULL,
	  username varchar(45) NOT NULL,
	  password varchar(45) NOT NULL,
	  PRIMARY KEY (email_ID,username),
	  UNIQUE KEY email_ID_UNIQUE (email_ID),
	  UNIQUE KEY username_UNIQUE (username)
	  );
	  
	  CREATE TABLE PROJECT1.STUDENT (
	  student_ID int(11) NOT NULL,
	  email_ID varchar(155) NOT NULL,
	  PRIMARY KEY (student_ID),
	  UNIQUE KEY student_ID_UNIQUE (student_ID),
	  UNIQUE KEY email_ID_UNIQUE (email_ID),
	  KEY email_ID_idx (email_ID),
	  FOREIGN KEY (email_ID) REFERENCES USER (email_ID) 
	);

	CREATE TABLE PROJECT1.TEACHER (
	  teacher_ID int(11) NOT NULL,
	  email_ID varchar(155) NOT NULL,
	  PRIMARY KEY (teacher_ID,email_ID),
	  UNIQUE KEY teacher_ID_UNIQUE (teacher_ID),
	  UNIQUE KEY email_ID_UNIQUE (email_ID)
	);

	CREATE TABLE PROJECT1.COURSE (
	  course_ID varchar(32) NOT NULL,
	  school_year year(4) NOT NULL,
	  semester varchar(45) NOT NULL,
	  university varchar(45) NOT NULL,
	  course_name varchar(155) NOT NULL,
	  PRIMARY KEY (course_ID,school_year,semester,university)
	  );
	  
	  CREATE TABLE PROJECT1.QUESTION_POST (
	  post_ID int(11) NOT NULL,
	  courseID varchar(32) NOT NULL,
	  year year(4) NOT NULL,
	  sem varchar(45) NOT NULL,
	  univ varchar(45) NOT NULL,
	  title varchar(100) DEFAULT NULL,
	  description mediumtext,
	  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  userid varchar(155) NOT NULL,
      UNIQUE KEY post_ID_UNIQUE (post_ID),
	  PRIMARY KEY (post_ID),
	  FOREIGN KEY (courseID,year,sem,univ) REFERENCES COURSE (course_ID,school_year,semester,university) ,
	  FOREIGN KEY (userid) REFERENCES USER (email_ID));
	  
	  CREATE TABLE PROJECT1.ANSWER_POST (
	  POST_ID int(11) NOT NULL,
	  answer_no int(11) NOT NULL,
	  answer varchar(255),
	  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	  answered_by varchar(155) NOT NULL,
	  PRIMARY KEY (POST_ID,answer_no),
	  FOREIGN KEY (POST_ID) REFERENCES QUESTION_POST (post_ID) ,
	  FOREIGN KEY (answered_by) REFERENCES USER (email_ID)
	  
	  
	);

	CREATE TABLE PROJECT1.REGISTERS (
	  student_ID int(11) NOT NULL,
	  course_ID varchar(45) NOT NULL,
	  PRIMARY KEY (student_ID,course_ID),
	  UNIQUE KEY student_ID_UNIQUE (student_ID),
	  UNIQUE KEY course_ID_UNIQUE (course_ID),
	  KEY course_id_idx (course_ID),
	  KEY student_ID_idx (student_ID),
	  CONSTRAINT course_ID FOREIGN KEY (course_ID) REFERENCES COURSE (course_ID) ,
	  CONSTRAINT student_ID FOREIGN KEY (student_ID) REFERENCES STUDENT (student_ID) 
	);

	CREATE TABLE PROJECT1.CREATES (
	 course varchar(45) NOT NULL,
	 teacher int(11) NOT NULL,
	  PRIMARY KEY (course),
	  UNIQUE KEY course_UNIQUE (course),
	  KEY course_idx (course),
	  CONSTRAINT course FOREIGN KEY (course) REFERENCES COURSE (course_ID));
	  
	  
	CREATE TABLE PROJECT1.UPDATES (
	 C_ID varchar(45) NOT NULL,
	 T_ID int(11) NOT NULL,
	  PRIMARY KEY (T_ID,C_ID),
	  KEY T_idx (T_ID),
	  KEY c_idx (C_ID),
	  CONSTRAINT C_ID FOREIGN KEY (C_ID) REFERENCES COURSE (course_ID),
	  CONSTRAINT T_ID FOREIGN KEY (T_ID) REFERENCES TEACHER (teacher_ID)
	  );