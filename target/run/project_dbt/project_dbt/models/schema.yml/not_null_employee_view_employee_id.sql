
    
    -- Create target schema if it does not
  USE [sql_local];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo].[testview_2e7d3be96dc9e816bd3c355cfb7fce71_3962]
   as 
    
    
    



select employee_id
from "sql_local"."dbo"."employee_view"
where employee_id is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo].[testview_2e7d3be96dc9e816bd3c355cfb7fce71_3962]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo].[testview_2e7d3be96dc9e816bd3c355cfb7fce71_3962]
  ;')