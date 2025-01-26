## Create a ABAP class in ADT ( TCODE SE24 ) 

In ABAP (Advanced Business Application Programming), classes are a fundamental part of Object-Oriented Programming (OOP). They are used to encapsulate data and behavior in a structured way, enabling code reuse, modularity, and maintainability.

Key Components of Classes in ABAP

Class Declaration: A class in ABAP is declared using the CLASS statement. It includes the definition of its components, such as attributes, methods, and events.

Class Implementation: The actual implementation of the methods is done in the

### References 

https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/c3/225b5c54f411d194a60000e8353423/content.htm?no_cache=true

### Pre requisites : 

- Software component ( ex ZLOCAL ) .

### Steps :

1. Create a new object ( ABAP class ).

![image](https://github.com/user-attachments/assets/1651da8c-851d-43a8-bb58-df7260b9aafb)

2. Provide name, usually as convention class would prefixed with CL_ or ZCL_.
   
![image](https://github.com/user-attachments/assets/75562ccd-8815-4617-9b4f-314c2651d894)

![image](https://github.com/user-attachments/assets/7b2c4201-6a3e-4284-b214-193057fa736c)

### Run a public method of a class  

In ADT only way to execute a class method directly is by inheriting from cl_demo_classrun and redefine method main to write the result.
Example : https://github.com/sayantan1989/ABAP_Intro/blob/main/examples/class_demo_run.txt 

![image](https://github.com/user-attachments/assets/1712c33f-06f1-4dab-b7e3-4bcc97ad80fc)

### Run in debug mode 

- Double click on a line to set a break point
- Run in debug mode
