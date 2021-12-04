import psycopg2
import base64
from io import BytesIO

# connect to the database
conn = psycopg2.connect(
user = "abhi",
password = "12345",
host = "localhost",
port = "5432",
database = "socialmedia"
)

with open("./test1.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

cur = conn.cursor()

cur.execute(f"INSERT INTO PHOTOS VALUES(1,bytea('{encoded_string.decode('ascii')}'),1,current_timestamp);")
conn.commit()
cur.close()

conn.close()