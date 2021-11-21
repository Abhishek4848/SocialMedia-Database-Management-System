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
            print("2. Display those pages which have content as ‘memes’ in it.\n")
            print("3. Display the user name and the post posted by them.\n")
            print("4. Choosing comments created after a particular date.\n")
            print("5. Count number of male and female users in the social media database")

            sq_choice = int(input("\nEnter your choice: "))
            if sq_choice >= 1 and sq_choice <= 5:
                simple_queries(sq_choice)
            
            print("\n")
        
        elif choice == 2:
            print("complex queries")
        
        elif choice == 3:
            print("Retrieve images")
        
        elif choice == 4:
            print("Migrating database")

        elif choice == 5:
            exit(0)
        
        else: 
            print("Chose a valid option")

def simple_queries(sq_choice):

    simple_q ={
        1:"select userid , count(postcontent) from posts group by userid;",
        2:"select * from pages where pagecontent like '%meme%';",
        3:"SELECT u.username,p.postcontent FROM user_detail AS u, posts AS p WHERE u.userid = p.userid;",
        4:"select commentid,commentcontent from comments where commentdate >= '2021-10-13';",
        5:"SELECT COUNT(case when gender='male' then 1 end) AS MALES, COUNT(case when gender='female' then 1 end) AS FEMALES FROM user_detail;"
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