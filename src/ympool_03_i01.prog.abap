*&---------------------------------------------------------------------*
*& Include          YMPOOL_02_I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_9100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_9100 INPUT.

  CASE fcode.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE TO SCREEN 0.
    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'MAINTAIN'.

*      CALL SUBSCREEN subscreen_9120.
      gv_ssn = 9120.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.

*&SPWIZARD: INPUT MODUL FOR TC 'TC_CONNECTION'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: MARK TABLE
MODULE tc_connection_mark INPUT.
  DATA: g_tc_connection_wa2 LIKE LINE OF gt_spfli.
  IF tc_connection-line_sel_mode = 1
  AND gs_spfli-mark = 'X'.
    LOOP AT gt_spfli INTO g_tc_connection_wa2
      WHERE mark = 'X'.
      g_tc_connection_wa2-mark = ''.
      MODIFY gt_spfli
        FROM g_tc_connection_wa2
        TRANSPORTING mark.
    ENDLOOP.
  ENDIF.
  MODIFY gt_spfli
    FROM gs_spfli
    INDEX tc_connection-current_line
    TRANSPORTING mark.
ENDMODULE.
