SHOW datestyle;
ALTER DATABASE test_db SET datestyle TO "ISO, MDY";

-- departments table
CREATE TABLE departments (
  dept_no varchar(30) NOT NULL,
  dept_name varchar(30),
  PRIMARY KEY (dept_no)
);

-- titles table
CREATE TABLE titles (
  title_id varchar(10) NOT NULL,
  title varchar(30) NOT NULL,
  PRIMARY KEY (title_id)
);

-- employees table
CREATE TABLE employees (
  emp_no integer NOT NULL,
  emp_title_id varchar(10),
  birth_date date,
  first_name varchar(30),
  last_name varchar(30),
  sex varchar(30),
  hire_date date,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- salaries table
CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- dept_emp table
CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no varchar(30) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- dept_manager table
CREATE TABLE dept_manager (
  dept_no varchar(30) NOT NULL,
  emp_no integer NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
