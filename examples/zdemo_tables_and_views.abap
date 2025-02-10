*&---------------------------------------------------------------------*
*& Report zdemo_tables_and_views
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_tables_and_views.

* 1. simple select from ZEMP *
DATA lt_emp TYPE TABLE OF zemp.
SELECT * FROM zemp
    INTO TABLE @lt_emp
    WHERE is_active = @abap_true.

WRITE / 'Print emp data - 1'.
PERFORM print.



* 2.A select with joins from ZEMP which matches to entry in lt_emp_id_filter.

DATA : lt_emp_id_filter TYPE TABLE OF char100.

APPEND 'E101' TO lt_emp_id_filter.
APPEND 'E102' TO lt_emp_id_filter.
FREE lt_emp.

SELECT * FROM zemp
    INTO TABLE @lt_emp
    FOR ALL ENTRIES IN @lt_emp_id_filter
    WHERE id = @lt_emp_id_filter-table_line.

WRITE / 'Print emp data - 2'.
PERFORM print.


"update emp

LOOP AT lt_emp ASSIGNING FIELD-SYMBOL(<fs_emp>).
ENDLOOP.
MODIFY zemp from TABLE lt_emp.


* 2.B select with joins from ZEMP which matches to entry in lt_emp_filter.

DATA : lt_emp_filter TYPE TABLE OF zemp.

APPEND VALUE #( id = 'E101') TO lt_emp_filter.
APPEND VALUE #( id = 'E102') TO lt_emp_filter.

APPEND 'E102' TO lt_emp_filter.
FREE lt_emp.

SELECT * FROM zemp
    INTO TABLE @lt_emp
    FOR ALL ENTRIES IN @lt_emp_filter
    WHERE id = @lt_emp_filter-id.

WRITE / 'Print emp data - 2'.
PERFORM print.

* lt_emp_filter
* E101   X    D101    
* E102        D102  





* 3. select with joins from ZEMP and ZDEP and ZVEHICLE*
types : BEGIN OF ty_agg_view,
        ID type char100,
        IS_ACTIVE type boolean,
        dep_id type CHAR100,
        dep_name type CHAR100,
        veh_id type CHAR100,
        veh_type type ZVEHICLE_TYPE,
        end of ty_agg_view.

data : ls_agg_view type ty_agg_view,
       lt_agg_view type table of ty_agg_view.

select
    e~id , e~is_Active, d~id, d~name,v~id, v~type
    from ( zemp as e INNER JOIN ZDEP AS d on e~dep_id = d~id
    INNER join zvehicle as v on e~id = v~reg_to )
    WHERE e~is_active = @abap_true
    into TABLE @lt_agg_view.

WRITE / 'Print agg data - join tables'.
LOOP AT lt_agg_view INTO ls_agg_view.
write /  | { ls_agg_view-id } , {  ls_agg_view-dep_name } , {  ls_agg_view-veh_id },  {  ls_agg_view-veh_type }|.
endloop.

* 4. select from view  ZEMP_VIEW *
WRITE / 'Print agg data - from view'.
FREE lt_agg_view.
SELECT * from ZEMP_VIEW INTO TABLE @lt_agg_view where is_active = @abap_true.
LOOP AT lt_agg_view INTO ls_agg_view.
write /  | { ls_agg_view-id } , {  ls_agg_view-dep_name } , {  ls_agg_view-veh_id },  {  ls_agg_view-veh_type }|.
endloop.

FORM print.
  WRITE : 'Print emp data'.
  LOOP AT lt_emp INTO DATA(ls_emp).
    WRITE / | { ls_emp-id } , {  ls_emp-dep_id } , {  ls_emp-is_active }|.
  ENDLOOP.
ENDFORM.
