USE travel

CREATE TABLE Trips (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    Destination VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Purpose TEXT NULL,
	Expense Dec(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
);

CREATE TABLE Employee_Trip(
	TripID INT,
	EmployeeID INT ,

	PRIMARY KEY(TripID, EmployeeID),
	FOREIGN KEY (TripID) REFERENCES Trips(TripID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
)

CREATE TABLE Expenses (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    TripID INT,
    Category VARCHAR(50),
    Amount DECIMAL(10, 2),
    Description_ TEXT NULL,
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);

CREATE TABLE Expense_Trip(
	TripID INT NOT NULL,
	ExpenseID INT NOT NULL,

	PRIMARY KEY (TripID, ExpenseID),
	FOREIGN KEY (TripID) REFERENCES Trips(TripID),
	FOREIGN KEY (ExpenseID) REFERENCES Expenses(ExpenseID)
)

CREATE TABLE ReimbursementRequests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    TripID INT,
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
);
