--Experiment 2
--Medium level Question
CREATE TABLE EMPLOYEE_TBL(
	EmpID INT PRIMARY KEY,
	Ename VARCHAR(10),
	Department VARCHAR(10),
	ManagerID INT
)

INSERT INTO EMPLOYEE_TBL(EmpID, Ename, Department, ManagerID) VALUES
(1, 'Alice', 'HR', NULL),     
(2, 'Bob','Finance',1 ),          
(3, 'Charlie', 'IT',1 ),      
(4, 'David','Finance',2 ),        
(5, 'Eve','IT',3 ),          
(6, 'Frank','HR',1 );

SELECT E1.Ename AS [EMPLOYEE NAME],E1.Department AS [EMPLOYEE DEPT],
E2.Ename AS [MANAGER NAME], E2.Department AS [MANAGER DEPT]
FROM EMPLOYEE_TBL AS E1
LEFT OUTER JOIN
EMPLOYEE_TBL AS E2
ON
E1.ManagerID = E2.EmpID

--Hard Level Question

-- Create Year_tbl (holds actual NPV values)
CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

-- Create Queries table (requested values)
CREATE TABLE Queries_tbl (
    ID INT,
    YEAR INT
);

-- Insert data into Year_tbl
INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

-- Insert data into Queries
INSERT INTO Queries_tbl(ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT
Q.ID,Q.YEAR,ISNULL(Y.NPV,0) AS NPV
FROM 
Queries_tbl AS Q
LEFT OUTER JOIN
Year_tbl AS Y
ON Q.ID = Y.ID AND Q.YEAR = Y.YEAR;
