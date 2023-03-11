--------------------------------------------------------------------------------
Provide: A list of Employee Job ids (distinct) under Each Manager Name
--------------------------------------------------------------------------------

    WITH job_ids_under_manager AS (
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
        LISTAGG(DISTINCT(job_id), ',' ON OVERFLOW TRUNCATE) WITHIN GROUP(
        ORDER BY
            job_id
        ) AS job_ids_under_this_manager
    FROM
        job_ids_under_manager
    GROUP BY
        manager_name;

--------------------------------------------------------------------------------

![!](../../../Assets/Oracle/Scenario-Provide-List-of-Distinct-Job-IDs-Under-Each-Manager-Name-using-listagg().PNG)