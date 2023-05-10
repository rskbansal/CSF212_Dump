# Answers to Lab 7
## Q1
### Procedure
```sql
DELIMITER //
CREATE PROCEDURE numemp(IN dept VARCHAR(30), OUT num_emp INT)
DETERMINISTIC
COMMENT 'Number of employees in a department'
BEGIN

SELECT COUNT(*) INTO num_emp
FROM employees, departments
WHERE employees.department_id = departments.department_id AND department_name =  dept;

END; //
DELIMITER ;
```
### Query
```sql
CALL numemp('Shipping', @ans);
SELECT @ans;
```

## Q2
### Procedure
```sql
DELIMITER //
CREATE PROCEDURE cleanup()
DETERMINISTIC
COMMENT 'Clean the employees table'
BEGIN

DECLARE cnt INT;

SELECT * FROM employees WHERE first_name IS NULL OR phone_number IS NULL OR manager_id IS NULL OR department_id IS NULL;
SELECT COUNT(*) INTO cnt FROM employees WHERE first_name IS NULL OR phone_number IS NULL OR manager_id IS NULL OR department_id IS NULL;
DELETE FROM employees WHERE first_name IS NULL OR phone_number IS NULL OR manager_id IS NULL OR department_id IS NULL;

SELECT cnt;

END; //
DELIMITER ;
```
### Query
```sql
CALL cleanup();
```

## Q3
### Procedure
```sql
DELIMITER //
CREATE PROCEDURE sal_increment(job_name VARCHAR(35), increment INT)
DETERMINISTIC
COMMENT 'Update Salary'
BEGIN

SELECT first_name, last_name, employees.job_id, salary AS 'Old salary', salary*(1+increment/100) AS 'New salary'
FROM employees, jobs
WHERE employees.job_id = jobs.job_id AND job_title = job_name;

UPDATE employees, jobs
SET salary = salary*(1+increment/100)
WHERE employees.job_id = jobs.job_id AND job_title = job_name;

END; //
DELIMITER ;
```
### Query
```sql
CALL sal_increment('Stock Manager', 10);
```

## Q4
### Pre-task
```sql
UPDATE departments SET employee_count = 0;
UPDATE departments SET avg_salary = 0;
DELETE FROM employees;
```
### Trigger
```sql
DELIMITER //
CREATE TRIGGER update_emp AFTER INSERT
ON employees
FOR EACH ROW
BEGIN

DECLARE old_cnt INT;
DECLARE old_avg INT;

SELECT employee_count INTO old_cnt FROM departments WHERE department_id = NEW.department_id;
SELECT avg_salary INTO old_avg FROM departments WHERE department_id = NEW.department_id;

UPDATE departments SET employee_count = employee_count + 1 WHERE department_id = NEW.department_id;
UPDATE departments SET avg_salary = ((old_avg*old_cnt) + NEW.salary)/(employee_count) WHERE department_id = NEW.department_id;

END; //
DELIMITER ;
```
### Query
```sql
```