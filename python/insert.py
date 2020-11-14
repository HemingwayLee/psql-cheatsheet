import psycopg2

try:
    conn = psycopg2.connect("dbname='test' host='127.0.0.1'")
except:
    print("I am unable to connect to the database")

cur = conn.cursor()
try:
    table_name = 'aaa'
    cur.execute("insert into %s values (%%s, %%s)" % table_name, ['Kenny', 28])
    conn.commit()
  
except:
    print("unexpected error")

