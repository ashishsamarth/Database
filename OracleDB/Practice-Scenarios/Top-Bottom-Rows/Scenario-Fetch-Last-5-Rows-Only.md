--------------------------------------------------------------------------------
Scenario-Fetch-Last-5-Rows-Only
--------------------------------------------------------------------------------
    Select
    *
    From
        Hr.Employees A
    Where
        1=1
    order by employee_id desc
    Fetch first 5 rows only;

--------------------------------------------------------------------------------
![!](../../../Assets/Oracle/Scenario-Fetch-Last-5-Rows-Only.PNG)