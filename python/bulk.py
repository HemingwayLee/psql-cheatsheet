import traceback
import psycopg2
from psycopg2.extras import execute_values
from psycopg2 import sql

try:
    conn = psycopg2.connect("dbname='test' host='127.0.0.1'")
except:
    print("I am unable to connect to the database")

cur = conn.cursor()
try:
    arr = [("James", 26), ("Kristof", 25)]
    execute_values(cur, "INSERT INTO aaa (name, age) VALUES %s", arr)
    conn.commit()

    tablename = "aaa"
    queryText = "INSERT INTO {table} (name, age) VALUES %s"
    query = sql.SQL(queryText).format(table=sql.Identifier(tablename))
    execute_values(cur, query.as_string(cur), arr)
    conn.commit()
  
except:
    print(traceback.format_exc())

