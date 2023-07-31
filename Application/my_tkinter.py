import tkinter as tk 
from tkinter import *
from tkinter import ttk
from tkinter import filedialog as fd
from PIL import Image, ImageTk
import tritonclient.http as httpclient
import cv2
import numpy as np
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import (FigureCanvasTkAgg, NavigationToolbar2Tk)
from tkcalendar import DateEntry
from functools import partial
import requests

class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Hello world")
        self.geometry("800x1000")
        self.file_path = ""
        self.mask = []
        self.image_user_path = ""
        self.image = []
        self.id_patient = 0
        self.ListIDDoctor = []
        self.image1 = Image.open("Asset/select_img.png")
        self.image1 = ImageTk.PhotoImage(self.image1)
        self.label1 = Label(image=self.image1, width=256, height=256, bg="#FFFFFF")
        self.label1.image = self.image1
        self.label1.place(x=100, y=10)

        self.image2 = Image.open("Asset/select_img.png")
        self.image2 = ImageTk.PhotoImage(self.image2)
        self.label2 = Label(image=self.image2, width=256, height=256, bg="#FFFFFF")
        self.label2.image = self.image2
        self.label2.place(x=450, y=10)

        image3 = Image.open("Asset/predict.jpg")
        image3 = ImageTk.PhotoImage(image3)
        label3 = Label(image=image3,width=800, height=490, bg="#FFFFFF")
        label3.image = image3
        label3.place(x=0, y=400)


        # self.fig= plt.figure()
        # self.canvas = FigureCanvasTkAgg(self.fig, master=self)
        # self.toolbar = NavigationToolbar2Tk(self.canvas, self)
        # self.toolbar.update()
        # self.canvas.get_tk_widget().place(x=90,y=400)


        button1 = Button(text="Select File", width=10, height=3, bg="#01DBE1") 
        button1.bind("<Button-1>", self.select_file) 
        button1.place(x=350, y=300)

        button2 = Button(text="Scan", width=10, height=3, bg="#01DBE1")  
        button2.bind("<Button-1>", self.post_request) 
        button2.place(x=350, y = 350)

        button3 = Button(text="Save Patient", width=8, height=3, bg="#01DBE1")
        button3.bind("<Button-1>", self.save_data_and_pattien)
        button3.place(x=5,y=5)

        button4 = Button(text="Save Result", width=8, height=3, bg="#01DBE1")
        button4.bind("<Button-1>", self.save_data)
        button4.place(x=5,y=55)

        
    
    def select_file(self, envet):
        self.file_path= fd.askopenfilename()
        self.image1 = Image.open(self.file_path)
        self.image1 = ImageTk.PhotoImage(self.image1)
        self.label1 = Label(image=self.image1, width=256, height=256)
        self.label1.image = self.image1
        self.label1.place(x=100, y=10)

    def image_normalization(self):
        self.image = cv2.imread(self.file_path)
        cv2.imwrite("./static/input.png", self.image)
        self.image = cv2.resize(self.image, (256, 256))
        img = self.image/255
        img = img[np.newaxis, :, :, : ]
        return img.astype(np.float32)

    def post_request(self, event):
        img = self.image_normalization()
        client = httpclient.InferenceServerClient(url="localhost:8000")
        inputs = httpclient.InferInput("input_1", img.shape, datatype="FP32")
        inputs.set_data_from_numpy(img, binary_data=False)

        outputs = httpclient.InferRequestedOutput("conv2d_18", binary_data=False)

        results = client.infer(model_name="unet_tf", inputs=[inputs], outputs=[outputs])
        inference_output = results.as_numpy('conv2d_18')
        self.mask = inference_output[0]
        
        print(inference_output[0].shape)
        image = cv2.cvtColor(inference_output[0], cv2.COLOR_GRAY2BGR) 
        
        self.image2 = Image.fromarray((image*255).astype(np.uint8))
        self.image2.save("./static/output.png")
        self.image2 = ImageTk.PhotoImage(self.image2)
        self.label2 = Label(image=self.image2, width=256, height=256)
        self.label2.image = self.image2
        self.label2.place(x=450, y=10)

        self.vizualize_result()
        # print(image.shape)
        # plt.imshow(image)
        # plt.show()
    def get_doctor(self):
        get = requests.get("http://127.0.0.1:8080/api/list_doctor")
        data = get.json()

        for d in data:
            self.ListIDDoctor.append(d["id"])

        return self.ListIDDoctor
            
    def vizualize_result(self):
            # read image and convert it to RGB scale

        fig= plt.figure()
        image = self.image
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        # read mask
        mask = self.mask
        # sho image and mask
        plt.imshow(image)
        plt.imshow(mask, alpha=0.4)

        plt.tight_layout()
        canvas = FigureCanvasTkAgg(fig, master=self)
        toolbar = NavigationToolbar2Tk(canvas, self, pack_toolbar=False)
        toolbar.update()
        toolbar.place(x=420, y=950)
        canvas.get_tk_widget().place(x=90,y=400)
    
    def save_data_and_pattien(self, event):
        
        def selectFile(evet):
            self.image_user_path= fd.askopenfilename()
            event = Label(tkWindow, text=self.image_user_path).grid(row=2, column=2) 
        
        #window
        tkWindow = Toplevel(self)
        tkWindow.geometry('400x300')  
        tkWindow.title('New Patien')

        #name
        Name = Label(tkWindow, text="Name").grid(row=0, column=0)
        name = StringVar()
        nameEntry = Entry(tkWindow, textvariable=name).grid(row=0, column=1)  

        #doctor ID
        DoctorID = Label(tkWindow,text="Doctor ID").grid(row=1, column=0)  
        DoctorID = IntVar()
        DoctorIDdEntry = Entry(tkWindow, textvariable=DoctorID).grid(row=1, column=1)  

        # validateLogin = partial(validateLogin, name, DoctorID)
    

        #image patient
        path = Label(tkWindow, text=self.image_user_path).grid(row=2, column=2)  
        TextImage = Label(tkWindow,text="Image").grid(row=2, column=0)  
        selectFileImage = partial(selectFile, path)
        SelectFIle = Button(tkWindow, text="Select File", command=selectFileImage).grid(row=2, column=1)  
        
        #DateOfBird
        DateImage1 = Label(tkWindow,text="Date Of Bird").grid(row=3, column=0) 
        text_date1 = StringVar()
        cal1=DateEntry(tkWindow,selectmode='day',date_pattern="yyyy-mm-dd" ,textvariable=text_date1).grid(row=3, column=1) 

        #ExamDate
        DateImage2 = Label(tkWindow,text="Date of Exam").grid(row=4, column=0) 
        text_date2 = StringVar()
        cal2=DateEntry(tkWindow,selectmode='day', textvariable=text_date2, date_pattern="yyyy-mm-dd").grid(row=4, column=1) 


        def submit():

            form_data = {"Name":name.get(), "DoctorID_id":DoctorID.get(),"DateOfBirth":text_date1.get() , "ExamDate":text_date2.get()}
            post = requests.post("http://127.0.0.1:8080/api/add_new_patient_api", data=form_data, files={"images":open(self.image_user_path,"rb")})
            self.id_patient = post.text
            Id_patient =  Label(tkWindow, text="Id Patient: " + str(self.id_patient), bg="green").grid(row=5, column=1)  
            print(self.id_patient)

        submit_btn = Button(tkWindow, text="submit", command=submit).grid(row=5, column=0)  
            
        
        NameOfDisease = Label(tkWindow, text="Name Of Disease").grid(row=6, column=0)  
        text_name_disease = StringVar()
        NameOfDiseaseEntry=Entry(tkWindow,textvariable=text_name_disease).grid(row=6, column=1) 

    
        ResultByDoctor =  Label(tkWindow, text="Result By Doctor").grid(row=8, column=0)  
        text_comment = StringVar()
        result = Entry(tkWindow, textvariable=text_comment).grid(row=9, column=1, sticky=W)

        def submit_01():
            if self.size != 0:
                form_data = {"NameOfDisease": text_name_disease.get(), "PatientID_id": self.id_patient, "DoctorID_id": DoctorID.get(),"ResultByDoctor": text_comment.get()}
                post = requests.post("http://127.0.0.1:8080/api/add_new_comment_api", data=form_data, files={"InputImage":open(
                    "static/input.png", "rb"), "OutputImage":open("static/output.png", "rb")})
                done =  Label(tkWindow, text= post.text, bg="green").grid(row=10, column=1)   
            

        submit01_btn = Button(tkWindow, text="submit", command=submit_01).grid(row=10, column=0)  

    def save_data(self, event):
        get_patient = requests.get("http://127.0.0.1:8080/api/data")
        data = get_patient.json()
        
        patient = []
        for d in data:
            patient.append(d["id"])
            print(d["id"])   

        tkWindow2 = Toplevel(self)
        tkWindow2.geometry('400x150')  
        tkWindow2.title('Result')
  
# label
        Label(tkWindow2, text = "Select id Patient :",
                font = ("Times New Roman", 10)).grid(column = 0,
                row = 5)
        
        # Combobox creation
        n = StringVar()
        monthchoosen = ttk.Combobox(tkWindow2, width = 27, textvariable = n)
        
        # Adding combobox drop down list
        monthchoosen['values'] = patient
        
        monthchoosen.grid(column = 1, row = 5)
        monthchoosen.current()


        Label(tkWindow2, text = "Select id Doctor :",
                font = ("Times New Roman", 10)).grid(column = 0,
                row = 6)
        
        # Combobox creation
        n1 = StringVar()
        monthchoosen2 = ttk.Combobox(tkWindow2, width = 27, textvariable = n1)
        
        # Adding combobox drop down list
        monthchoosen2['values'] = self.get_doctor()
        
        monthchoosen2.grid(column = 1, row = 6)
        monthchoosen2.current()
        # submit_btn = Button(tkWindow2, text="submit", command=submit).grid(row=5, column=0)  
            
        
        NameOfDisease = Label(tkWindow2, text="Name Of Disease").grid(row=8, column=0)  
        text_name_disease = StringVar()
        NameOfDiseaseEntry=Entry(tkWindow2,textvariable=text_name_disease).grid(row=8, column=1) 

    
        ResultByDoctor =  Label(tkWindow2, text="Result By Doctor").grid(row=9, column=0)  
        text_comment = StringVar()
        result = Entry(tkWindow2, textvariable=text_comment).grid(row=9, column=1, sticky=W)

        def submit_0():
            if self.mask.size != 0:
                form_data = {"NameOfDisease": text_name_disease.get(), "PatientID_id": n.get(), "DoctorID_id": n1.get(),"ResultByDoctor": text_comment.get()}
                post = requests.post("http://127.0.0.1:8080/api/add_new_comment_api", data=form_data, files={"InputImage":open(
                    "static/input.png", "rb"), "OutputImage":open("static/output.png", "rb")})
                self.id_patient = post.text
                done =  Label(tkWindow2, text= post.text, bg="green").grid(row=10, column=1) 
                print(self.id_patient)
                

        submit01_btn = Button(tkWindow2, text="submit", command=submit_0).grid(row=10, column=0)  





    
if __name__ == "__main__":
    window = App()
    window.mainloop()