\c socialmedia

--INSERT INTO USER DETAILS
INSERT INTO User_Detail VALUES (1,'John','Doe','Brooks valley','jd101','johndoe@test.com','4 square block',995544,'2001-01-01',NULL,'male');
INSERT INTO User_Detail VALUES (2,'Jane','Bosco','Brian convent','jan101','jbosco@test.com','8 square block',887766,'2000-07-01',ARRAY ['1','3'],'female');

UPDATE user_detail SET friends = array_append(friends,'2') WHERE fname='John';

INSERT INTO User_Detail VALUES (3,'Mike','Tyson','lulwa convent','themike','tyson@test.com','3 dark avenue',445533,'2002-07-01',ARRAY ['2'],'male');

--INSERT INTO USER AUTH
INSERT INTO UserAuth VALUES(1,'jd101','johndoe@test.com','johnd12!@');
INSERT INTO UserAuth VALUES(2,'jan101','jbosco@test.com','jand12!@');
INSERT INTO UserAuth VALUES(3,'themike','tyson@test.com','mikey12!@');


--INSERT INTO PAGES
INSERT INTO Pages VALUES(1,'Memes','This is a page for all memes');
INSERT INTO Pages VALUES(2,'Tech','This is a page for all tech related stuff');

--INSERT INTO POSTS
INSERT INTO Posts VALUES(1,current_timestamp,'This is a random post by me',3);
INSERT INTO Posts VALUES(2,current_timestamp,'hello world',2);
INSERT INTO Posts VALUES(3,current_timestamp,'squid games fan art',3);

--INSERT INTO POST LIKES
INSERT INTO PostLikes VALUES(3,3,10);
INSERT INTO PostLikes VALUES(2,2,4);
INSERT INTO PostLikes VALUES(1,3);

--INSERT INTO PHOTOS (please make sure you have these files in your current directory)
INSERT INTO Photos VALUES(1,bytea('./test1.png'),2);
INSERT INTO Photos VALUES(2,bytea('./test2.svg'),1);

--INSERT INTO SHARE
INSERT INTO Shares VALUES (1,2,current_timestamp);
INSERT INTO Shares VALUES (3,2,current_timestamp);


--INSERT INTO COMMENTS
INSERT INTO COMMENTS VALUES(1,2,1,'This is a test comment',current_timestamp);
INSERT INTO COMMENTS VALUES(2,2,3,'great content',current_timestamp);
INSERT INTO COMMENTS VALUES(3,1,3,'awesome content',current_timestamp);