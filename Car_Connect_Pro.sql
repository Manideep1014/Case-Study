if exists (select * from sys.databases where name = 'CarConnectDB')  ---checking whether database already exists?
begin
	drop database CarConnectDB;   ----if the database exists we are dropping/deleting the database
end;
go



create database CarConnectDB;  ---creating new database


USE CarConnectDB

------  Tables Creation  -------


--  Customer Table  --

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY identity(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(100), 
    RegistrationDate DATE
);


-- Vehicle Table  --


CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY identity(1,1),
    Model VARCHAR(50),
    Make VARCHAR(50),
    Year INT,
    Color VARCHAR(50),
    RegistrationNumber VARCHAR(20) UNIQUE,
    Availability bit,
    DailyRate DECIMAL(10, 2)
);


-- Reservation Table --


CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    VehicleID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    TotalCost DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) on delete set null,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID) on delete set null
);


-- Admin Table --


CREATE TABLE Admin (
    AdminID INT PRIMARY KEY identity(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(100), 
    Role VARCHAR(50),
    JoinDate DATE
);



----  inserting sample records  ----


INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate)
VALUES
('Manideep','Pothula','m@gmail.com','6309195093','Hyderabad','M123','M@123','2022-1-10'),
('Jayanth','Chanag','m@gmail.com','6309295090','Warangal','J123','J@123','2022-2-19'),
('Shyam','konreddy','s@gmail.com','6309165063','Bengal','S1234','S@123','2022-1-10'),
('Akhil','Poddu','a@gmail.com','6309195390','Hyderabad','A123','A@123','2022-3-16'),
('Raja','Panasa','r@gmail.com','6309465093','Ongole','R123','R@123','2022-4-22'),
('Subhash','Reddy','s@gmail.com','9309195093','Bangalore','S123','S@123','2023-5-10'),
('Viswanath','Rachakolla','v@gmail.com','8309195093','Banalore','V123','V@123','2023-1-10'),
('Pavan','Kotha','p@gmail.com','7309195093','Hyderabad','P123','P@123','2023-12-10'),
('Nithin','BVS','b@gmail.com','9709195093','Hyderabad','B123','B@123','2022-11-10');
 
 


INSERT INTO Vehicle values
    ('Sedan', 'Toyota', 2021, 'Black', 'ABC123', 1, 50.00),
    ('SUV', 'Ford', 2020, 'Red', 'XYZ789', 0, 60.00),
    ('Hatchback', 'Honda', 2019, 'Blue', 'DEF456', 1, 45.00),
    ('Truck', 'Chevrolet', 2022, 'Silver', 'GHI789', 0, 70.00),
    ('Coupe', 'BMW', 2020, 'White', 'JKL012', 1, 80.00),
    ('Van', 'Nissan', 2023, 'Gray', 'MNO345', 1, 55.00),
    ('Convertible', 'Audi', 2018, 'Black', 'PQR678', 1, 90.00),
    ('Electric', 'Tesla', 2022, 'Red', 'STU901', 0, 100.00),
    ('SUV', 'Jeep', 2021, 'Green', 'VWX234', 1, 65.00),
    ('Minivan', 'Chrysler', 2020, 'Silver', 'YZA567', 1, 75.00);

	


INSERT INTO Reservation values
    (1, 1, '2023-02-01', '2023-02-05', 200.00, 'Confirmed'),
    (2, 2, '2023-03-10', '2023-03-15', 360.00, 'Pending'),
    (3, 3, '2023-04-05', '2023-04-10', 270.00, 'Confirmed'),
    (4, 4, '2023-05-20', '2023-05-25', 420.00, 'Pending'),
    (5, 5, '2023-06-15', '2023-06-20', 480.00, 'Completed'),
    (6, 6, '2023-07-10', '2023-07-15', 330.00, 'Confirmed'),
    (7, 7, '2023-08-25', '2023-08-30', 450.00, 'Pending'),
    (8, 8, '2023-09-12', '2023-09-17', 560.00, 'Confirmed'),
    (9, 9, '2023-10-05', '2023-10-10', 390.00, 'Pending'),
    (2, 10, '2023-11-20', '2023-11-25', 600.00, 'Completed');

	


INSERT INTO Admin values
    ('Messi', 'Lionel', 'ml@gmail.com', '8234567890', 'LM10', 'LM@123', 'Super Admin', '2023-01-01'),
    ('Virat', 'Kohli', 'kv@gmail.com', '9876543210', 'VK18', 'VK@123', 'Fleet Manager', '2023-01-15'),
    ('Rahul', 'KL', 'rk@gmail.com', '7712223333', 'RKL', 'RKL@123', 'System Administrator', '2023-02-10'),
    ('Rohit', 'Sharma', 'rs@gmail.com', '9545556666', 'RS264', 'RS@123', 'Admin Assistant', '2023-03-05'),
    ('Ronaldo', 'Cristiano', 'cr@gmail.com', '7678889999', 'CR7', 'CR@123', 'Fleet Manager', '2023-04-20'),
    ('Neymar', 'Jr', 'nj@gmail.com', '9554443333', 'NJR10', 'NJR@123', 'Super Admin', '2023-05-15'),
    ('Suarez', 'Luis', 'sl@gmail.com', '8967778888', 'LS9', 'LS@123', 'System Administrator', '2023-06-10'),
    ('Pedri', 'Kander', 'pk@gmail.com', '9998887777', 'P8', 'P@123', 'Admin Assistant', '2023-07-05'),
    ('Busquets', 'Sergio', 'bs@gmail.com', '6032221111', 'SB5', 'SB@123', 'Fleet Manager', '2023-08-20'),
    ('Haaland', 'Erling', 'he@gmail.com', '9223334444', 'EH9', 'EH@123', 'Super Admin', '2023-09-15');





	SELECT * FROM Customer
	SELECT * FROM Vehicle
    SELECT * FROM Reservation
    SELECT * FROM Admin



