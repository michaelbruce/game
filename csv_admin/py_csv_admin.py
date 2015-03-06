import Tkinter as tk
import csv

class CsvAdmin(tk.Frame):
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, bg='white')
        self.grid(row=0, column=0, sticky="NSEW")
        self.grid_rowconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        self.grid_columnconfigure(0, weight=1)
        self.query_area = tk.Text(self, width=80 ,height=1, bg='white')
        self.query_area.insert('1.0', 'select Email, Name, Username from User')
        self.query_area.grid(in_=self, row=0, column=0, columnspan=2, sticky="NSEW")
        #results_area = tk.Listbox(self, bg='white', fg='black')
        self.results_area_list = []
        self.results_area = tk.Listbox(self, bg='white', fg='black')
        self.results_area.grid(in_=self, row=1, column=0, sticky="NSEW")
        self.results_area_list.append(self.results_area)
        self.results_area_2 = tk.Listbox(self, bg='white', fg='black')
        self.results_area_2.grid(in_=self, row=1, column=1, sticky="NSEW")
        self.results_area_list.append(self.results_area_2)

        with open('sample.csv', 'rb') as csvfile:
            csv_file = csv.reader(csvfile, delimiter=',', quotechar='|')
            for row in csv_file:
                for index, field in enumerate(row):
                    if len(self.results_area_list) > index:
                        self.results_area_list[index].insert(index, field)
                    else:
                        new_results_area = tk.Listbox(self, bg='white', fg='black')
                        #new_results_area.grid(in_=self, row=2, column=1, sticky="NSEW")
                        self.results_area_list.append(new_results_area)
                        self.results_area_list[index].insert(index, field)



        # print(csv_file)
        # for index, item in enumerate(csv_file.get(0)):
        #     fields = item.keys()
        #     fields.remove("attributes")
        #     for field in fields:
        #         print('column: ' + item)#self.results_area.insert(index, item[field])

        #for item in query["records"]:
        #    fields = item.keys()
        #    fields.remove("attributes")
        #    for index, field in enumerate(fields):
        #        if len(self.results_area_list) > index:
        #            self.results_area_list[index].insert(index, item[field])
        #        else:
        #            new_results_area = tk.Listbox(self, bg='white', fg='black')
        #            #new_results_area.grid(in_=self, row=2, column=1, sticky="NSEW")
        #            self.results_area_list.append(new_results_area)
        #            self.results_area_list[index].insert(index, item[field])

        #for index, data_column in enumerate(self.results_area_list):
        #    data_column.grid(in_=self, row=2, column=index, sticky="NSEW")

        #self.query_area.grid(in_=self, row=0, column=0, columnspan=len(self.results_area_list), sticky="NSEW")
        #self.query_button.grid(in_=self, row=1, column=0, columnspan=len(self.results_area_list), stick="NS")
        ##TODO remove after len

        #self.grid(row=0, column=0, sticky="NSEW")
        #self.grid_rowconfigure(0, weight=1)
        #self.grid_rowconfigure(1, weight=1)
        #self.grid_columnconfigure(0, weight=1)
        #self.grid_columnconfigure(1, weight=1)
        #self.createQueryInputUI()
        #self.createList()


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

root = tk.Tk()
app = CsvAdmin(master=root)
app.mainloop()
