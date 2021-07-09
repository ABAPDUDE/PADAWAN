*&---------------------------------------------------------------------*
*& Report YABAP_DEMO_REPORT_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yabap_demo_report_03.

*/**
* Exercise: DATA declaration / SELECT statement / ALV table
* Write an executable program with report transaction:
* that reads flight data from database table SFLIGHT
* show data with CLASS       -> google this CLASS for example use
* create report transaction ZFLDATA_1 with transaction SE93
*
* What do you need:
* Declare variable for internal table TYPE TABEL OF SPFLI   name it:gt_spfli
*
* Declare an object TYPE REF TO cl_salv_table               name it:gr_alvtable
*
* Declare a SELECT_OPTIONS type spfli-carrid         name it: so_carr    Default value low = 'LH'
* Declare a SELECT_OPTIONS type spfli-connid         name it: so_conn    Default value low = '0401' / high = '2402'
*
* maintain the description of the SELECT-OPTIONS via
* menu -> goto -> text elements - selection text
* check DDIC reference and the SAP description wil be taken over
*
* re-name routines 1 -> 3
* PERFORM get_flight_schedule.
* PERFORM initialize_alv.
* PERFORM display_alv.
*
*/*

* Types declaration
*TYPES: BEGIN OF ty_,
*         field1 TYPE c,
*         field2 TYPE c,
*       END OF ty.


* Data Declaration - global variables
* DATA ty_field1 TYPE ... .
* DATA gv_field1 TYPE ... .
* DATA gt_table  TYPE STANDARD TABLE OG ... .
* DATA gt_object TYPE REF TO ... .


* selection parameters
* SELECT-OPTIONS so_field1 FOR ... OBLIGATORY.
* SELECT-OPTIONS so_field2 FOR ..

* parameters
* PARAMETERS pa_... TYPE ... .

*----------------------------------------------------------------------*
* START-OF-SELECTION event                                             *
*----------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM routine_1.
  PERFORM routine_2.
  PERFORM routine_3.

*---------------------------------------------------------------------*
* Form routine_1
*---------------------------------------------------------------------*
* description
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_1 .

* our goal is to retrieve data from database table SPFLI
* we want to display all possible columns / fields of the table
* where the fields connid and carrid are equal to the SELECT-OPTIONS
* hint: check Google to see the correct syntax for a SELECT statement
* check in debugging mode the value(s) of internal table gt_spfli


ENDFORM.
*---------------------------------------------------------------------*
* Form routine_2
*---------------------------------------------------------------------*
* description
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM routine_2 .

  DATA message TYPE REF TO cx_salv_msg.

* hint: here we call the factory method of class cl_salv_table
* every CLASS conssits of METHODS
* double click on the class cl_salv_table to see its structure
* or look at the class with transaction SE24 or SE80
*
* if the factory call goes wrong for some reason we would like to see message
* declare the message here locally in this routine
* declare a local object  TYPE REF TO cx_salv_msg     name it: lr_message
* again look on internet for examples and the right syntax.
* It would be great if you could also apply the TRY / ENDTRY statement

ENDFORM.

*---------------------------------------------------------------------*
* Form routine_3
*---------------------------------------------------------------------*
* description
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_3 .

* hint: call method display( ) of object gr_alvtable

ENDFORM.
