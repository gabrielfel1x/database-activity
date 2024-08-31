-- 1. Fazer o DDL de um MER específico
CREATE TABLE Department (
    Dno INT PRIMARY KEY,
    Dname VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Ename VARCHAR(50),
    Job VARCHAR(50),
    Salary DECIMAL(10, 2),
    Dno INT,
    FOREIGN KEY (Dno) REFERENCES Department(Dno)
);

-- 2. Popular o BD criado com informações fictícias
INSERT INTO Department (Dno, Dname, Address) VALUES
(1, 'Administration', 'New York, NY'),
(2, 'Research', 'Los Angeles, CA'),
(3, 'Marketing', 'Chicago, IL'),
(4, 'IT', 'Houston, TX'),
(5, 'HR', 'San Francisco, CA'),
(6, 'Sales', 'Seattle, WA');

INSERT INTO Employee (EmpID, Ename, Job, Salary, Dno) VALUES
(101, 'John Doe', 'Manager', 75000.00, 1),
(102, 'Jane Smith', 'Researcher', 68000.00, 2),
(103, 'Jim Brown', 'Analyst', 55000.00, 3),
(104, 'Lisa White', 'Developer', 60000.00, 4),
(105, 'Mark Black', 'HR Specialist', 52000.00, 5),
(106, 'Emily Green', 'Sales Associate', 50000.00, 6);

-- 3. Importar um BD desde um arquivo dump

-- 4. Listar o nome dos itens de pelo menos uma tabela
SELECT Ename FROM Employee;

-- 5. Quantos empregados tem o departamento de pesquisa ("research")?
SELECT COUNT(*) AS NumEmployees
FROM Employee
JOIN Department ON Employee.Dno = Department.Dno
WHERE Department.Dname = 'Research';

-- 6. Incluir um novo departamento denominado "datascience" com Dno = 7
INSERT INTO Department (Dno, Dname, Address)
VALUES (7, 'DataScience', 'Boston, MA');

-- 7. Incluir pelo menos dois cientistas de dados no novo departamento com os atributos básicos
INSERT INTO Employee (EmpID, Ename, Job, Salary, Dno) VALUES
(107, 'Alice Blue', 'Data Scientist', 85000.00, 7),
(108, 'Bob Yellow', 'Data Scientist', 88000.00, 7);

-- 8. Aumentar o salário de todos os empregados em 13.5% do valor atual
UPDATE Employee
SET Salary = Salary * 1.135;

-- 9. Mudar o endereço de residência ("Address") do departamento 4 ("Administration") para Itapajé, CE
UPDATE Department
SET Address = 'Itapajé, CE'
WHERE Dno = 4;
