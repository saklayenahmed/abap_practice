*&---------------------------------------------------------------------*
*& Report Z_SAKLAYEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_saklayen.
*DATA lv_input1(2) TYPE n VALUE 10. "First Input.
*DATA lv_input2(2) TYPE n VALUE 20. "Second input.
*DATA lv_output(3) TYPE n. "Its ouput.

DATA: lv_input1(2) TYPE n VALUE 10, "First Input.
      lv_input2(2) TYPE n VALUE 20, "Second input.
      lv_output(3) TYPE n. "Its ouput.

*lv_input1 = 10.
*lv_input2= 20.

*Processing logic.
lv_output = lv_input1 + lv_input2.

*To display the output
WRITE: 'The result is' , lv_output.
WRITE / lv_input1.
WRITE / lv_input2.
WRITE /.

*-------------------------------
* Cheacking the If Condition
DATA lv_input(2) TYPE n VALUE 2.
IF lv_input = 1.
  WRITE : 'The output is' , lv_input.
ELSEIF lv_input = 2.
  WRITE : 'The output is' , lv_input.
ELSE.
  WRITE: 'Wrong Input'.
ENDIF.

WRITE /.

*----------------------
*Checking the CASE Condition
DATA lv_input_case(2) TYPE n VALUE 1.

CASE lv_input_case.
  WHEN 1.
    WRITE: 'The CASE output is' , lv_input_case.
  WHEN 2.
    WRITE: 'The CASE output is' , lv_input_case.
  WHEN OTHERS.
    WRITE: 'No value found for CASE'.
ENDCASE.

WRITE /.

*---------------------
*Do Loop 1st syntax
*CHECK loop statement
DATA lv_input_do_check(2) TYPE n VALUE 10.

DO 10 TIMES.
  lv_input_do_check = lv_input_do_check + 1.
  CHECK lv_input_do_check = 15.
  WRITE : / 'The Check output is' , lv_input_do_check.
ENDDO.

WRITE /.

*CONTINUE Loop statement
DATA lv_input_do_continue(2) TYPE n VALUE 10.

DO 10 TIMES.
  IF lv_input_do_continue = 14.
    CONTINUE.
  ENDIF.
  WRITE: / 'The do loop 1st syntax' , lv_input_do_continue.
  lv_input_do_continue = lv_input_do_continue + 1.
ENDDO.

WRITE /.

*Do Loop 2nd Syntax if not exit - Endless
DATA lv_input_do_exit(2) TYPE n VALUE 10.
DO.
  IF lv_input_do_exit = 15.
    EXIT. "Exit statement helps us to exit from the current loop.
  ENDIF.
  WRITE: / 'The do loop 2nd syntax' , lv_input_do_exit.
  lv_input_do_exit = lv_input_do_exit + 1.
ENDDO.

WRITE /.

*---------------
*Whie Loop
DATA lv_input_while(2) TYPE n VALUE 10.

WHILE lv_input_while LT 15.
  WRITE: / 'The while loop outout is' , lv_input_while.
  lv_input_while = lv_input_while + 1.
ENDWHILE.

WRITE /.

*Check System variables
WRITE : / 'The name of the user:' , sy-uname.
WRITE : / 'Current date:' , sy-datum.

WRITE /.

DO 10 TIMES.
  WRITE: / sy-index, sy-tabix.
ENDDO.