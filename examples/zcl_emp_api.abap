CLASS zcl_emp_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES : ty_emp TYPE TABLE OF zemp.

    CLASS-METHODS get_emp
      IMPORTING
        !id        TYPE char100
      RETURNING
        VALUE(res) TYPE zemp
      RAISING
        cx_number_ranges .

    CLASS-METHODS get_emps
      IMPORTING
        !ids       TYPE  zids
      RETURNING
        VALUE(res) TYPE ZEMP_table
      RAISING
        cx_number_ranges .

    CLASS-METHODS upd_emp
      IMPORTING
        !emp       TYPE  zemp
      RETURNING
        VALUE(res) TYPE boolean
      RAISING
        cx_number_ranges .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_emp_api IMPLEMENTATION.


  METHOD get_emp.
    IF id IS NOT INITIAL.
      SELECT SINGLE *  FROM zemp
          INTO @res
          WHERE id = @id.
    ELSE.
      RAISE EXCEPTION TYPE cx_number_ranges.
    ENDIF.
  ENDMETHOD.





  METHOD get_emps.

    LOOP AT ids INTO DATA(lv_id).
      IF lv_id IS INITIAL OR strlen( lv_id ) < 3.
        RAISE EXCEPTION TYPE cx_number_ranges.
      ENDIF.
    ENDLOOP.

    SELECT *  FROM zemp
        INTO TABLE @res
    FOR ALL ENTRIES IN @ids
        WHERE id = @ids-table_line.
  ENDMETHOD.





  METHOD upd_emp.

    DATA lv_update_db TYPE BOOLEAN value abap_true.
    res = abap_false.

    IF emp-id IS INITIAL
    OR  emp-dep_id IS INITIAL
    OR  emp-is_active IS INITIAL
    OR emp-no_years < 0.
      RAISE EXCEPTION TYPE cx_number_ranges.
    ENDIF.

    SELECT COUNT( * ) FROM zemp WHERE id = emp-id .
    IF sy-subrc EQ 0.

      "if there is some part of code you want to stub / simulate in actual test class warp it into a seam
      TEST-SEAM update_db.
      IF lv_update_db EQ abap_true.
        MODIFY zemp FROM emp.
      ENDIF.
      END-TEST-SEAM.

      res = abap_true.
    ENDIF.
  ENDMETHOD.




ENDCLASS.
