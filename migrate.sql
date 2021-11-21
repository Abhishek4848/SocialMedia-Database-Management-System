COPY (SELECT
userid AS "userID",
uname AS "uname",
email AS "email",
pwd AS "password"
FROM userauth )
TO 'D:/Abhi/PES/Sem 5/DBMS/SocialMedia-Database-Management-System/Files/userauth.tsv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER E',');

COPY (SELECT
userid AS "userID",
fname AS "fname",
fname AS "lname",
school AS "school",
username AS "username",
email AS "email",
location AS "location",
phone AS "Mobile No.",
dob AS "dob",
friends AS "Friends",
gender AS "Sex"
FROM user_detail )
TO 'D:/Abhi/PES/Sem 5/DBMS/SocialMedia-Database-Management-System/Files/userDetails.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER E',');