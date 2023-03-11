--------------------------------------------------------------------------------
Scenario: Fetch-Highest-Paid-Employee-Per-Department-using-row_number()
--------------------------------------------------------------------------------
    WITH salaried_employees AS (
        SELECT
            employee_id,
            first_name,
            last_name,
            salary,
            department_id,
            ROW_NUMBER()
            OVER(PARTITION BY department_id
                ORDER BY
                    salary DESC
            ) AS assigned_row_num
        FROM
            hr.employees
        WHERE
            1 = 1
    )
    SELECT
        *
    FROM
        salaried_employees
    WHERE
            1 = 1
        AND assigned_row_num = 1;

--------------------------------------------------------------------------------

![!](../../../Assets/Oracle/Scenario-Fetch-Highest-Paid-Employee-Per-Department-using-row_number().PNG)