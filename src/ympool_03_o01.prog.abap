*&---------------------------------------------------------------------*
*& Include          YMPOOL_03_O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_9100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_9100 OUTPUT.
  SET PF-STATUS 'STANDARD'.
  SET TITLEBAR 'YDEMO_MPOOL_02'.

  IF flag IS INITIAL.
    gv_ssn = '9130'. " ASSIGN DEFAULT SUBSCREEN FOR THE FIRST TIME
    flag = 'X'.
  ENDIF.

ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC_CONNECTION'. DO NOT CHANGE THIS LIN
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tc_connection_change_tc_attr OUTPUT.
  DESCRIBE TABLE gt_spfli LINES tc_connection-lines.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module TC_CONNECTION_INIT OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE tc_connection_init OUTPUT.

*  IF g_tc_connection_copied IS INITIAL.
*&SPWIZARD: COPY DDIC-TABLE 'SPFLI'
*&SPWIZARD: INTO INTERNAL TABLE 'g_TC_CONNECTION_itab'

*    SELECT * FROM SPFLI
*       INTO CORRESPONDING FIELDS
*       OF TABLE G_TC_CONNECTION_ITAB.

  PERFORM get_connection_data.

*    g_tc_connection_copied = 'X'.
  REFRESH CONTROL 'TC_CONNECTION' FROM SCREEN '9100'.
*  ENDIF.

ENDMODULE.
