--------------------------------------------------------------------------------
SUBSTR functions allows you to extract a substring from a string
--------------------------------------------------------------------------------
Return_Value_Type: string
syntax: SUBSTR( string, start_position [, length ] )
--------------------------------------------------------------------------------

Returns:

    The SUBSTR function returns a string value.
    If length is a negative number, then the SUBSTR function will return a NULL value.

    If start_position is 0, then the SUBSTR function treats start_position as 1 (ie: the first position in the string).
    If start_position is a positive number, then the SUBSTR function starts from the beginning of the string.
    If start_position is a negative number, then the SUBSTR function starts from the end of the string and counts backwards.

--------------------------------------------------------------------------------
Example:

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '4') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 4, left to right

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	East Braxton Boulevard

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '9') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 8, left to right

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	Braxton Boulevard

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Error: ORA-00938: not enough arguments for function
Since, the start position was not provided

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '0') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------
Getting the sub-string from the source-string starting from position 0 (or the beginning), left to right

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	27 East Braxton Boulevard

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '-1') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position -1 (or the end), left to right (shortcut to pick last character)

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	d

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '-3') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position -3 (or the end), left to right (shortcut to pick last 3 character)

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	ard

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '4', '4') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 4, left to right and select only next 4 characters

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	East

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '4', '10') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 4, left to right and select only next 10 characters

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	East Braxt

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '4', '0') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 4, left to right and select zero chracters
    
    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	(null)

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '4', '-1') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position 4, left to right and select -1 chracters

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	(null)

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '-4', '3') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position -4 (or the end), left to right and select 3 chracters

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	var

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, SUBSTR('27 East Braxton Boulevard', '-4', '-3') AS SUB_STRING_VALUE FROM DUAL;
--------------------------------------------------------------------------------

Getting the sub-string from the source-string starting from position -4 (or the end), left to right and select -3 chracters

    ADDRESS                     SUB_STRING_VALUE
    27 East Braxton Boulevard	(null)

--------------------------------------------------------------------------------