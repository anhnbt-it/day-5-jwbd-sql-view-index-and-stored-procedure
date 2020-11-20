USE classicmodels;
SELECT jobTitle FROM employees WHERE lastName LIKE 'T%';
EXPLAIN SELECT jobTitle FROM employees WHERE lastName LIKE 'T%';