import psycopg2

try:
    conn = psycopg2.connect("dbname='perf' host='127.0.0.1'")
except:
    print("I am unable to connect to the database")

cur = conn.cursor()
try:
    table_name = '"MY_TABLE"'
    cur.execute("insert into %s values (%%s, %%s)" % table_name, [10, 'Kenny'])
    conn.commit()
  
except:
    print("unexpected error")

