-- Learning how to use INNER JOIN
SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  `coursera-projects-456814.employee_data.employees` AS employees
INNER JOIN
  `coursera-projects-456814.employee_data.departments` AS departments
  ON employees.department_id = departments.department_id;

-- Learning how to use LEFT JOIN
SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  `coursera-projects-456814.employee_data.employees` AS employees
LEFT JOIN
  `coursera-projects-456814.employee_data.departments` AS departments
  ON employees.department_id = departments.department_id;

-- Learning how to use RIGHT JOIN
SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  `coursera-projects-456814.employee_data.employees` AS employees
RIGHT JOIN
  `coursera-projects-456814.employee_data.departments` AS departments
  ON employees.department_id = departments.department_id;

-- Learning how to use FULL OUTER JOIN
SELECT
  employees.name AS employee_name,
  employees.role AS employee_role,
  departments.name AS department_name
FROM
  `coursera-projects-456814.employee_data.employees` AS employees
FULL OUTER JOIN
  `coursera-projects-456814.employee_data.departments` AS departments
    ON employees.department_id = departments.department_id;