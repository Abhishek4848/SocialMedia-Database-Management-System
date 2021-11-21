-- transaction for altering table photos
BEGIN;
ALTER TABLE photos ADD COLUMN post_time TIMESTAMP;

COMMIT;
END;

-- Displaying users who have a weak password (password length less than 8)
SELECT u.fname, u.lname FROM user_detail AS u, userauth AS ua WHERE u.userid=ua.userid AND LENGTH(ua.pwd)<8; 


-- selecting the newly created user details after a specific time
select fname,lname,email from user_detail where userid = (select distinct user_id from audit where entry_date >= '2021-11-08');

-- Finding the size of database and size of different relations
SELECT pg_size_pretty( pg_database_size('socialmedia') );
SELECT pg_size_pretty( pg_total_relation_size('user_detail') );
SELECT pg_size_pretty( pg_total_relation_size('photos') );

-- Fiding user detai with location or email
select fname,lname, email from user_detail where location = '8 square block' or username='jan101';