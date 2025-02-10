
" This is a demo class with no method or param, we are just inheriting and redefining method main for testing purpose
" call any class , function in main and out->write the result to see it in console.

CLASS ZCL_demo_run DEFINITION INHERITING FROM cl_demo_classrun
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS: main REDEFINITION.

    " declare testing methods
    METHODS : test1.
    METHODS : test2.
    METHODS : test_zcl_singltn.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_demo_run IMPLEMENTATION.

  METHOD main.
    out->write( | --- Hello  World , Main 1 --- | ).


    " use this method to test any class , function for testing
    test1( ).
    test2( ).
    test_zcl_singltn(  ).
  ENDMETHOD.


  METHOD test1.
    out->write( | --- Hello  World --- test 2 | ).

    DATA r1 TYPE i VALUE 0.
    DATA r2 TYPE i VALUE 0.
    DATA s TYPE abap_bool.

    r2 = zcl_sum=>add(
      EXPORTING
        param1  = 1
        param2  = 2
*    param3  =.
      IMPORTING
        result  = r1
        success = s
           ).

    out->write( r1 ).
  ENDMETHOD.


  METHOD test2.

    DATA r1 TYPE abap_bool.

    CALL FUNCTION 'ZFUNC_SUM_V1'
      EXPORTING
        param1  = 1
      IMPORTING
        success = r1.

    out->write( r1 ).
  ENDMETHOD.


  METHOD test_zcl_singltn.

    DATA lv_ref TYPE REF TO zcl_singltn.
    DATA lv_ref2 TYPE REF TO zcl_singltn.
    "this is not allowed as instance creation in private in properties
*CREATE OBJECT lv_ref.

    lv_ref = zcl_singltn=>get_instance( ). "only way you get an instance is via the static method
    lv_ref2 = zcl_singltn=>get_instance( ). "you will get the same inatance


*"this is not true for non singletom class : EX
*DATA lv_shape_rf1 TYPE REF TO zcl_factory_shape.
*DATA lv_shape_rf2 TYPE REF TO zcl_factory_shape.
*CREATE OBJECT lv_shape_rf1 .
*CREATE OBJECT lv_shape_rf2.


    lv_ref->set_value( iv_value = '100' ).

    DATA(l1) = lv_ref->get_value( ).
    DATA(l2) = lv_ref2->get_value( ).

    out->write( l1 ).
    out->write( l2 ).

  ENDMETHOD.

ENDCLASS.
