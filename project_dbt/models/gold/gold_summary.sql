select
    e.department_id,
    e.department_name,
    count(distinct e.employee_id) as employee_count,
    avg(sal.total_salary) as avg_salary,
    sum(sal.total_salary) as total_salary_cost
from {{ ref('silver_employee') }} e
left join {{ ref('silver_salary') }} sal
    on e.employee_id = sal.employee_id
group by
    e.department_id,
    e.department_name