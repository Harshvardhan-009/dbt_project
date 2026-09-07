
  
    USE [dev];
    USE [dev];
    
    

    

    USE [dev];
    EXEC('
        CREATE OR ALTER VIEW "gold"."gold_summary__dbt_tmp__dbt_tmp_vw" AS select
    e.department_id,
    e.department_name,
    count(distinct e.employee_id) as employee_count,
    avg(sal.total_salary) as avg_salary,
    sum(sal.total_salary) as total_salary_cost
from "dev"."silver"."silver_employee" e
left join "dev"."silver"."silver_salary" sal
    on e.employee_id = sal.employee_id
group by
    e.department_id,
    e.department_name;
    ')

EXEC('IF OBJECT_ID(''gold.gold_summary__dbt_tmp'', ''U'') IS NOT NULL
                EXEC(''DROP TABLE "dev"."gold"."gold_summary__dbt_tmp"'');SELECT * INTO "dev"."gold"."gold_summary__dbt_tmp" FROM "dev"."gold"."gold_summary__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS "gold"."gold_summary__dbt_tmp__dbt_tmp_vw"')



    
    use [dev];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'gold_gold_summary__dbt_tmp_cci'
        AND object_id=object_id('"gold"."gold_summary__dbt_tmp"')
    )
    DROP index "gold"."gold_summary__dbt_tmp".gold_gold_summary__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX gold_gold_summary__dbt_tmp_cci
    ON "gold"."gold_summary__dbt_tmp"

   


  