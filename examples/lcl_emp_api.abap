*"* use this source file for your ABAP unit test classes


CLASS lcl_emp_api DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      emp_obj TYPE REF TO zcl_emp_api.  "class under test

    METHODS: get_emp FOR TESTING.
    METHODS: upd_emp FOR TESTING.

ENDCLASS.       "lcl_Calculator_Unit_Test


CLASS lcl_emp_api IMPLEMENTATION.

  METHOD get_emp.
    CREATE OBJECT emp_obj.


    DATA(res) = zcl_emp_api=>get_emp( 'E101' ).

  ENDMETHOD.



  METHOD upd_emp.

    DATA emp TYPE zemp.

    " case 1 : update should fail for empty employee
    TRY.
        DATA(res) = zcl_emp_api=>upd_emp( emp ).
      CATCH cx_number_ranges INTO DATA(lx_e).
    ENDTRY.
    IF lx_e IS INITIAL. "if we do not get an exception as expect test fails
      cl_abap_unit_assert=>fail( 'update should fail for empty object' ).
    ENDIF.


      " case 2 : update should pass for valid data
    CLEAR : res, lx_e, emp.

    emp-id = 'E101'.
    emp-client = 012.
    emp-is_active = abap_true.
    emp-no_years = 1.
    emp-dep_id = 'D101'.

    TRY.

          TEST-INJECTION update_db.
            res = abap_true.
          END-TEST-INJECTION.

        res = zcl_emp_api=>upd_emp( emp ).
      CATCH cx_number_ranges INTO lx_e.
    ENDTRY.
    IF res EQ abap_true AND
    lx_e IS NOT INITIAL. "we expect no exception in this case
      cl_abap_unit_assert=>fail( 'update should pass for valid employee object' ).
    ENDIF.


  ENDMETHOD.


ENDCLASS.
