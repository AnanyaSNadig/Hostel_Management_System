import streamlit as st
import mysql.connector

from read import read
from create import create
from delete import delete
from update import update

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
)
c = mydb.cursor()


def main():
    st.title("Hostel Management System")
    menu = ["Add Entries", "View Tables", "Edit Data", "Remove Data"]
    choice = st.sidebar.selectbox("Menu", menu)

    if choice == "View Tables":
        read()
    elif choice == "Add Entries":
        create()
    elif choice == "Remove Data":
        delete()
    elif choice == "Edit Data":
        update()

if __name__ == '__main__':
    main()
