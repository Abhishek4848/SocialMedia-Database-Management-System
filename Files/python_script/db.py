import psycopg2
import base64


# menu for query options
def main_menu():
    while(1):
        print("1. Simple queries")
        print("2. Complex queries")
        print("3. Retrieve images")
        print("4. Migrate database to MongoDB")
        print("5. Exit")
        choice = int(input("Enter your option: "))

        if choice == 1:
            print("\n\t\tsimple queries\n")
            print("1. grouping the users and total number of posts they made\n")
            # Posts that have a particular content ex. memes
            print("2. Display those pages which have content as ‘memes’ in it.\n")
            print("3. Display the user name and the post posted by them.\n")
            print("4. Choosing comments created after a particular date.\n")
            print("5. Count number of male and female users in the social media database")
            print("6. Find size of table")

            sq_choice = int(input("\nEnter your choice: "))
            if sq_choice >= 1 and sq_choice <= 6:
                simple_queries(sq_choice)
            
            print("\n")
        
        elif choice == 2:
            print("complex queries")
            print("1. Display post with max no. of likes")
            print("2. Display posts which do not have any comments")
            print("3. Displaying details of users who have posted an image")
            print("4. Display user details whose posts have maximum no. of shares")
            print("5. Display users who do not have any friends")

            sq_choice = int(input("\nEnter your choice: "))
            if sq_choice >= 1 and sq_choice <= 5:
                complex_queries(sq_choice)
            
            print("\n")

        elif choice == 3:
            print("Retrieve images")
        
        elif choice == 4:
            print("Migrating database")

        elif choice == 5:
            exit(0)
        
        else: 
            print("Chose a valid option")

def complex_queries(sq_choice):

    complex_q ={
        1:"SELECT pl.postid,postcontent,like_count FROM postlikes AS pl,posts AS p WHERE like_count = (SELECT MAX(like_count) FROM postlikes) AND pl.postid = p.postid;",
        2:"SELECT DISTINCT(p.postcontent) FROM posts AS P, comments AS c WHERE p.postid NOT IN (SELECT postid FROM comments);",
        3:"select u.userid,fname,username,email from user_detail as u , (select a.userid from posts as a, photos as d where a.postid = d.postid) as b where u.userid = b.userid;",
        4:"select u.userid,fname from user_detail as u ,(select distinct(userid) from shares where share_count = (select MAX(share_count) from shares)) as v where u.userid = v.userid;",
        5:"SELECT fname,lname FROM user_detail EXCEPT ( SELECT fname,lname FROM user_detail WHERE friends IS NOT NULL);"
    }

    # create a cursor
    cur = conn.cursor()

    cur.execute(complex_q[sq_choice])
    column_names = [desc[0] for desc in cur.description]
    rows = cur.fetchall()
    print("\n")
    for r in rows:
        for c in range(len(column_names)):
            print(f"{column_names[c]}: {r[c]}")
        
        print('-----------------')
    
    cur.close()

def simple_queries(sq_choice):
    content = ''
    date = ''
    tablename = ''
    if sq_choice == 2:
        content = input("Enter content type: ")
    if sq_choice == 4:
        date = input("Enter date in 'yyyy-mm-dd' format: ")
    if sq_choice == 6:
        tablename = input("Enter name of table: ")

    simple_q ={
        1:"select userid , count(postcontent) from posts group by userid;",
        2:f"select * from pages where pagecontent like '%{content}%';",
        3:"SELECT u.username,p.postcontent FROM user_detail AS u, posts AS p WHERE u.userid = p.userid;",
        4:f"select commentid,commentcontent from comments where commentdate >= '{date}';",
        5:"SELECT COUNT(case when gender='male' then 1 end) AS MALES, COUNT(case when gender='female' then 1 end) AS FEMALES FROM user_detail;",
        6:f"SELECT pg_size_pretty( pg_total_relation_size('{tablename}') );"
    }

    # create a cursor
    cur = conn.cursor()

    cur.execute(simple_q[sq_choice])
    column_names = [desc[0] for desc in cur.description]
    rows = cur.fetchall()
    print("\n")
    for r in rows:
        for c in range(len(column_names)):
            print(f"{column_names[c]}: {r[c]}")
        
        print('-----------------')
    
    cur.close()

if __name__ == "__main__":
    
    # connect to the database
    conn = psycopg2.connect(
    user = "abhi",
    password = "12345",
    host = "localhost",
    port = "5432",
    database = "socialmedia"
    )

    main_menu()

    # close the connection
    conn.close()