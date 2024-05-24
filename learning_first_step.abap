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

*--------------
*Check System variables
WRITE : / 'The name of the user:' , sy-uname.
WRITE : / 'Current date:' , sy-datum.
WRITE : / 'The Current time is:' , sy-uzeit.

*WRITE : / 'The user command:' , sy-ucomm.

WRITE /.

DO 10 TIMES.
  WRITE: / sy-index, sy-tabix.
ENDDO.


*---------------
*String Operation
DATA : lv_input_string_1(10) TYPE c VALUE 'Welcome',
       lv_input_string_2(10) TYPE c VALUE 'To',
       lv_input_string_3(10) TYPE c VALUE 'SAP',
       lv_output_string      TYPE string.

DATA : lv_result_1_split(10) TYPE  c,
       lv_result_2_split(10) TYPE c,
       lv_result_3_split(10) TYPE c.

DATA lv_input_condense TYPE string VALUE '   Welcome    to    SAP    '.


CONCATENATE lv_input_string_1 lv_input_string_2 lv_input_string_3 INTO lv_output_string SEPARATED BY ' '.
WRITE: / 'The result is:', lv_output_string.

SPLIT lv_output_string AT ' ' INTO lv_result_1_split lv_result_2_split lv_result_3_split.
WRITE : / 'The Split result', / lv_result_1_split, / lv_result_2_split, / lv_result_3_split.
WRITE: / 'Before condense:', lv_input_condense.
WRITE: / 'Length of the text', strlen( lv_input_condense ).

CONDENSE lv_input_condense.
WRITE : / 'After condense:', lv_input_condense.
WRITE: / 'Length of the text', strlen( lv_input_condense ).

CONDENSE lv_input_condense NO-GAPS.
WRITE : / 'After condense (No-Gaps):', lv_input_condense.
WRITE: / 'Length of the text', strlen( lv_input_condense ).

WRITE /.

*-------------------
*Find String
DATA lv_in_find(50) TYPE c VALUE 'System Application Product'.

FIND 'System' IN lv_in_find IGNORING CASE.
IF sy-subrc = 0.
  WRITE : 'Successful', sy-subrc.
ELSE.
  WRITE: 'Unsuccessful', sy-subrc.
ENDIF.


*-------------------------------
*Translate string

DATA : lv_translate(50)   TYPE c VALUE 'Welcome to SAP',
       lv_translate_2(50) TYPE c VALUE 'welcome to sap',
lv_rule(10) TYPE c VALUE 'wWtTpP'.

TRANSLATE lv_translate_2 USING lv_rule.
*TRANSLATE lv_translate TO LOWER CASE.
*WRITE: / lv_translate.

*TRANSLATE lv_translate_2 TO UPPER CASE.
WRITE:/ lv_translate_2.


*----------------------------
*SHIFT string
DATA: shift_string1(10) TYPE c VALUE '0123456789',
      shift_string2(10) TYPE c VALUE '0123456789',
      shift_string3(10) TYPE c VALUE '0123456789',
      shift_string4(10) TYPE c VALUE '0000000007',
      shift_string5(10) TYPE c VALUE '7000000000'.

SHIFT shift_string1 by 5 PLACES LEFT.
WRITE:/ 'Left:', shift_string1.

SHIFT shift_string2 by 5 PLACES RIGHT.
WRITE:/ 'Right:', shift_string2.

SHIFT shift_string3 by 5 PLACES CIRCULAR.
WRITE:/ 'Circular:', shift_string3.

SHIFT shift_string4 LEFT DELETING LEADING  '0'.
CONDENSE shift_string4.
WRITE: / 'Result after deletion:', shift_string4.

SHIFT shift_string5 RIGHT DELETING TRAILING  '0'.
CONDENSE shift_string5.
WRITE: / 'Result after deletion:', shift_string5.