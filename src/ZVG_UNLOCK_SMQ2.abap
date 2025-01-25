&---------------------------------------------------------------------
*& Report  ZVG_UNLOCK_SMQ2
&---------------------------------------------------------------------
*& Developed By: Vidit Goel
*& Date :         24/01/25
*& Purpose:       This program identifies and unlocks stuck inbound queues from SMQ2.
&---------------------------------------------------------------------

REPORT zvg_unlock_smq2.

DATA: lt_queues   TYPE TABLE OF trfcqview, " Table for queue details
      ls_queue    TYPE trfcqview,          " Work area for queue details
      lv_tid      TYPE arfctid,            " Transaction ID
      lv_cleared  TYPE i VALUE 0.         " Count of cleared queues

---------------------------------------------------------------------
* Main Logic: Loop until all stuck queues are cleared
---------------------------------------------------------------------
DO. " Infinite loop to repeatedly process stuck queues
  CLEAR: lt_queues, lv_cleared.

*  * Step 1: Fetch stuck queues from SMQ2
  CALL FUNCTION 'TRFC_QIN_GET_CURRENT_QUEUES'
    TABLES
      qview = lt_queues.

*  * Exit the loop if no stuck queues are found
  IF sy-subrc <> 0 OR lt_queues IS INITIAL.
    WRITE: / 'No stuck queues found. All queues are cleared.'.
    EXIT.
  ENDIF.

  WRITE: / 'Stuck queues found:', lines( lt_queues ), ' - Starting processing.'.

*  * Step 2: Process each stuck queue
  LOOP AT lt_queues INTO ls_queue.
    WRITE: / 'Processing Queue:', ls_queue-qname.

*    * Fetch the transaction ID (TID) for the current queue
    SELECT SINGLE
      arfcipid
      arfcpid
      arfctime
      arfctidcnt
    FROM trfcqin
    INTO lv_tid
    WHERE qname = ls_queue-qname.

*    * Check if a TID was found
    IF sy-subrc = 0 AND lv_tid IS NOT INITIAL.
*      * Attempt to delete the LUW
      CALL FUNCTION 'TRFC_QIN_DELETE_LUW'
        EXPORTING
          tid = lv_tid.

*      * Log success or failure
      IF sy-subrc = 0.
        WRITE: / 'Queue unlocked successfully:', ls_queue-qname.
        ADD 1 TO lv_cleared. " Increment cleared count
      ELSE.
        WRITE: / 'Failed to unlock queue:', ls_queue-qname.
      ENDIF.
    ELSE.
      WRITE: / 'No TID found for queue:', ls_queue-qname.
    ENDIF.

  ENDLOOP.

*  * Log progress after one iteration
  WRITE: / lv_cleared, 'queues unlocked in this iteration.'.

ENDDO.

