## Create a ABAP function module in ADT ( TCODE SE37 ) 

All of the function modules in a function group can access the global data of the group. For this reason, you should place all function modules that use the same data in a single function group. 
For example, if you have a set of function modules that all use the same internal table, you could place them in a function group containing the table definition in its global data.

### Pre requisites : 

- ABAP function group ( ex ZI316810_func_grp ) should already be created .
 https://github.com/sayantan1989/ABAP_Intro/blob/main/create_func_group.md

### References : 
https://help.sap.com/docs/SAP_NETWEAVER_702/fe24b0146c551014891ad42d6b2789e5/9fdb988735c111d1829f0000e829fbfe.html

### Steps :

1. Create a new object ( function module ) and select a function group.
   
![image](https://github.com/user-attachments/assets/fd05e9f8-9667-4ddb-92ac-cf2d7f8e5893)

![image](https://github.com/user-attachments/assets/f07239b6-77e6-497e-9530-675d9be4082b)

