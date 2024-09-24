create database CourierManagementSystem

use CourierManagementSystem

--Creating tables

create table Users
(UserID INT Identity(1,1) PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL,
Password VARCHAR(255) NOT NULL,
ContactNumber VARCHAR(20),
Address TEXT NOT NULL)

create table Courier
(CourierID INT Identity(1,1) PRIMARY KEY,
UserID INT NOT NULL,
ServiceID INT,
EmployeeID INT NOT NULL,
ReceiverName VARCHAR(255) NOT NULL,
LocationID INT NOT NULL,
Weight DECIMAL(5, 2),
Status VARCHAR(50) 
TrackingNumber VARCHAR(20) UNIQUE,
OrderedDate DATE,
DeliveryDate DATE check(deliverydate > ordereddate),
FOREIGN KEY (UserID) REFERENCES Users(UserID),
FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceId),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeId))

create table CourierServices
(ServiceID INT Identity(1,1) PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(10, 2) check(cost>0)

create table Employee
(EmployeeID INT Identity(1,1) PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2) check(salary>0)

create table [Location] 
(LocationID INT Identity(1,1) PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT)

create table Payment
(PaymentID INT Identity(1,1) PRIMARY KEY,
CourierID INT,
LocationId INT,
Amount DECIMAL(10, 2) check(amount>0),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES [Location] (LocationID))

-- Insert data into the Courier table

insert into Users (Name, Email, Password, ContactNumber, Address) 
values 
('Aarav Sharma', 'aarav@gmail.com', 'Pass123', '9876543210', '123 Main St, Mumbai, Maharashtra'),
('Vihaan Patel', 'vihaan@gmail.com', 'Secure456', '9123456789', '456 Elm St, Delhi, Delhi'),
('Aditya Verma', 'aditya@gmail.com', 'Qwerty789', '9988776655', '789 Pine St, Bangalore, Karnataka'),
('Sai Kumar', 'sai@gmail.com', 'Hello123', '8765432109', '321 Oak St, Hyderabad, Telangana'),
('Reyansh Singh', 'reyansh@gmail.com', 'Password1', '7654321098', '654 Cedar St, Chennai, Tamil Nadu'),
('Anaya Joshi', 'anaya@gmail.com', 'MyPass456', '6543210987', '987 Maple St, Kolkata, West Bengal'),
('Ira Mehta', 'ira@gmail.com', 'Qwerty123', '5432109876', '159 Spruce St, Pune, Maharashtra'),
('Aanya Reddy', 'aanya@gmail.com', 'Passcode1', '4321098765', '753 Birch St, Ahmedabad, Gujarat')

insert into Courier (UserID ,ServiceID, EmployeeID, ReceiverName, LocationID, Weight, Status, TrackingNumber, OrderedDate, DeliveryDate)
values
(1, 1, 1, 'Kiran Nair', 1, 5.25, 'In Transit', 'TRACK12348', '2024-09-20', '2024-09-27'),
(2, 2, 4, 'Pooja Desai', 3, 1.75, 'Delivered', 'TRACK12346', '2024-09-19', '2024-09-20'),
(3, 1, 9, 'Meera Iyer', 5, 4.10, 'Delivered', 'TRACK12349', '2024-09-21', '2024-09-22'),
(1, 1, 5, 'Rahul Gupta', 2, 2.50, 'In Transit', 'TRACK12345', '2024-09-24', '2024-09-25'),
(3, 2, 1, 'Vikram Singh', 6, 2.90, 'In Transit', 'TRACK12350', '2024-09-25', '2024-09-26'),
(4, 1, 1, 'Ravi Menon', 7, 6.00, 'Delivered', 'TRACK12351', '2024-09-20', '2024-09-21'),
(2, 2, 4, 'Suman Rao', 4, 3.00, 'Pending', 'TRACK12347', '2024-09-28', '2024-09-30'),
(5, 1, 4, 'Nisha Sharma', 8, 1.20, 'Pending', 'TRACK12352', '2024-09-27', '2024-09-28'),
(6, 1, 9, 'Kiran Sharma', 1, 5.00, 'Delivered', 'TRACK12353', '2024-09-25', '2024-09-29'),
(7, 2, 1, 'Pooja Desai', 3, 1.80, 'In Transit', 'TRACK12354', '2024-09-30', '2024-09-30'),
(1, 3, 5, 'Suman Rao', 4, 3.50, 'Delivered', 'TRACK12355', '2024-09-22', '2024-09-22'),
(2, 2, 1, 'Nisha Sharma', 8, 1.50, 'Pending', 'TRACK12356', '2024-09-26', '2024-09-26'),
(2, 1, 4, 'Ravi Menon', 7, 4.00, 'In Transit', 'TRACK12357', '2024-09-27', '2024-09-28')

insert into CourierServices (ServiceName, Cost)
values
('Standard Delivery', 50.00),
('Express Delivery', 100.00),
('Same Day Delivery', 150.00),
('Overnight Shipping', 200.00)

insert into Employee (Name, Email, ContactNumber, Role, Salary)
values
('Rajesh Gupta', 'rajesh.gupta@gmail.com', '9876543210', 'Courier', 60000.00),
('Anita Desai', 'anita.desai@gmail.com', '9087654321', 'Inventory Manager', 75000.00),
('Priya Gupta', 'priya.gupta@gmail.com', '9123456789', 'Operations Coordinator', 45000.00),
('Anil Verma', 'anil.verma@gmail.com', '9988776655', 'Courier', 30000.00),
('Sneha Reddy', 'sneha.reddy@gmail.com', '8765432109', 'Courier', 55000.00),
('Sandeep Sharma', 'sandeep.sharma@gmail.com', '3456789012', 'Logistics Coordinator', 65000.00),
('Lisa Brown', 'lisa.brown@gamil.com', '4567890123', 'Warehouse Supervisor', 72000.00),
('Vikram Singh', 'vikram.singh@gmail.com', '5432109876', 'Inventory Manager', 70000.00),
('John Patel', 'isha.patel@gmail.com', '4321098765', 'Courier', 40000.00)

insert into Location (LocationName, Address)
values
('Hyderabad', '654 Hilltop Rd, Hyderabad'),
('Mumbai', '789 Park Ave, Mumbai'),
('Delhi', '456 Sea View Rd, Delhi'),
('Bangalore', '321 River Bank, Bangalore'),
('Chennai', '159 Lakeside Dr, Chennai'),
('Kolkata', '753 Sunset Blvd, Kolkata'),
('Ahmedabad', '963 North St, Ahmedabad'),
('Mumbai', '852 Eastside Ave, Mumbai')

insert into Payment (CourierID, LocationID, Amount, PaymentDate)
values
(1, 1, 50.00, '2024-09-26'),
(2, 3, 100.00, '2024-09-21'),
(3, 4, 50.00, '2024-09-29'),
(4, 2, 50.00, '2024-09-22'),
(5, 5, 120.00, '2024-09-24'),
(6, 6, 50.00, '2024-09-27'),
(7, 1, 150.00, '2024-09-28'),
(8, 7, 50.00, '2024-09-30'),
(9, 3, 50.00, '2024-09-25'),
(10, 4, 100.00, '2024-09-23'),
(11, 5, 150.00, '2024-09-26'),
(12, 6, 100.00, '2024-09-27'),
(13, 8, 60.00, '2024-09-28')

--Task 2 Queries

--1. List all customers
select * from UserTbl

--2. List all orders for a specific customer
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
where c.userid = 1

--3. List all couriers
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId

--4. List all packages for a specific order
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
where c.ReceiverName = 'Ravi Menon'

--5. List all deliveries for a specific courier (service)
select cs.ServiceName, Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
join CourierServices cs on c.serviceId = cs.serviceId
where cs.ServiceID = 1

--6. List all undelivered packages
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
where status!='Delivered'

--7. List all packages that are scheduled for delivery today
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
where DeliveryDate=getdate()

--8. List all packages with a specific status
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
where status='In Transit'
 
 --9. Calculate the total number of packages for each courier
 select cs.ServiceName, count(cs.serviceId) as [Number of Packages]
 from courier c
 join CourierServices cs on c.serviceId = cs.serviceId
 group by c.serviceid, cs.ServiceName

 --10. Find the average delivery time for each courier
 select cs.serviceName, avg(DATEDIFF(day, c.OrderedDate, c.DeliveryDate)+1)
 from courier c
 join CourierServices cs on c.serviceId = cs.serviceId
 group by c.serviceId, cs.ServiceName

 --11. List all packages with a specific weight range
 select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
 from courier c
 join users u on c.userid = u.userid
 where c.Weight between 2.00 and 4.00

 --12. Retrieve employees whose names contain 'John'
 select * from employee
 where name like '%John%'

 --13. Retrieve all courier records with payments greater than $50
  select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, p.Amount
 from courier c
 join users u on c.userid = u.userid
 join payment p on c.courierid = p.CourierID
 where p.Amount>50.00

 --Task 3

 --14. Find the total number of couriers handled by each employee
 select e.name as [Employee Name], count(c.employeeid) as [Number of Couriers]
 from courier c 
 join employee e on c.employeeid = e.employeeid
 group by c.EmployeeID, e.name

 --15. Calculate the total revenue generated by each location

 select l.locationName, sum(p.amount) as Revenue
 from payment p 
 join location l on l.LocationID=p.LocationId
 group by l.LocationName

 --16. Find the total number of couriers delivered to each location
 select l.LocationName, count(c.LocationId) as [Number of Couriers]
 from courier c 
 join location l ON c.locationId = l.locationId
 group by c.LocationId, l.locationName

 --17. Find the courier with the highest average delivery time
 select * from(
 select cs.serviceName, avg(DATEDIFF(day, c.OrderedDate, c.DeliveryDate)+1) as [Average Days], 
 RANK() OVER (ORDER BY avg(DATEDIFF(day, c.OrderedDate, c.DeliveryDate)+1) desc) AS Top1
 from courier c
 join CourierServices cs on c.serviceId = cs.serviceId
 GROUP BY cs.serviceName, c.serviceId
 ) RankedServices
 where top1 >= 1

 --18. Find Locations with Total Payments Less Than a Certain Amount

 select l.locationName, sum(p.amount)
 from payment p
 join location l on l.LocationID = p.LocationId
 group by l.locationName
 having sum(p.amount)>50

 --19. Calculate Total Payments per Location 
 select l.locationName, sum(p.amount)
 from payment p
 join location l on l.LocationID = p.LocationId
 group by l.locationName

 --20. Retrieve couriers who have received payments totaling more than $1000 in a specific location(LocationID = X)
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid
join Location l on c.LocationID = l.LocationID 
join Payment p on l.LocationID = p.PaymentID
where p.Amount>50 and c.LocationID = 2

--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date(PaymentDate > 'YYYY-MM-DD')
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid
join Location l on c.LocationID = l.LocationID 
join Payment p on l.LocationID = p.PaymentID
where p.Amount>50 and c.OrderedDate>CONVERT(DATE, '2024-09-23', 23)

--22. Retrieve locations where the total amount received is more than $5000 before a certain date(PaymentDate > 'YYYY-MM-DD') 
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid
join Location l on c.LocationID = l.LocationID 
join Payment p on l.LocationID = p.PaymentID
where p.Amount>50 and c.OrderedDate<CONVERT(DATE, '2024-09-26', 23)

--Task 3

--23. Retrieve Payments with Courier Information 
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, p.PaymentDate, p.Amount
from users u
join courier c on u.userid = c.UserID
join payment p on c.CourierID=p.CourierID

--24. Retrieve Payments with Location Information 
select l.LocationName, p.PaymentDate, p.Amount
from location l
join payment p on l.locationId = p.LocationId

--25. Retrieve Payments with Courier and Location Information
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, l.Address as [Sender Address], c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, p.PaymentDate, p.Amount
from users u
join courier c on u.userid = c.UserID
join payment p on c.CourierID=p.CourierID
join location l on l.LocationID = p.LocationId

--26. List all payments with courier details (Question repeated from q.no 23)

--27. Total payments received for each courier
select cs.ServiceName, sum(p.amount)
from CourierServices cs
join payment p on cs.Cost = p.Amount
group by cs.ServiceID, cs.ServiceName

--28. List payments made on a specific date 
select paymentId, Amount, PaymentDate
from payment
where paymentDate = CONVERT(DATE, '09/26/2024', 101)

--29. Get Courier Information for Each Payment 
select p.paymentID, p.PaymentDate, p.Amount, u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.UserID
join payment p on c.CourierID=p.CourierID

--30. Get Payment Details with Location (Question repeated from Q.no 24)

--31. Calculating Total Payments for Each Courier (Question repeated from Q.no 27)

--32. List Payments Within a Date Range 
select paymentId, Amount, PaymentDate
from payment
where paymentDate between CONVERT(DATE, '09/26/2024', 101) and CONVERT(DATE, '09/29/2024', 101)

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
select u.Name AS SenderName, u.ContactNumber, u.Email, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from courier c
full outer join users u on c.userid = u.userid

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side 
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, cs.ServiceName
from courier c
full outer join users u on u.UserID = c.UserID
full outer join CourierServices cs on c.ServiceID = cs.ServiceID

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
select e.Name, e.Role, e.Email, e.ContactNumber, e.Salary, p.paymentId, p.Amount, p.Paymentdate
from Employee e
full outer join courier c on c.EmployeeID = e.EmployeeID
full outer join Payment p on p.CourierID = c.CourierID

--36. List all users and all courier services, showing all possible combinations
select u.Name AS SenderName, u.ContactNumber, u.Email, cs.serviceName
from users u 
cross join  CourierServices cs 

--37. List all employees and all locations, showing all possible combinations
select e.Name, e.Role, e.Email, e.ContactNumber, e.Salary, l.LocationName, l.Address
from Employee e
cross join location l

--38. Retrieve a list of couriers and their corresponding sender information (Question Repeated Q.no.3)

--39. Retrieve a list of couriers and their corresponding receiver information (Question Repeated Q.no.3)

--40. Retrieve a list of couriers along with the courier service details
select cs.ServiceName, Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from Courier c
join users u on u.UserID = c.UserId
join CourierServices cs on c.serviceId = cs.serviceId

--41. Retrieve a list of employees and the number of couriers assigned to each employee
select e.Name, e.Role, e.Email, e.ContactNumber, e.Salary, count(c.employeeID) as [Number Of Couriers]
from courier c
join Employee e on c.EmployeeID = e.EmployeeID
group by e.EmployeeID, e.Name, e.Role, e.Email, e.ContactNumber, e.Salary

--42. Retrieve a list of locations and the total payment amount received at each location (Question repeated Q.no 15)

--43. Retrieve all couriers sent by the same sender (based on SenderName)
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid 
where u.Name = 'Aditya Verma'

--44. List all employees who share the same role
select e.Name, e.Role, e.Email, e.ContactNumber, e.Salary
from employee e
join(select role
	from employee 
	group by role
	having count(*)>1) emp on e.Role = emp.Role

--45. Retrieve all payments made for couriers sent from the same location
select p.paymentID, l.address, p.Amount, p.PaymentDate
from payment p
join location l on l.locationID = p.LocationId
where l.LocationName = 'Bangalore'

--46. Retrieve all couriers sent from the same location (based on SenderAddress)
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid 
where CONVERT(varchar, u.Address) = '456 Elm St, Delhi, Delhi'

--47. List employees and the number of couriers they have delivered:
select e.name as [Employee Name], count(c.employeeid) as [Couriers Delivered]
 from courier c 
 join employee e on c.employeeid = e.employeeid
 where c.status = 'Delivered'
 group by c.EmployeeID, e.name
 
 --48. Find couriers that were paid an amount greater than the cost of their respective courier services
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, cs.Cost, p.Amount
from users u
join courier c on u.userid = c.userid 
join CourierServices cs on c.ServiceID = cs.ServiceID
join payment p on p.CourierID = c.CourierID
where p.amount > cs.Cost

--49. Find couriers that have a weight greater than the average weight of all couriers

select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid 
where c.weight > (select avg(weight) from courier)

--50. Find the names of all employees who have a salary greater than the average salary
select Name, role, salary
from Employee 
where Salary > (select avg(salary) from Employee)

--51. Find the total cost of all courier services where the cost is less than the maximum cost
select sum(cost)
from CourierServices
where cost < (select max(cost) from CourierServices)

--52. Find all couriers that have been paid for
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate, p.Amount, p.PaymentDate
from users u
join courier c on u.userid = c.userid 
join payment p on c.CourierID = p.CourierID
where c.CourierID in (select CourierID from Payment)

--53. Find the locations where the maximum payment amount was made 
select l.Address, p.amount, p.paymentdate
from Location l
join payment p on p.LocationId = l.LocationID
where p.Amount = (select max(amount) from payment)

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName')
select u.Name AS SenderName, u.Address as SenderAddress, c.ReceiverName, c.LocationID, c.Weight, c.Status, c.TrackingNumber, c.OrderedDate, c.DeliveryDate
from users u
join courier c on u.userid = c.userid 
where c.weight > (select sum(weight)
from users u
join courier c on u.userid = c.userid 
where u.name = 'Anaya Joshi')



