use trip

CREATE TABLE Department (
    DepartmentNumber INT PRIMARY KEY,
    DepName VARCHAR(255) NOT NULL,
	Budget DECIMAL(10, 2) NOT NULL,
	DepLocation VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
	Email VARCHAR(255),
	DepartmentID INT NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentNumber),
    
);

CREATE TABLE Trip (
    TripID INT PRIMARY KEY,
    DestLocation VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Purpose VARCHAR(255)
);
CREATE TABLE Receipt (
    ReceiptNumber INT PRIMARY KEY,
    TripID INT NOT NULL,
    ReceiptImage IMAGE NULL,
	TotalAmount DECIMAL(10, 2) NULL,
    FOREIGN KEY (TripID) REFERENCES Trip(TripID)
);

CREATE TABLE Expense (
    ExpenseNumber INT PRIMARY KEY,
    DepID INT NOT NULL,
	ReceiptNo INT NOT NULL,
    ExpenseDate DATE NOT NULL,
    Category VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DepID) REFERENCES Department(DepartmentNumber),
	FOREIGN KEY (ReceiptNo) REFERENCES Receipt(ReceiptNumber)

);

CREATE TABLE Reimbursement(
    RequestNo INT PRIMARY KEY,
    DepNo INT NOT NULL,
	ReceiptNo INT NOT NULL,
    SubmissionDate DATE NOT NULL,
    ApprovalStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (DepNo) REFERENCES Department(DepartmentNumber),
	FOREIGN KEY (ReceiptNo) REFERENCES Receipt(ReceiptNumber)
);	
CREATE TABLE Goes(
	EmployeeID INT NOT NULL,
    TripID INT NOT NULL,
    PRIMARY KEY (EmployeeID, TripID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TripID) REFERENCES Trip(TripID)

);
