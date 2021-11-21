\c socialmedia
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