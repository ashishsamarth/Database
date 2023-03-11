--------------------------------------------------------------------------------
INSTR function returns the location of a substring in a string
--------------------------------------------------------------------------------
Return_Value_Type: Numeric
Syntax: INSTR( string, substring [, start_position [, th_appearance ] ] )

--------------------------------------------------------------------------------
Returns:

    The INSTR function returns a numeric value. The first position in the string is 1.
    If substring is not found in string, then the INSTR function will return 0.
    If string is NULL, then the INSTR function will return NULL.
    If substring is NULL, then the INSTR function will return NULL

--------------------------------------------------------------------------------

Example:
--------------------------------------------------------------------------------

SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B') AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B'

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	9

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 1) AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B', starting from letter, at the 1st index of the sentence

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	9

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 1,1) AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B', starting from letter, at the 1st index of the sentence

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	9

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 1,2) AS STRING_POS_SECOND_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the second occurence of letter 'B', starting from letter, at the 1st index of the sentence

    ADDRESS                     STRING_POS_SECOND_OCCURENCE
    27 EAST BRAXTON BOULEVARD	17

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 8,1) AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B', starting from letter, at the 8th index of the sentence

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	9

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 9,1) AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B', starting from letter, at the 9th index of the sentence

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	9

--------------------------------------------------------------------------------
SELECT '27 East Braxton Boulevard' AS ADDRESS, INSTR('27 East Braxton Boulevard', 'B', 10,1) AS STRING_POS_FIRST_OCCURENCE FROM DUAL;
--------------------------------------------------------------------------------

Getting the first occurence of letter 'B', starting from letter, at the 10th index of the sentence

    ADDRESS                     STRING_POS_FIRST_OCCURENCE
    27 EAST BRAXTON BOULEVARD	17

--------------------------------------------------------------------------------