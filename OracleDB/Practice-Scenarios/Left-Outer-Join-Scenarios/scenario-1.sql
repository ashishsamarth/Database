/*
Sample Data: HR.Employees

Base Data:
SQL> Select
    Employee_Id,
    First_Name,
    Last_Name,
    Manager_Id
From
    Hr.Employees
Order by Manager_ID NULLS First;

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID
----------- -------------------- ------------------------- ----------
        100 Steven               King
        201 Michael              Hartstein                        100
        101 Neena                Kochhar                          100
        102 Lex                  De Haan                          100
        114 Den                  Raphaely                         100
        120 Matthew              Weiss                            100
        121 Adam                 Fripp                            100
        122 Payam                Kaufling                         100
        123 Shanta               Vollman                          100
        124 Kevin                Mourgos                          100
        145 John                 Russell                          100

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID
----------- -------------------- ------------------------- ----------
        146 Karen                Partners                         100
        147 Alberto              Errazuriz                        100
        148 Gerald               Cambrault                        100
        149 Eleni                Zlotkey                          100
        200 Jennifer             Whalen                           101
        203 Susan                Mavris                           101
        108 Nancy                Greenberg                        101
        205 Shelley              Higgins                          101
        204 Hermann              Baer                             101
        103 Alexander            Hunold                           102
        105 David                Austin                           103


Write A Query to return Employee_id, First_Name, Last_Name, Manager_id and Manager_Name
--Make Sure, Steven's row is also shown, since he is the boss with No Manager-ID

This can be achieved via using a left outer join on the same table
Majority of the conditions would work with an Inner Join, But to pull Steven's row a Left Outer Join is needed


*/

SQL> set linesize 500
SQL> Select
    A.Employee_Id,
    A.First_Name,
    A.Last_Name,
    A.Manager_Id,
    B.First_Name As Manager_Name
From
    Hr.Employees A
    Left Outer Join Hr.Employees B On A.Manager_Id = B.Employee_Id
Where
    1=1
    Order By B.First_Name Nulls First;


EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID MANAGER_NAME
----------- -------------------- ------------------------- ---------- --------------------
        100 Steven               King
        130 Mozhe                Atkinson                         121 Adam
        187 Anthony              Cabrio                           121 Adam
        186 Julia                Dellinger                        121 Adam
        185 Alexis               Bull                             121 Adam
        184 Nandita              Sarchand                         121 Adam
        132 TJ                   Olson                            121 Adam
        129 Laura                Bissot                           121 Adam
        131 James                Marlow                           121 Adam
        164 Mattea               Marvins                          147 Alberto
        167 Amit                 Banda                            147 Alberto

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID MANAGER_NAME
----------- -------------------- ------------------------- ---------- --------------------
        166 Sundar               Ande                             147 Alberto
        165 David                Lee                              147 Alberto
        162 Clara                Vishney                          147 Alberto
        163 Danielle             Greene                           147 Alberto
        107 Diana                Lorentz                          103 Alexander
        106 Valli                Pataballa                        103 Alexander
        105 David                Austin                           103 Alexander
        104 Bruce                Ernst                            103 Alexander
        116 Shelli               Baida                            114 Den
        119 Karen                Colmenares                       114 Den
        118 Guy                  Himuro                           114 Den

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID MANAGER_NAME
----------- -------------------- ------------------------- ---------- --------------------
        117 Sigal                Tobias                           114 Den
        115 Alexander            Khoo                             114 Den
        179 Charles              Johnson                          149 Eleni
        178 Kimberely            Grant                            149 Eleni
        177 Jack                 Livingston                       149 Eleni
        176 Jonathon             Taylor                           149 Eleni
        174 Ellen                Abel                             149 Eleni
        175 Alyssa               Hutton                           149 Eleni
        168 Lisa                 Ozer                             148 Gerald
        169 Harrison             Bloom                            148 Gerald
        170 Tayler               Fox                              148 Gerald

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 MANAGER_ID MANAGER_NAME
----------- -------------------- ------------------------- ---------- --------------------
        171 William              Smith                            148 Gerald
        172 Elizabeth            Bates                            148 Gerald
        173 Sundita              Kumar                            148 Gerald
        150 Peter                Tucker                           145 John
        151 David                Bernstein                        145 John
        155 Oliver               Tuvault                          145 John
        153 Christopher          Olsen                            145 John
        154 Nanette              Cambrault                        145 John
        152 Peter                Hall                             145 John
        160 Louise               Doran                            146 Karen
        159 Lindsey              Smith                            146 Karen
