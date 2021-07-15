*&---------------------------------------------------------------------*
*& Include          YMPOOL_02_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form get_connection_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_connection_data .

  IF so_carr IS NOT INITIAL
      OR so_conn IS NOT INITIAL.

    SELECT * FROM spfli
       INTO CORRESPONDING FIELDS
       OF TABLE gt_spfli
        WHERE carrid IN so_carr
         AND connid IN so_conn.

    REFRESH CONTROL 'TC_CONNECTION' FROM SCREEN '9100'.

  ENDIF.

ENDFORM.
