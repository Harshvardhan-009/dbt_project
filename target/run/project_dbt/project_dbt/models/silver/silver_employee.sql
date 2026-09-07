
  
    USE [dev];
    USE [dev];
    
    

    

    USE [dev];
    EXEC('
        CREATE OR ALTER VIEW "silver"."silver_employee__dbt_tmp__dbt_tmp_vw" AS select
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.department_id,
    d.department_name,
    e.hire_date
from "dev"."bronze"."employees_raw" e
left join "dev"."bronze"."department" d
    on e.department_id = d.department_id;
    ')

EXEC('IF OBJECT_ID(''silver.silver_employee__dbt_tmp'', ''U'') IS NOT NULL
                EXEC(''DROP TABLE "dev"."silver"."silver_employee__dbt_tmp"'');SELECT * INTO "dev"."silver"."silver_employee__dbt_tmp" FROM "dev"."silver"."silver_employee__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS "silver"."silver_employee__dbt_tmp__dbt_tmp_vw"')



    
    use [dev];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'silver_silver_employee__dbt_tmp_cci'
        AND object_id=object_id('"silver"."silver_employee__dbt_tmp"')
    )
    DROP index "silver"."silver_employee__dbt_tmp".silver_silver_employee__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX silver_silver_employee__dbt_tmp_cci
    ON "silver"."silver_employee__dbt_tmp"

   


  