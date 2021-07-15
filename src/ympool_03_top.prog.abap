*&---------------------------------------------------------------------*
*& Include YMPOOL_03_TOP                            - Module Pool      YABAP_DEMO_MPOOL_02
*&---------------------------------------------------------------------*
PROGRAM yabap_demo_mpool_03.

TYPES: BEGIN OF ty_spfli,
         mark     TYPE boole_d,
         carrid   TYPE spfli-carrid,
         connid   TYPE spfli-connid,
         cityfrom TYPE spfli-cityfrom,
         airpfrom TYPE spfli-airpfrom,
         cityto   TYPE spfli-cityto,
         airpto   TYPE spfli-airpto,
         fltime   TYPE spfli-fltime,
         deptime  TYPE spfli-deptime,
         arrtime  TYPE spfli-arrtime,
         distance TYPE spfli-distance,
       END OF ty_spfli.

TYPES tty_spfli TYPE SORTED TABLE OF ty_spfli WITH UNIQUE KEY carrid connid.

DATA gt_spfli TYPE tty_spfli.
DATA gs_spfli TYPE ty_spfli.
DATA fcode    TYPE sy-ucomm.
DATA gv_carrid TYPE s_carr_id.
DATA gv_connid TYPE s_conn_id.

DATA gs_connection_data TYPE yspfli_add.
DATA gv_ssn TYPE sy-dynnr.
DATA flag TYPE c.

DATA so_carrir_id TYPE /sdf/sel_tabtype.
DATA so_connid_id TYPE /sdf/sel_tabtype.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC_CONNECTION' ITSELF
CONTROLS: tc_connection TYPE TABLEVIEW USING SCREEN 9100.
DATA:     g_tc_connection_copied.           "copy flag

* Custom Selection Screen 9110
SELECTION-SCREEN BEGIN OF SCREEN 9110 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
*    PARAMETERS: p_rad1 RADIOBUTTON GROUP grp1 DEFAULT 'X',
*                p_rad2 RADIOBUTTON GROUP grp1,
*                p_rad3 RADIOBUTTON GROUP grp1.
    SELECT-OPTIONS: so_carr FOR gv_carrid,
                    so_conn FOR gv_connid.
  SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN END OF SCREEN 9110.
