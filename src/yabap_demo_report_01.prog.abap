*&---------------------------------------------------------------------*
*& Report YABAP_DEMO_REPORT_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yabap_demo_report_01.

*/**
* Select data from database tabel spfli
* double click on this table to view details of this table
*
* show selected data with ALV Grid
* use of function Module REUSE_ALV_GRID_DISPLAY
*/*

* Types declaration
DATA ty_spfli TYPE spfli.

* Data Declaration - global variables
DATA gt_spfli TYPE TABLE OF spfli.    " internal table
DATA gs_spfli TYPE spfli.             " work area / structure
DATA gt_selpa TYPE TABLE OF string.   " dynamic where clause
DATA gs_selpa TYPE string.            " work area / structure

* selection parameters
SELECT-OPTIONS so_carid FOR ty_spfli-carrid OBLIGATORY.
*SELECT-OPTIONS SO_conid FOR spfli-connid.

PARAMETERS pa_cityt TYPE spfli-cityto.
PARAMETERS pa_cityf TYPE spfli-cityfrom.

START-OF-SELECTION.
  PERFORM dynamic_where_clause.
  PERFORM get_data.
  PERFORM display_data.

*&---------------------------------------------------------------------*
*& Form dynamic_where_clause
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM dynamic_where_clause .

  IF pa_cityf IS NOT INITIAL         " both from / to city is supplied
     AND pa_cityt IS NOT INITIAL.

    gs_selpa = 'cityto EQ pa_cityt'.
    APPEND gs_selpa TO gt_selpa.
    CLEAR gs_selpa.
    gs_selpa = 'AND cityfrom EQ pa_cityf'.
    APPEND gs_selpa TO gt_selpa.
    CLEAR gs_selpa.

  ENDIF.

  IF pa_cityf IS NOT INITIAL         " ONLY city from is supplied
      AND pa_cityt IS INITIAL.

    gs_selpa = 'cityfrom EQ pa_cityf'.
    APPEND gs_selpa TO gt_selpa.
    CLEAR gs_selpa.

  ENDIF.

  IF pa_cityf IS INITIAL             " ONLY city to is supplied
    AND pa_cityt IS NOT INITIAL.

    gs_selpa = 'cityto EQ pa_cityt'.
    APPEND gs_selpa TO gt_selpa.
    CLEAR gs_selpa.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       actual data retrieval from de SAP database
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data.

  SELECT * FROM spfli
  INTO TABLE gt_spfli
  WHERE carrid IN so_carid
  AND (gt_selpa).

ENDFORM.                    " GET_DATA

*&---------------------------------------------------------------------*
*&      Form  DISPLAY_DATA
*&---------------------------------------------------------------------*
*       Display selected data in ALV Grid
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_data .

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = 'SY-REPID'
      i_structure_name   = 'SPFLI'
    TABLES
      t_outtab           = gt_spfli.

ENDFORM.                    " DISPLAY_DATA
