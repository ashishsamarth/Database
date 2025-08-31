--------------------------------------------------------------------------------
Provide a List of First-Name for all employees in a particular department
--------------------------------------------------------------------------------
    SELECT
        department_id,
        LISTAGG(first_name, ',' ON OVERFLOW TRUNCATE) WITHIN GROUP(
        ORDER BY
            first_name
        ) AS employees_in_this_department
    FROM
        hr.employees
    GROUP BY
        department_id;

--------------------------------------------------------------------------------

![!](../../../../Assets/Oracle/Scenario-Provide-List-of-Employees-Per-deparment-id-using-listagg().PNG)