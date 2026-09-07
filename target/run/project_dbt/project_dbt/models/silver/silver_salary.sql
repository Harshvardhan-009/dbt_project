
  
    USE [dev];
    USE [dev];
    
    

    

    USE [dev];
    EXEC('
        CREATE OR ALTER VIEW "silver"."silver_salary__dbt_tmp__dbt_tmp_vw" AS select
    s.salary_id,
    s.employee_id,
    s.base_salary,
    s.bonus,
    (s.base_salary + isnull(s.bonus, 0)) as total_salary,
    s.effective_date
from "dev"."bronze"."salary" s;
    ')

EXEC('IF OBJECT_ID(''silver.silver_salary__dbt_tmp'', ''U'') IS NOT NULL
                EXEC(''DROP TABLE "dev"."silver"."silver_salary__dbt_tmp"'');SELECT * INTO "dev"."silver"."silver_salary__dbt_tmp" FROM "dev"."silver"."silver_salary__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS "silver"."silver_salary__dbt_tmp__dbt_tmp_vw"')



    
    use [dev];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'silver_silver_salary__dbt_tmp_cci'
        AND object_id=object_id('"silver"."silver_salary__dbt_tmp"')
    )
    DROP index "silver"."silver_salary__dbt_tmp".silver_silver_salary__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX silver_silver_salary__dbt_tmp_cci
    ON "silver"."silver_salary__dbt_tmp"

   


  