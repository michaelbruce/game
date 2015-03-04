import Tkinter as tk
#import Tktable
#from tkintertable.Tables import TableCanvas
#from tkintertable.TableModels import TableModel
from simple_salesforce import Salesforce
sf = Salesforce(username='mike@singletrack.com', password='U69gZ5RvoG32', security_token='6NJN9S7fVDPIDiV834P8oTJP')

class Application(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, bg='white')
        self.pack()
        self.createWidgets()
        #self.createTable()
        #self.createList()
        #self.createGrid()
        #tk.Tk.__init__(self)
        t = SimpleTable(self, 10,2)
        t.pack(side="top", fill="x")
        t.set(0,0,"Hello, world")

    def createWidgets(self):
        self.hi_there = tk.Button(self)
        self.hi_there["text"] = "Hello World"
        self.hi_there["command"] = self.say_hi
        self.hi_there.pack(side="top")

        self.query_area = tk.Text(self, width=40 ,height=10, bg='white')
        self.query_area.pack(side="top")

        self.QUIT = tk.Button(self, text="QUIT", fg="red",
                                            command=root.destroy)
        self.QUIT.pack(side="bottom")

    def createList(self):
        li = 'Carl Andy Mark Jenny Richard Paul'.split()
        self.hi_list = tk.Listbox(self)
        for item in li:
            self.hi_list.insert(0, item)
        self.hi_list.pack()

    def say_hi(self):
        print("hi there, everyone!")
        out = sf.query("SELECT Id, Email FROM User")
        print(out)



class SimpleTable(tk.Frame):
    def __init__(self, parent, rows=10, columns=2):
        # use black background so it "peeks through" to 
        # form grid lines
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
#root.configure(bg='gray') <-- doesn't seem to have any effect...
app = Application(master=root)
app.mainloop()
