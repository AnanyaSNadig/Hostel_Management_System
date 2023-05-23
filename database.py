
import mysql.connector
import streamlit as st 
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    database="hostelManagement"
)
c = mydb.cursor()

def retrieve_tables():
    c.execute("SHOW TABLES")
    data = c.fetchall()
    return data

def show(table):
    c.execute("SELECT * FROM {}".format(table))
    data = c.fetchall()
    return data

def selected_columns(table):
    c.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{}' ORDER BY ORDINAL_POSITION".format(table))
    data = c.fetchall()
    data = [i[0] for i in data]
    print(data)
    return data

def add_data(inp,table):
    inp = [int(i) if i.isdigit() == True else i for i in inp]
    inp = tuple(inp)
    c.execute("INSERT INTO {} VALUES{}".format(table,inp));
    mydb.commit()

def view_all_data(table):
    c.execute("SELECT * FROM {}".format(table))
    data = c.fetchall()
    return data
def delete_data(table,values):
    s = "DELETE FROM {} WHERE ".format(table)
    col = selected_columns(table)
    for i in range(len(col)):
        if(values[i]!=""):
            if type(values[i]) == int:
                s += "{} = {} and ".format(col[i],values[i])
            else:
                s += "{} = '{}' and ".format(col[i],values[i])
    s = s[:-5]
    c.execute(s)
    mydb.commit()

def update_tables(table,entry,new_entry):
    s = "UPDATE {} SET ".format(table)
    col = selected_columns(table)
    for i in range(len(col)):
        if(new_entry[i]!=""):
            if type(new_entry[i]) == int or str(new_entry[i]).isdigit() == True:
                s += "{} = {}, ".format(col[i],new_entry[i])
            else:
                s += "{} = '{}', ".format(col[i],new_entry[i])
    s = s[:-2]
    s+= " WHERE "
    for i in range(len(col)):
        if(entry[i]!="" and str(entry[i]) != "None"):
            if type(entry[i]) == int or str(entry[i]).isdigit() == True:
                s += "{} = {} and ".format(col[i],entry[i])
            else:
                s += "{} = '{}' and ".format(col[i],entry[i])
    s = s[:-5]
    try:

        c.execute(s)
        mydb.commit()
        return "Worked"
    except:
        return "Error"
        
def fetch_students():
    c.execute("select srn from student")
    data = c.fetchall()
    return data