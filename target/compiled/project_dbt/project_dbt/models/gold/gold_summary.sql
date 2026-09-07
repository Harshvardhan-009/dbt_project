select
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
    e.department_name