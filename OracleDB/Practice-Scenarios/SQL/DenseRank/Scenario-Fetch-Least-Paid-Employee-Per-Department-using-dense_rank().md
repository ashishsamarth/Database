--------------------------------------------------------------------------------
Scenario-Fetch-Least-Paid-Employee-Per-Department-using-dense_rank()
--------------------------------------------------------------------------------

    WITH salaried_employee AS (
        SELECT
            employee_id,
            first_name,
            last_name,
            salary AS min_salary_in_this_department,
            department_id,
            DENSE_RANK()
            OVER(PARTITION BY department_id
                ORDER BY
                    salary ASC
            )      AS assigned_dense_rank
        FROM
            hr.employees
        WHERE
            1 = 1
    )
    SELECT
        employee_id,
        first_name,
        last_name,
        department_id,
        min_salary_in_this_department
    FROM
        salaried_employee
    WHERE
            1 = 1
        AND assigned_dense_rank = 1;

--------------------------------------------------------------------------------

![!](../../../../Assets/Oracle/Scenario-Fetch-Least-Paid-Employee-Per-Department-using-dense_rank().PNG)