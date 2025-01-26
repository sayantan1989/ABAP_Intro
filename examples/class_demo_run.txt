
" This is a demo class with no method or param, we are just inheriting and redefining method main for testing purpose
" call any class , function in main and out->write the result to see it in console.

CLASS ZCL_demo_run DEFINITION INHERITING FROM cl_demo_classrun
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS: main REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_demo_run IMPLEMENTATION.

  METHOD main.
    out->write( | --- Hello  World --- | ).

    " use this method to test any class , function for testing



  ENDMETHOD.

ENDCLASS.
