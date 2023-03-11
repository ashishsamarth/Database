--------------------------------------------------------------------------------
Scenario-Fetch-Least-Paid-Employee-Per-Department-using-rank()
--------------------------------------------------------------------------------

    WITH salaried_employees AS (
        SELECT
            employee_id,
            first_name,
            last_name,
            salary AS min_salary_in_this_department,
            department_id,
            RANK()
            OVER(PARTITION BY department_id
                ORDER BY
                    salary ASC
            )      AS assigned_rank
        FROM
            hr.employees
        WHERE
            1 = 1
    )
    SELECT
        employee_id,
        first_name,
        min_salary_in_this_department,
        department_id
    FROM
        salaried_employees
    WHERE
            1 = 1
        AND assigned_rank = 1;

--------------------------------------------------------------------------------
![!](../../../Assets/Oracle/Scenario-Fetch-Least-Paid-Employee-Per-Department-using-rank().PNG)