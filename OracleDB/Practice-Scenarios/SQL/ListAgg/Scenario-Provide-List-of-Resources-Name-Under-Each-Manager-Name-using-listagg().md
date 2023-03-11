--------------------------------------------------------------------------------
Provide: A list of Resources Name under Each Manager Name
--------------------------------------------------------------------------------

    WITH employee_manager_name AS (
        SELECT
            a.employee_id employee_id,
            a.first_name  employee_name,
            a.job_id      job_id,
            b.first_name  manager_name
        FROM
            hr.employees a
            LEFT OUTER JOIN hr.employees b ON a.manager_id = b.employee_id
        WHERE
            1 = 1
        ORDER BY
            b.first_name NULLS FIRST
    )
    SELECT
        manager_name,
        LISTAGG(employee_name, ',' ON OVERFLOW TRUNCATE) WITHIN GROUP(
        ORDER BY
            employee_name
        ) AS resources_under_this_manager
    FROM
        employee_manager_name
    GROUP BY
        manager_name;

--------------------------------------------------------------------------------

![!](../../../../Assets/Oracle/Scenario-Provide-List-of-Resources-Name-Under-Each-Manager-Name-using-listagg().PNG)
