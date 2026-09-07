select
    s.salary_id,
    s.employee_id,
    s.base_salary,
    s.bonus,
    (s.base_salary + isnull(s.bonus, 0)) as total_salary,
    s.effective_date
from "dev"."bronze"."salary" s