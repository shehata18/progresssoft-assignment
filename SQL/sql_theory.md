# SQL and Database Fundamentals

## 1. Introduction to SQL and PL/SQL

### 1.1 SQL (Structured Query Language)
SQL is a standard language used to manage and manipulate relational databases. It allows users to create, read, update, and delete data.

SQL is mainly divided into:
- DDL (Data Definition Language)
- DML (Data Manipulation Language)
- DCL (Data Control Language)
- TCL (Transaction Control Language)

---

### 1.2 PL/SQL (Procedural Language / SQL)
PL/SQL is Oracle’s procedural extension of SQL. It allows the use of:
- Variables
- Loops
- Conditions
- Functions and procedures
- Exception handling

PL/SQL is used to write complex business logic inside the database.

---

## 2. SQL Language Components

### 2.1 DDL (Data Definition Language)
Used to define and manage database structures.

Common DDL commands:
- `CREATE`
- `ALTER`
- `DROP`
- `TRUNCATE`

Example:
```sql
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary NUMBER
);
```

### 2.2 DML (Data Manipulation Language)
Used to manipulate data within a database.

Common DML commands:
- `INSERT`
- `UPDATE`
- `DELETE`
- `SELECT`

Example:
```sql
INSERT INTO employees (id, name, salary)
VALUES (1, 'John Doe', 50000);
```
### 2.3 DCL (Data Control Language)
Used to control access to database objects.

Common DCL commands:
- `GRANT`
- `REVOKE`

Example:

```sql
GRANT SELECT ON employees TO user1;
```

### 3. Types of SQL JOINs
JOINs are used to combine rows from multiple tables based on related columns.

## 3.1 INNER JOIN
Returns records with matching values in both tables.

Example:

```sql
SELECT * 
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;
```
## 3.2 LEFT JOIN
Returns all records from the left table, and the matched records from the right table.

Example:

```sql  
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
```
## 3.3 RIGHT JOIN
Returns all records from the right table, and the matched records from the left table.

Example:

```sql
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
```

## 3.4 FULL JOIN (FULL OUTER JOIN)
Returns all records when there is a match in either left or right table.

Example

```sql
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
```

## 3.5 CROSS JOIN
Returns the Cartesian product of both tables.

Example:
```sql
SELECT * 
FROM orders
CROSS JOIN customers;
```

## 3.6 SELF JOIN
A self join is a regular join, but the table is joined with itself.

Example:

```sql
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
```

### 4. RDBMS and NoSQL

## 4.1 RDBMS (Relational Database Management System)
RDBMS stores data in tables with rows and columns and uses fixed schemas.

Examples:
`Oracle`
`MySQL`
`PostgreSQL`
`SQL Server`

Features:
- ACID compliance
- Structured schema
- SQL-based queries
- Strong data consistency

## 4.2 NoSQL Databases
NoSQL databases are designed for large-scale, distributed data and flexible schemas.

Examples:
- MongoDB (Document-based)
- Redis (Key-Value)
- Cassandra (Column-based)
- Neo4j (Graph-based)

Features:
- Schema-less or flexible schema
- High scalability
- Horizontal scaling
- High performance for big data

--------------------------------------------------------

### 5. Aggregation Functions

Aggregation functions perform calculations on multiple rows and return a single value.

Common aggregation functions:
**COUNT()**
**SUM()**
**AVG()**
**MIN()**
**MAX()**
Example:
```sql
SELECT COUNT(*) FROM employees;
```

### 6. Date and String Functions
## 6.1 Date Functions

Common date functions:
`SYSDATE`
`CURRENT_DATE`
`ADD_MONTHS()`
`MONTHS_BETWEEN()`
`NEXT_DAY()`
`LAST_DAY()`

Example:
```sql
SELECT ADD_MONTHS(SYSDATE, 3) FROM dual;
```

## 6.2 String Functions

Common string functions:
- **UPPER()**
- **LOWER()**
- **LENGTH()**
- **SUBSTR()**
- **TRIM()**
- **CONCAT()**
- **REPLACE()**
- **INSTR()**

```sql
SELECT UPPER(name) FROM employees;
```

## 7. Constraints
Constraints are rules applied to columns to ensure data integrity.

Common constraints:
- `NOT NULL`
- `UNIQUE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `CHECK`
- `DEFAULT`

Example:

```sql
CREATE TABLE users (
  id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL
);
```

## 8. Indexes
Indexes improve query performance by reducing data lookup time.

Types of indexes:

**Single-column index**
**Composite index**
**Unique index**


Example:
```sql
CREATE INDEX idx_emp_name ON employees(name);
```

#### 9. Conclusion
Understanding SQL, PL/SQL, joins, database types, functions, constraints, and indexes is essential for backend developers, database administrators, and DevOps engineers. These concepts form the foundation of efficient and scalable database systems.