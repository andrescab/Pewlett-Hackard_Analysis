
SELECT e.emp_no,
				e.first_name,
				e.last_name,
				ti.title,
				ti.from_date,
				ti.to_date

INTO retiree_titles
FROM employees AS e
		INNER JOIN titles AS ti
			  ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
DROP TABLE retiree_titles CASCADE;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retiree_titles WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;
DROP TABLE unique_titles CASCADE;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
DROP TABLE retiring_titles CASCADE;
