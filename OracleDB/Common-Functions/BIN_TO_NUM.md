--------------------------------------------------------------------------------
BIN_TO_NUM function converts a bit vector to a number.
--------------------------------------------------------------------------------
Return_Value_Type: Numeric
Syntax: BIN_TO_NUM( expr1, expr2, ... expr_n)   

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Example:
--------------------------------------------------------------------------------

Select bin_to_num(1) as INT_REP_OF_BINARY from dual;

--------------------------------------------------------------------------------
This function will return the integer representation of the binary
    
    INT_REP_OF_BINARY
    1

--------------------------------------------------------------------------------
Select bin_to_num(1,0) as INT_REP_OF_BINARY from dual;

--------------------------------------------------------------------------------
This function will return the integer representation of the binary
    
    INT_REP_OF_BINARY
    2

--------------------------------------------------------------------------------
Select bin_to_num(1,0,1) as INT_REP_OF_BINARY from dual;
--------------------------------------------------------------------------------
This function will return the integer representation of the binary

    INT_REP_OF_BINARY
    5

--------------------------------------------------------------------------------
Select bin_to_num(1,1,1,1) as INT_REP_OF_BINARY from dual;

--------------------------------------------------------------------------------
This function will return the integer representation of the binary
    
    INT_REP_OF_BINARY
    15

--------------------------------------------------------------------------------
Select bin_to_num(1,1,1,1,0) as INT_REP_OF_BINARY from dual;
--------------------------------------------------------------------------------

This function will return the integer representation of the binary
    
    INT_REP_OF_BINARY
    30

--------------------------------------------------------------------------------
