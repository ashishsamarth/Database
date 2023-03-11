--------------------------------------------------------------------------------
Scenario-Assign-Row-Numbers-to-records-using-row_number()-desc
--------------------------------------------------------------------------------
    Select
        A.Employee_Id,
        A.First_Name,
        A.Last_Name,
        A.Manager_Id,
        B.First_Name As Manager_Name,
        row_number() over(order by a.employee_id) as Row_num
    From
        Hr.Employees A
        Left Outer Join Hr.Employees B On A.Manager_Id = B.Employee_Id
    Where
        1=1
        Order By row_number() over(order by a.employee_id desc) Nulls First;

--------------------------------------------------------------------------------
![!](../../../../Assets/Oracle/Scenario-Assign-Row-Numbers-to-records-using-row_number()-desc.PNG)