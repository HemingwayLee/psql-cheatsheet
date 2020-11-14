import psycopg2

try:
    conn = psycopg2.connect("dbname='test' host='127.0.0.1'")
except:
    print("I am unable to connect to the database")

cur = conn.cursor()
try:
    cur.execute("""SELECT name, age FROM aaa;""")
    rows = cur.fetchall()
  
    for row in rows:
        print(row[0], ", ", row[1])

    print(rows)
except:
    print("unexpected error")

