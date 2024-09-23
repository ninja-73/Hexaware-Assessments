create database CarConnect

CREATE TABLE Customer 
(CustomerID INT PRIMARY KEY IDENTITY(1,1),  
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(100) UNIQUE NOT NULL,      
PhoneNumber NVARCHAR(15),
Address NVARCHAR(255),
Username NVARCHAR(50) UNIQUE NOT NULL,     
Password NVARCHAR(255) NOT NULL,          
RegistrationDate DATETIME DEFAULT GETDATE())

CREATE TABLE Vehicle 
(VehicleID INT PRIMARY KEY IDENTITY(1,1),  
Model NVARCHAR(50) NOT NULL,
Make NVARCHAR(50) NOT NULL,
Year INT CHECK (Year >= 1886),            
Color NVARCHAR(20),
RegistrationNumber NVARCHAR(20) UNIQUE NOT NULL,
Availability BIT DEFAULT 1,              
DailyRate DECIMAL(10, 2) NOT NULL)

CREATE TABLE Reservation 
(ReservationID INT PRIMARY KEY IDENTITY(1,1),  
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID) ON DELETE CASCADE,
VehicleID INT FOREIGN KEY REFERENCES Vehicle(VehicleID) ON DELETE CASCADE,
StartDate DATETIME NOT NULL,
EndDate DATETIME NOT NULL,
TotalCost DECIMAL(10, 2) NOT NULL,
Status NVARCHAR(20) CHECK (Status IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
CONSTRAINT CHK_EndDate CHECK (EndDate > StartDate))

CREATE TABLE Admin 
(AdminID INT PRIMARY KEY IDENTITY(1,1),   
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Email NVARCHAR(100) UNIQUE NOT NULL,   
PhoneNumber NVARCHAR(15),
Username NVARCHAR(50) UNIQUE NOT NULL,   
Password NVARCHAR(255) NOT NULL,        
Role NVARCHAR(20) CHECK (Role IN ('Super Admin', 'Fleet Manager', 'Support')), 
JoinDate DATETIME DEFAULT GETDATE())

INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate)
VALUES
('John', 'Doe', 'john.doe@example.com', '9876543210', '123 Elm Street, City A', 'john_doe', 'hashed_password_123', '2024-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '8765432109', '456 Oak Avenue, City B', 'jane_smith', 'hashed_password_456', '2024-03-22'),
('Michael', 'Brown', 'michael.brown@example.com', '7654321098', '789 Pine Road, City C', 'mike_brown', 'hashed_password_789', '2024-04-10'),
('Emily', 'Clark', 'emily.clark@example.com', '6543210987', '101 Maple Blvd, City D', 'emily_clark', 'hashed_password_101', '2024-06-05'),
('David', 'Johnson', 'david.johnson@example.com', '5432109876', '102 Cedar Lane, City E', 'david_johnson', 'hashed_password_102', '2024-08-19');

INSERT INTO Vehicle (Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate)
VALUES
('Model S', 'Tesla', 2022, 'Red', 'AB1234XYZ', 1, 100.00),
('Civic', 'Honda', 2020, 'Blue', 'CD5678XYZ', 1, 50.00),
('Corolla', 'Toyota', 2021, 'White', 'EF9101XYZ', 0, 60.00),
('Mustang', 'Ford', 2019, 'Black', 'GH2345XYZ', 1, 80.00),
('3 Series', 'BMW', 2023, 'Grey', 'IJ6789XYZ', 1, 120.00);

INSERT INTO Reservation (CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status)
VALUES
(1, 1, '2024-09-01 10:00:00', '2024-09-05 18:00:00', 500.00, 'Completed'),
(2, 2, '2024-09-10 09:00:00', '2024-09-12 12:00:00', 150.00, 'Completed'),
(3, 3, '2024-09-15 14:00:00', '2024-09-18 10:00:00', 180.00, 'Cancelled'),
(4, 4, '2024-09-20 08:00:00', '2024-09-22 20:00:00', 160.00, 'Pending'),
(5, 5, '2024-09-25 11:00:00', '2024-09-28 17:00:00', 360.00, 'Confirmed');

INSERT INTO Admin (FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate)
VALUES
('Alice', 'Walker', 'alice.walker@example.com', '9998887776', 'admin_alice', 'admin_hashed_password_1', 'Super Admin', '2023-10-01'),
('Bob', 'Harris', 'bob.harris@example.com', '8887776665', 'admin_bob', 'admin_hashed_password_2', 'Fleet Manager', '2023-11-12'),
('Charlie', 'Martin', 'charlie.martin@example.com', '7776665554', 'admin_charlie', 'admin_hashed_password_3', 'Support', '2023-12-20'),
('Diana', 'Lewis', 'diana.lewis@example.com', '6665554443', 'admin_diana', 'admin_hashed_password_4', 'Fleet Manager', '2024-01-30'),
('Eve', 'Moore', 'eve.moore@example.com', '5554443332', 'admin_eve', 'admin_hashed_password_5', 'Super Admin', '2024-03-05');
