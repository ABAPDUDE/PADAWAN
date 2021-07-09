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
DATA gv_day TYPE string.
DATA gv_month TYPE string.
DATA gv_year TYPE string.
DATA date_in_text TYPE string.


* selection parameters
* SELECT-OPTIONS so_field1 FOR ... OBLIGATORY.
* SELECT-OPTIONS so_field2 FOR ..

* parameters
PARAMETERS pa_date TYPE sy-datum.

START-OF-SELECTION.
  PERFORM routine_1.
  PERFORM routine_2.
  PERFORM routine_3.
  PERFORM routine_4.
  PERFORM routine_5.

*---------------------------------------------------------------------*
* Form routine_1
*---------------------------------------------------------------------*
* year determination
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_1 .

  gv_year = pa_date(4).



ENDFORM.
*---------------------------------------------------------------------*
* Form routine_2
*---------------------------------------------------------------------*
* month determination
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM routine_2 .

  CASE pa_date+4(2).

    WHEN 01.
      gv_month = 'January'.
    WHEN 02.
      gv_month = 'February'.
    WHEN 03.
      gv_month = 'March'.
    WHEN 04.
      gv_month = 'April'.
    WHEN 05.
      gv_month = 'May'.
    WHEN 06.
      gv_month = 'June'.
    WHEN 07.
      gv_month = 'July'.
    WHEN 08.
      gv_month = 'August'.
    WHEN 09.
      gv_month = 'September'.
    WHEN 10.
      gv_month = 'October'.
    WHEN 11.
      gv_month = 'November'.
    WHEN 12.
      gv_month = 'December'.

  ENDCASE.

ENDFORM.

*---------------------------------------------------------------------*
* Form routine_3
*---------------------------------------------------------------------*
* days
*---------------------------------------------------------------------*
* -->  p1        text
* <--  p2        text
*---------------------------------------------------------------------*
FORM routine_3 .

  CASE pa_date+6(2).
    WHEN 01.
      gv_day = 'first'.
    WHEN 02.
      gv_day = 'second'.
    WHEN 03.
      gv_day = 'third'.
    WHEN 04.
      gv_day = 'fourth'.
    WHEN 05.
      gv_day = 'fifth'.
    WHEN 06.
      gv_day = 'sixth'.
    WHEN 07.
      gv_day = 'seventh'.
    WHEN 08.
      gv_day = 'eighth'.
    WHEN 09.
      gv_day = 'nineth'.
    WHEN 10.
      gv_day = 'tenth'.
    WHEN 11.
      gv_day = 'eleventh'.
    WHEN 12.
      gv_day = 'twelth'.
    WHEN 13.
      gv_day = 'thirteenth'.
    WHEN 14.
      gv_day = 'fourteenth'.
    WHEN 15.
      gv_day = 'fifteenth'.
    WHEN 16.
      gv_day = 'sixteenth'.
    WHEN 17.
      gv_day = 'seventeenth'.
    WHEN 18.
      gv_day = 'eighteenth'.
    WHEN 19.
      gv_day = 'nineteenth'.
    WHEN 20.
      gv_day = 'twentieth'.
    WHEN 21.
      gv_day = 'twenty first'.
    WHEN 22.
      gv_day = 'twenty second'.
    WHEN 23.
      gv_day = 'twenty third'.
    WHEN 24.
      gv_day = 'twenty fourth'.
    WHEN 25.
      gv_day = 'twenty fifth'.
    WHEN 26.
      gv_day = 'twenty sixth'.
    WHEN 27.
      gv_day = 'twenty seventh'.
    WHEN 28.
      gv_day = 'twenty eigth'.
    WHEN 29.
      gv_day = 'twenty nineth'.
    WHEN 30.
      gv_day = 'thirtieth'.
    WHEN 31.
      gv_day = 'thirty first'.

  ENDCASE.

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

  CONCATENATE gv_day gv_month gv_year into date_in_text separated by space.

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

WRITE: 'the', gv_day, 'of', gv_month, gv_year.

ENDFORM.
