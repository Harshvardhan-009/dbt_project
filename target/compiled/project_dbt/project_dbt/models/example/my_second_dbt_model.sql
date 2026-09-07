-- Use the `ref` function to select from other models

select *
from "sql_local"."dbo"."my_first_dbt_model"
where id = 1