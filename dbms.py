import tkinter as tk
from tkinter import ttk
import customtkinter as ct
import mysql.connector
from tkinter import messagebox
from customtkinter import CTkFrame, CTkLabel, CTkEntry, CTkButton
from PIL import Image, ImageTk

# Create a custom style using customtkinter
custom_style = {
    "background": "#f0f0f0",
    "font": ("Arial", 12),
    "label": {"font": ("Arial", 12, "bold")},
    "entry": {"padding": (10, 0), "border": 1, "border_color": "#ccc", "border_radius": 3},
    "button": {"background": "#333", "color": "#fff", "padding": (10, 0), "border": 0, "border_radius": 3},
}

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="project1"
)

class App:
    def __init__(self):
        self.root = tk.Tk() 
        self.root.title("ER Model GUI")
        self.root.geometry("1920x1080")  # Set your desired window size

        # Create a canvas widget
        self.canvas = tk.Canvas(self.root, bg='white')  # Set a white background color

        # Create a stylish colored rectangle on the canvas
        self.canvas.create_rectangle(100, 100, 300, 300, fill="lightblue", outline="blue", width=2)

        # Set the scroll region of the canvas widget (if needed)
        self.canvas.config(scrollregion=self.canvas.bbox("all"))

        # Pack the canvas widget in the window
        self.canvas.pack(fill="both", expand=True)

    def run(self):
        # Start the mainloop
        self.root.mainloop()

class InsertWindow(tk.Tk):
    def __init__(self, selected_table):
        super().__init__()

        self.title(f"Insert Data into {selected_table}")

        # Create the connection to the database
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='project1'
        )
        cursor = conn.cursor()

        # Query the database to get the attributes of the selected table
        cursor.execute(f"DESCRIBE {selected_table}")
        table_columns = [row[0] for row in cursor.fetchall()]

        # Create a dictionary to store entry widgets
        self.entry_widgets = {}

        # Create labels and entry widgets dynamically based on table columns
        for i, column in enumerate(table_columns):
            label = ttk.Label(self, text=column)
            label.grid(row=i, column=0)
            
            entry = ttk.Entry(self)
            entry.grid(row=i, column=1)
            
            self.entry_widgets[column] = entry  # Store entry widget in the dictionary

        insert_button = ttk.Button(self, text='Insert', command=self.insert_data)
        insert_button.grid(row=len(table_columns), column=0, columnspan=2)
        self.selected_table = selected_table

    def insert_data(self):
        # Get the attribute values from the entry widgets
        attribute_values = {column: entry.get() for column, entry in self.entry_widgets.items()}
        
        # Create the SQL INSERT statement dynamically
        
        columns = ", ".join(attribute_values.keys())
        values = ", ".join(["%s"] * len(attribute_values))
        sql = f'INSERT INTO {self.selected_table} ({columns}) VALUES ({values})'

        # Execute the SQL INSERT statement
        conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='project1'
        )
        cursor = conn.cursor()
        cursor.execute(sql, list(attribute_values.values()))

        # Commit the changes to the database
        conn.commit()

        # Clear the entry widgets
        for entry in self.entry_widgets.values():
            entry.delete(0, tk.END)

        # Display a message to the user
        tk.messagebox.showinfo('Success', 'Data has been inserted into the table.')



class UpdateWindow(tk.Tk):
    def __init__(self, selected_table):
        super().__init__()

        def get_primary_keys(table_name):
            # Connect to the database
            connection = mysql.connector.connect(host='localhost', user='root', password='root', database='project1')
            cursor = connection.cursor()

            # Get the primary key column names for the given table
            cursor.execute("SHOW KEYS FROM {} WHERE Key_name = 'PRIMARY'".format(table_name))
            primary_keys = cursor.fetchall()

            # Convert the primary key column names to a list
            primary_keys = [primary_key[4] for primary_key in primary_keys]

            # Close the cursor and connection
            cursor.close()
            connection.close()

            # Return the list of primary key columns
            return primary_keys

        self.primary_key_columns = get_primary_keys(selected_table)

        self.title(f"Update Data of {selected_table}")

        # Create the connection to the database
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='project1'
        )
        self.cursor = self.conn.cursor()

        # Query the database to get the attributes of the selected table
        self.cursor.execute(f"DESCRIBE {selected_table}")
        table_columns = [row[0] for row in self.cursor.fetchall()]

        # Create a dictionary to store entry widgets
        self.entry_widgets = {}

        # Create labels and entry widgets dynamically based on table columns
        for i, column in enumerate(table_columns):
            label = ttk.Label(self, text=column)
            label.grid(row=i, column=0)
            
            entry = ttk.Entry(self)
            entry.grid(row=i, column=1)
            
            self.entry_widgets[column] = entry  # Store entry widget in the dictionary

        update_button = ttk.Button(self, text='Update', command=self.update_data)
        update_button.grid(row=len(table_columns), column=0, columnspan=2)
        self.selected_table = selected_table

    def update_data(self):
        # Get the attribute values from the entry widgets
        attribute_values = {column: entry.get() for column, entry in self.entry_widgets.items()}

        # Verify if the entered primary key values match the primary key columns
        if not all(attribute_values.get(key) for key in self.primary_key_columns):
            messagebox.showerror('Error', 'Please enter values for all primary key columns.')
            return

        # Construct the WHERE clause based on primary key columns
        where_conditions = " AND ".join([f"{column} = %s" for column in self.primary_key_columns])

        # Execute the SQL UPDATE statement
        sql = f'UPDATE {self.selected_table} SET {", ".join([f"{column} = %s" for column in attribute_values.keys()])} WHERE {where_conditions}'

        # Fetch the primary key values from the entry widgets and execute the update
        primary_key_values = [attribute_values[column] for column in self.primary_key_columns]
        update_values = list(attribute_values.values()) + primary_key_values

        self.cursor.execute(sql, update_values)
        self.conn.commit()
        messagebox.showinfo('Success', 'Data has been updated in the table.')

        # Clear the entry widgets
        for entry in self.entry_widgets.values():
            entry.delete(0, tk.END)

class DeleteWindow(tk.Tk):
    def __init__(self, selected_table):
        super().__init__()

        def get_primary_keys(table_name):
            # Connect to the database
            connection = mysql.connector.connect(host='localhost', user='root', password='root', database='project1')
            cursor = connection.cursor()

            # Get the primary key column names for the given table
            cursor.execute("SHOW KEYS FROM {} WHERE Key_name = 'PRIMARY'".format(table_name))
            primary_keys = cursor.fetchall()

            # Convert the primary key column names to a list
            primary_keys = [primary_key[4] for primary_key in primary_keys]

            # Close the cursor and connection
            cursor.close()
            connection.close()

            # Return the list of primary key columns
            return primary_keys

        self.primary_key_columns = get_primary_keys(selected_table)
        self.entry_widgets = {}  # Create a dictionary to store entry widgets

        self.title(f"Delete Data from {selected_table}")

        # Create the connection to the database
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='project1'
        )
        self.cursor = self.conn.cursor()

        # Create labels and entry widgets for primary key columns
        for i, column in enumerate(self.primary_key_columns):
            label = ttk.Label(self, text=column)
            label.grid(row=i, column=0)
            
            entry = ttk.Entry(self)
            entry.grid(row=i, column=1)
            self.entry_widgets[column] = entry  # Store entry widget in the dictionary

        delete_button = ttk.Button(self, text='Delete', command=self.delete_data)
        delete_button.grid(row=len(self.primary_key_columns), column=0, columnspan=2)
        self.selected_table = selected_table

    def delete_data(self):
        # Get the attribute values from the entry widgets
        primary_key_values = [entry.get() for entry in self.entry_widgets.values()]

        # Verify if the user has entered values for all primary key columns
        if not all(primary_key_values):
            messagebox.showerror('Error', 'Please enter values for all primary key columns.')
            return

        # Construct the WHERE clause based on primary key columns
        where_conditions = " AND ".join([f"{column} = %s" for column in self.primary_key_columns])

        # Execute the SQL DELETE statement
        sql = f'DELETE FROM {self.selected_table} WHERE {where_conditions}'

        self.cursor.execute(sql, primary_key_values)
        self.conn.commit()
        messagebox.showinfo('Success', 'Data has been deleted from the table.')

        # Clear the entry widgets
        for entry in self.entry_widgets.values():
            entry.delete(0, tk.END)




class LoginScreen(ct.CTkFrame):
    def __init__(self, master):
        super().__init__(master)

        # Load and display the background image
        background_image = Image.open(r"C:\Users\TANMAY JAIN\Downloads\dbms_background.jpg")  # Replace "background.jpg" with your image file path
        background_photo = ImageTk.PhotoImage(background_image)
        background_label = ct.CTkLabel(self, image=background_photo)
        background_label.image = background_photo  # Keep a reference to the image to prevent it from being garbage collected
        background_label.pack(fill="both", expand=True,padx=10, pady=10)

        # Place the login box widgets over the background image
        self.username_label = ct.CTkLabel(self, text="USERNAME:")
        self.username_entry = ct.CTkEntry(self)
        self.username_label.place(x=720, y=300)
        self.username_entry.place(x=720, y=320)

        self.password_label = ct.CTkLabel(self, text="PASSWORD:")
        self.password_entry = ct.CTkEntry(self, show="*")
        self.password_label.place(x=720, y=350)
        self.password_entry.place(x=720, y=370)

        self.login_button = ct.CTkButton(self, text="Login", command=self.login)
        self.login_button.place(x=720, y=400)

        # Center the frame in the master
        self.pack(expand=True,padx=10, pady=10)

    def login(self):
        username = self.username_entry.get()
        password = self.password_entry.get()

        if username == "admin" and password == "admin":
            self.destroy()
            AdminScreen(self.master)
        else:
            tk.messagebox.showerror("Login failed", "Incorrect username or password.")

class AdminScreen(ct.CTkFrame):
    def __init__(self, master):
        super().__init__(master)

        self.operation_dropdown = ttk.Combobox(self, values=["View", "Insert", "Update", "Delete"])
        self.operation_dropdown.current(0)

        self.table_dropdown = ttk.Combobox(self, values=["Airline",'Airport','Connecting','Contains','Employee','Flight','NonStop','Passenger','Payment','Serves','Ticket'])
        self.table_dropdown.current(0)

        self.execute_button = ct.CTkButton(self, text="Execute", command=self.execute)

        # Use the place method to center the content
        self.operation_dropdown.place(relx=0.5, rely=0.2, anchor="center")
        self.table_dropdown.place(relx=0.5, rely=0.4, anchor="center")
        self.execute_button.place(relx=0.5, rely=0.7, anchor="center")

        self.pack(expand=True, padx=10, pady=10)

    def execute(self):
        operation = self.operation_dropdown.get()
        table = self.table_dropdown.get()

        # Connect to the database
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root",
            database="project1"
        )
        cur = conn.cursor()

        # Execute the SQL statement
        if operation == "View":
            cur.execute(f"SELECT * FROM {table}")
        elif operation == "Insert":
            insert_page = InsertWindow(table)  # Create an instance of InsertWindow
            insert_page.mainloop()  # Display the InsertWindow
            # TODO: Implement insert code
            pass
        elif operation == "Update":
            update_page = UpdateWindow(table)
            update_page.mainloop()
            # TODO: Implement update code
            pass
        elif operation == "Delete":
            delete_page = DeleteWindow(table)
            delete_page.mainloop()
            # TODO: Implement delete code
            pass

        # Fetch the results
        results = cur.fetchall()

        # Close the database connection
        conn.close()

        self.display_results(results, table)

    def display_results(self, results, table_name):
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='project1'
        )

        cursor = connection.cursor()
        cursor.execute('SHOW COLUMNS FROM {}'.format(table_name))
        columns = [column[0] for column in cursor.fetchall()]
        cursor.close()
        connection.close()

        new_window = tk.Toplevel(self)
        new_window.title("Results")
        new_window.geometry("1920x1080")

        table = ttk.Treeview(new_window, columns=columns)
        table.grid(row=0, column=0)

        for column in columns:
            table.heading(column, text=column)  # Set the column headings

        for row in results:
            table.insert('', 'end', values=row)
        table.pack(fill="both", expand=True, padx=10, pady=10)

        new_window.mainloop()



if __name__=='__main__':
    root = ct.CTk()
    root.title("ER Model GUI")
    root.geometry("1920x1080")
    App    

    login_screen = LoginScreen(root)
    login_screen.pack()

    root.mainloop()