\c socialmedia
--simple queries

--1. grouping the users and total number of posts they made
select userid , count(postcontent) from posts group by userid;

--2. Display those pages which have content as ‘memes’ in it.
select * from pages where pagecontent like '%meme%';

--3. Display the user name and the post posted by them.
SELECT u.username,p.postcontent FROM user_detail AS u, posts AS p WHERE u.userid = p.userid;

--4. Choosing comments created after a particular date.
select commentid,commentcontent from comments where commentdate >= '2021-10-13';

--5. Count number of male and female users in the social media database
SELECT COUNT(case when gender='male' then 1 end) AS MALES, COUNT(case when gender='female' then 1 end) AS FEMALES FROM user_detail;

--complex queries

--1. Display post with maximum number of likes
SELECT pl.postid,postcontent,like_count FROM postlikes AS pl,posts AS p WHERE like_count = (SELECT MAX(like_count) FROM postlikes) AND pl.postid = p.postid;

--2.  Display posts which do not have any comments
SELECT DISTINCT(p.postcontent) FROM posts AS P, comments AS c WHERE p.postid NOT IN (SELECT postid FROM comments);

--3.  Selecting the userid, first name , email and username of those users who have posted a picture
select u.userid,fname,username,email from user_detail as u , (select a.userid from posts as a, photos as d where a.postid = d.postid) as b where u.userid = b.userid;

--4.  Selecting the user details of those users whose posts had the maximum number of shares
select u.userid,fname from user_detail as u ,(select distinct(userid) from shares where share_count = (select MAX(share_count) from shares)) as v where u.userid = v.userid;

--5. Display Social Media users who do not have any friends
SELECT fname,lname FROM user_detail EXCEPT ( SELECT fname,lname FROM user_detail WHERE friends IS NOT NULL); 

-- Functions with cursors
--1. Function which gives a post by post id

create or replace function fetch_posts(pid int)
returns table(
    content TEXT
)
language plpgsql
as
$$
declare
   my_cursor CURSOR FOR SELECT postcontent FROM posts where postid = pid;
begin
	open my_cursor;
	return query fetch from my_cursor;
end;
$$;

select * from fetch_posts(2);

--2. Function which gives all the comments(with the post id) made by a user

create or replace function get_user_comments(uid integer)
   returns text as $$
declare 
	 comments text default '';
	 rec_comm   record;
	 cur_comm cursor(uid integer) 
		 for select commentcontent, postid
		 from comments
		 where userid = uid;
begin
   -- open the cursor
   open cur_comm(uid);
	
   loop

      fetch from cur_comm into rec_comm;

      exit when not found;

      comments := comments || ',' || rec_comm.commentcontent || ':' || rec_comm.postid;
         
   end loop;

   close cur_comm;

   return comments;
end; $$

language plpgsql;

select get_user_comments(2);

-- Triggers

--1. Creating a trigger for auditing a log table whenever a new user is created.

CREATE TABLE AUDIT(
   USER_ID INT NOT NULL,
   ENTRY_DATE TEXT NOT NULL
);

CREATE OR REPLACE FUNCTION auditlogfunc() RETURNS TRIGGER AS $example_table$
   BEGIN
      INSERT INTO AUDIT(USER_ID, ENTRY_DATE) VALUES (new.userid, current_timestamp);
      RETURN NEW;
   END;
$example_table$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS example_trigger ON user_detail;

CREATE TRIGGER example_trigger AFTER INSERT ON user_detail
FOR EACH ROW EXECUTE PROCEDURE auditlogfunc();

DELETE FROM user_detail WHERE userid=4;
INSERT INTO User_Detail VALUES (4,'plague','plag123','private convent','plag101','plag@test.com','11 square block',998766,'2002-07-03',NULL,'male');

SELECT * FROM AUDIT;
--  Adding multiple users to database and granting privileges
CREATE USER abhishekv WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE socialmedia to abhishekv;
REVOKE ALL PRIVILEGES ON DATABASE socialmedia FROM abhishekv;

CREATE USER anush WITH PASSWORD 'anush';
GRANT SELECT,INSERT,DELETE ON user_detail to anush;
REVOKE DELETE ON user_detail FROM anush;

CREATE USER abhishekmishra WITH PASSWORD 'abhim';
GRANT SELECT,TRIGGER,INSERT,UPDATE on userauth TO abhishekmishra;
REVOKE UPDATE on userauth FROM abhishekmishra;

-- PERFORMANCE ANALYSIS OF ALL QUERIES.
-- simple queries

--1. grouping the users and total number of posts they made
EXPLAIN ANALYZE select userid , count(postcontent) from posts group by userid;

--2. Display those pages which have content as ‘memes’ in it.
EXPLAIN ANALYZE select * from pages where pagecontent like '%meme%';

--3. Display the user name and the post posted by them.
EXPLAIN ANALYZE SELECT u.username,p.postcontent FROM user_detail AS u, posts AS p WHERE u.userid = p.userid;

--4. Choosing comments created after a particular date.
EXPLAIN ANALYZE select commentid,commentcontent from comments where commentdate >= '2021-10-13';

--5. Count number of male and female users in the social media database
EXPLAIN ANALYZE SELECT COUNT(case when gender='male' then 1 end) AS MALES, COUNT(case when gender='female' then 1 end) AS FEMALES FROM user_detail;

--complex queries

--1. Display post with maximum number of likes
EXPLAIN ANALYZE SELECT pl.postid,postcontent,like_count FROM postlikes AS pl,posts AS p WHERE like_count = (SELECT MAX(like_count) FROM postlikes) AND pl.postid = p.postid;

--2.  Display posts which do not have any comments
EXPLAIN ANALYZE SELECT DISTINCT(p.postcontent) FROM posts AS P, comments AS c WHERE p.postid NOT IN (SELECT postid FROM comments);

--3.  Selecting the userid, first name , email and username of those users who have posted a picture
EXPLAIN ANALYZE select u.userid,fname,username,email from user_detail as u , (select a.userid from posts as a, photos as d where a.postid = d.postid) as b where u.userid = b.userid;

--4.  Selecting the user details of those users whose posts had the maximum number of shares
EXPLAIN ANALYZE select u.userid,fname from user_detail as u ,(select distinct(userid) from shares where share_count = (select MAX(share_count) from shares)) as v where u.userid = v.userid;

--5. Display Social Media users who do not have any friends
EXPLAIN ANALYZE SELECT fname,lname FROM user_detail EXCEPT ( SELECT fname,lname FROM user_detail WHERE friends IS NOT NULL); 