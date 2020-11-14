import psycopg2
from psycopg2.extras import execute_values

try:
    conn = psycopg2.connect("dbname='test' host='127.0.0.1'")
except:
    print("I am unable to connect to the database")

cur = conn.cursor()
try:
    arr = [("James", 26), ("Kristof", 25)]
    execute_values(cur, "INSERT INTO aaa (name, age) VALUES %s", arr)

    conn.commit()
  
except:
    print("unexpected error")

