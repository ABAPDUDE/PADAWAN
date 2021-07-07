*&---------------------------------------------------------------------*
*& Report YABAP_DEMO_REPORT_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yabap_demo_report_02.

*/**
* Exercise: data declaration / CASE statement / IF statement / WRITE statement
* Write an executable program that reads the current system date
* write it to screen in your language in text format.
* Example: 20140727 should be written as: "The twenty-seventh of July 2014"
*
* What do you need:
* Declare variable for 'day' type string             gv_day
* Declare variable for 'month' type string           gv_month
* Declare variable for 'year' type string            gv_year
* Declare variable for 'date_in_text' type string    gv_textdate
*
* Declare a parameter type sy-datum                  pa_date
* maintain the description of inputfield pa_date via
* menu -> goto -> text elements - selection text
* check DDIC reference and the SAP description wil be taken over
*
* re-name routines 1 -> 5
*  PERFORM determine_day.
*  PERFORM determine_month.
*  PERFORM determine_year.
*  PERFORM concatenate_date.
*  PERFORM display_date.
*


*/*

* Types declaration
*TYPES: BEGIN OF ty_,
*         field1 TYPE c,
*         field2 TYPE c,
*       END OF ty.


* Data Declaration - global variables
* DATA ty_field1 TYPE ....
DATA gv_field1 TYPE c.

* selection parameters
* SELECT-OPTIONS so_field1 FOR ... OBLIGATORY.
* SELECT-OPTIONS so_field2 FOR ..

* parameters
PARAMETERS pa_date TYPE syst-datum.

START-OF-SELECTION.
  PERFORM routine_1.
  PERFORM routine_2.
  PERFORM routine_3.
  PERFORM routine_4.
  PERFORM routine_5.

*---------------------------------------------------------------------*
* Form routine_1
*---------------------------------------------------------------------*
* description
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_1 .

* hint: make use of system field sy-datum format
* check in debugging mode the value of parameter PA_DATE
* analyse this value: where is the day?
* remember we want the complete text with the exaxt syntax
* make use of CASE and IF statement

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

* hint: make use of system field sy-datum format
* check in debugging mode the value of parameter PA_DATE
* analyse this value: where is the month?
* make use of CASE and IF statement

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

* hint: make use of system field sy-datum format
* check in debugging mode the value of parameter PA_DATE
* analyse this value: where is the year?

ENDFORM.

*---------------------------------------------------------------------*
* Form routine_4
*---------------------------------------------------------------------*
* description
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_4 .

* hint: use ABAP statement CONCATENATE and check
* SAP HELP - stand on comment en click F1 or the WorldWideWeb for its use

ENDFORM.

*---------------------------------------------------------------------*
* Form routine_5
*---------------------------------------------------------------------*
* description
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_5 .

* What statement do you use to display 1 sentence?

ENDFORM.
