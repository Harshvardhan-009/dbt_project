
    
    -- Create target schema if it does not
  USE [sql_local];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo].[testview_5e79c8667d11abb22a762d9c87d83d18_5476]
   as 
    
    
    

select
    employee_id as unique_field,
    count(*) as n_records

from "sql_local"."dbo"."employee_view"
where employee_id is not null
group by employee_id
having count(*) > 1



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo].[testview_5e79c8667d11abb22a762d9c87d83d18_5476]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo].[testview_5e79c8667d11abb22a762d9c87d83d18_5476]
  ;')