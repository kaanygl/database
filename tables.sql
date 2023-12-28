use trip

CREATE TABLE Department (
    DepartmentNumber INT PRIMARY KEY,
    DepName VARCHAR(255),
	Budget DECIMAL(10, 2),
	DepLocation VARCHAR(100)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(255),
	Email VARCHAR(255),
	DepartmentID INT,
	Salary DECIMAL(10, 2),
	Gender VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentNumber),
    
);

CREATE TABLE Trip (
    TripID INT PRIMARY KEY,
    DestLocation VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Purpose VARCHAR(255),
);
CREATE TABLE Receipt (
    ReceiptNumber INT PRIMARY KEY,
    TripID INT,
    ReceiptImage IMAGE NULL,
	TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (TripID) REFERENCES Trip(TripID)
);

CREATE TABLE Expense (
    ExpenseNumber INT PRIMARY KEY,
    DepID INT,
	ReceiptNo INT,
    ExpenseDate DATE,
    Category VARCHAR(255),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (DepID) REFERENCES Department(DepartmentNumber),
	FOREIGN KEY (ReceiptNo) REFERENCES Receipt(ReceiptNumber)

);

CREATE TABLE Reimbursement(
    RequestNo INT PRIMARY KEY,
    DepNo INT,
	ReceiptNo INT,
    SubmissionDate DATE,
    ApprovalStatus VARCHAR(50),
    FOREIGN KEY (DepNo) REFERENCES Department(DepartmentNumber),
	FOREIGN KEY (ReceiptNo) REFERENCES Receipt(ReceiptNumber)
);	
CREATE TABLE Goes(
	EmployeeID INT,
    TripID INT,
    PRIMARY KEY (EmployeeID, TripID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TripID) REFERENCES Trip(TripID)

);