select
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.department_id,
    d.department_name,
    e.hire_date
from {{ source('dev', 'employees_raw') }} e
left join {{ source('dev', 'department') }} d
    on e.department_id = d.department_id