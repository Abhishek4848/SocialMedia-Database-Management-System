\c socialmedia

--INSERT INTO USER DETAILS
INSERT INTO User_Detail VALUES (1,'John','Doe','Brooks valley','jd101','johndoe@test.com','4 square block',995544,'2001-01-01',NULL,'male');
INSERT INTO User_Detail VALUES (2,'Jane','Bosco','Brian convent','jan101','jbosco@test.com','8 square block',887766,'2000-07-01',ARRAY ['1','3'],'female');

UPDATE user_detail SET friends = array_append(friends,'2') WHERE fname='John';

INSERT INTO User_Detail VALUES (3,'Mike','Tyson','lulwa convent','themike','tyson@test.com','3 dark avenue',445533,'2002-07-01',ARRAY ['2'],'male');
INSERT INTO User_Detail VALUES (4,'Jett','sage','public convent','jet101','jet12@test.com','5 dark alley',118822,'2000-05-01', NULL,'female');
INSERT INTO User_Detail VALUES (5,'Sova','archer','private convent','sov101','sova@test.com','10 square block',997766,'2002-07-01',NULL,'male');
INSERT INTO User_Detail VALUES (6,'Thor','odinson','asgard public','thor101','thor@test.com','12 square block',776611,'2001-04-04',NULL,'male');
INSERT INTO User_Detail VALUES (7,'Loki','brian','asgard public','loki101','loki@test.com','11 diamond block',887755,'2002-07-08',NULL,'male');
INSERT INTO User_Detail VALUES (8,'James','bond','spy public','jb101','bond@test.com','11 secret block',991133,'2001-07-07',NULL,'male');


--INSERT INTO USER AUTH
INSERT INTO UserAuth VALUES(1,'jd101','johndoe@test.com','johnd12!@');
INSERT INTO UserAuth VALUES(2,'jan101','jbosco@test.com','jand12!@');
INSERT INTO UserAuth VALUES(3,'themike','tyson@test.com','mikey12!@');
INSERT INTO UserAuth VALUES(4,'jet101','jet12@test.com','jet12!@');
INSERT INTO UserAuth VALUES(5,'sov101','sova@test.com','sova12!@');
INSERT INTO UserAuth VALUES(6,'thor101','thor@test.com','thor12!@');
INSERT INTO UserAuth VALUES(7,'loki101','loki@test.com','loki12!@');
INSERT INTO UserAuth VALUES(8,'jb101','bond@test.com','bond12!@');



--INSERT INTO PAGES
INSERT INTO Pages VALUES(1,'Memes','This is a page for all memes');
INSERT INTO Pages VALUES(2,'Tech','This is a page for all tech related stuff');
INSERT INTO Pages VALUES(3,'news','This is a page for all lates news');
INSERT INTO Pages VALUES(4,'Iphone','This is a page for all apple iphone related stuff');
INSERT INTO Pages VALUES(5,'Covid','This is a page for all covid related stuff');
INSERT INTO Pages VALUES(6,'Fashion','This is a page for all fashion related stuff');
INSERT INTO Pages VALUES(7,'coding','This is a page for all coding related stuff');
INSERT INTO Pages VALUES(8,'Climate','This is a page for all climate change related stuff');


--INSERT INTO POSTS
INSERT INTO Posts VALUES(1,current_timestamp,'This is a random post by me',3);
INSERT INTO Posts VALUES(2,current_timestamp,'hello world',2);
INSERT INTO Posts VALUES(3,current_timestamp,'Me at the Zoo',4);
INSERT INTO Posts VALUES(4,current_timestamp,'Money Heist',1);
INSERT INTO Posts VALUES(5,current_timestamp,'Motivational Video',7);
INSERT INTO Posts VALUES(6,current_timestamp,'MBA at PESU',7);
INSERT INTO Posts VALUES(7,current_timestamp,'Oppo M16 PRO',5);
INSERT INTO Posts VALUES(8,current_timestamp,'Beach vibes',6);
INSERT INTO Posts VALUES(9,current_timestamp,'Meme',3);

--INSERT INTO POST LIKES
INSERT INTO PostLikes VALUES(3,3,10);
INSERT INTO PostLikes VALUES(2,2,4);
INSERT INTO PostLikes VALUES(1,3);
INSERT INTO PostLikes VALUES(9,5,100);
INSERT INTO PostLikes VALUES(8,2,1);
INSERT INTO PostLikes VALUES(7,1,113);
INSERT INTO PostLikes VALUES(7,2,4);
INSERT INTO PostLikes VALUES(7,4,10);
INSERT INTO PostLikes VALUES(5,8,12);
INSERT INTO PostLikes VALUES(4,7,2);
INSERT INTO PostLikes VALUES(4,6,0);

--INSERT INTO PHOTOS (please make sure you have these files in your current directory)
INSERT INTO Photos VALUES(1,bytea('../images/test1.png'),2,current_timestamp);
INSERT INTO Photos VALUES(2,bytea('../images/test2.png'),1,current_timestamp);
INSERT INTO Photos VALUES(3,bytea('../images/test3.png'),8,current_timestamp);
INSERT INTO Photos VALUES(4,bytea('../images/test4.png'),7,current_timestamp);
INSERT INTO Photos VALUES(5,bytea('../images/test5.png'),6,current_timestamp);
INSERT INTO Photos VALUES(6,bytea('../images/test6.png'),6,current_timestamp);
INSERT INTO Photos VALUES(7,bytea('../images/test7.png'),5,current_timestamp);
INSERT INTO Photos VALUES(8,bytea('../images/test8.png'),3,current_timestamp);


--INSERT INTO SHARE
INSERT INTO Shares VALUES (1,8,current_timestamp);
INSERT INTO Shares VALUES (3,7,current_timestamp);
INSERT INTO Shares VALUES (4,5,current_timestamp);
INSERT INTO Shares VALUES (7,5,current_timestamp);
INSERT INTO Shares VALUES (6,1,current_timestamp);
INSERT INTO Shares VALUES (8,8,current_timestamp);
INSERT INTO Shares VALUES (8,4,current_timestamp);
INSERT INTO Shares VALUES (3,2,current_timestamp);
INSERT INTO Shares VALUES (5,2,current_timestamp);


--INSERT INTO COMMENTS
INSERT INTO COMMENTS VALUES(1,2,1,'This is a test comment',current_timestamp);
INSERT INTO COMMENTS VALUES(2,2,3,'great content',current_timestamp);
INSERT INTO COMMENTS VALUES(3,8,7,'awesome content',current_timestamp);
INSERT INTO COMMENTS VALUES(4,7,1,'GG',current_timestamp);
INSERT INTO COMMENTS VALUES(5,6,3,'LoL',current_timestamp);
INSERT INTO COMMENTS VALUES(6,4,6,'Great work',current_timestamp);
INSERT INTO COMMENTS VALUES(7,7,1,'Well done',current_timestamp);
INSERT INTO COMMENTS VALUES(8,5,8,'great content',current_timestamp);
INSERT INTO COMMENTS VALUES(9,5,4,'All the Best',current_timestamp);
