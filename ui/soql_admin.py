import Tkinter as tk
from simple_salesforce import Salesforce
sf = Salesforce(username='mike@singletrack.com', password='U69gZ5RvoG32', security_token='6NJN9S7fVDPIDiV834P8oTJP')

class SoqlAdmin(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, bg='white')
        self.grid(row=0, column=0, sticky="NSEW")
        self.grid_rowconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)
        self.createQueryInputUI()
        self.createList()

    def createQueryInputUI(self):
        self.query_area = tk.Text(self, width=80 ,height=10, bg='white')
        self.query_area.insert('1.0', 'select Email, Name, Username from User')
        self.query_area.grid(in_=self, row=0, column=0, columnspan=2, sticky="NSEW")
        self.query_button = tk.Button(self, text="Query", fg='black', bg='white')
        self.query_button["command"] = self.print_query
        self.query_button.grid(in_=self, row=1, column=0, columnspan=2, stick="NS")

    def createList(self):
        self.results_area = tk.Listbox(self, bg='white', fg='black')
        self.results_area.grid(in_=self, row=2, column=0, sticky="NSEW")
        self.results_area_2 = tk.Listbox(self, bg='white', fg='black')
        self.results_area_2.grid(in_=self, row=2, column=1, sticky="NSEW")

    def print_query(self):
        query_string = self.query_area.get('1.0', 'end')
        raw_field_array = query_string.split('select')[1].split('from')[0].split(' ')
        field_array = []
        for field in raw_field_array:
            if field != '': field.replace(',','')
        query = sf.query(query_string)
        for index, item in enumerate(query["records"]):
            fields = item.keys()
            fields.remove("attributes")
            for field in fields:
                self.results_area.insert(index, item[field])

        self.results_area.grid(in_=self, row=2, column=0, sticky="NSEW")


class ListBoxTable(tk.Frame):
    def __init__(sefl, parent, rows=10, columns=2):
        tk.Frame.__init__(self, parent, background="black")

class SimpleTable(tk.Frame):
    def __init__(self, parent, rows=10, columns=2):
        # use black background so it "peeks through" to form grid lines
        tk.Frame.__init__(self, parent, background="black")
        self._widgets = []
        for row in range(rows):
            current_row = []
            for column in range(columns):
                label = tk.Label(self, text="%s/%s" % (row, column),
                                borderwidth=0, width=10, bg='white')
                label.grid(row=row, column=column, sticky="nsew", padx=1, pady=1)
                current_row.append(label)
            self._widgets.append(current_row)

        for column in range(columns):
            self.grid_columnconfigure(column, weight=1)

    def set(self, row, column, value):
        widget = self._widgets[row][column]
        widget.configure(text=value)

root = tk.Tk()
app = SoqlAdmin(master=root)
app.mainloop()
