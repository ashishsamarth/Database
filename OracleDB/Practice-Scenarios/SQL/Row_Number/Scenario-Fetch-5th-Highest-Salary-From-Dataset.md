--------------------------------------------------------------------------------
Scenario: Fetch 5th highest salary from Employee Table
--------------------------------------------------------------------------------
    WITH sorted_salary AS (
        SELECT
            employee_id,
            first_name,
            last_name,
            salary,
            department_id,
            ROW_NUMBER()
            OVER(
                ORDER BY
                    salary DESC
            ) AS row_num
        FROM
            hr.employees
        WHERE
            1 = 1
    )
    SELECT
        *
    FROM
        sorted_salary
    WHERE
            1 = 1
        AND row_num = 5;

--------------------------------------------------------------------------------

![!](../../../Assets/Oracle/Scenario-Fetch-5th-Highest-Salary-From-Dataset.PNG)