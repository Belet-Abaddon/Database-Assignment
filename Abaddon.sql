create database Abaddon;

-- Create cutomer type table
create table customer_type
(Customer_Type_Id char (10) not null,
Customer_Type_Description varchar (50) not null,
primary key (Customer_Type_Id));

desc customer_type;
-- Insert data into the customer_type table
INSERT INTO customer_type VALUES
('CT01', 'Gold'),
('CT02', 'Silver'),
('CT03', 'Copper'),
('CT04', 'Platinum'),
('CT05', 'Bronze');

select *
from customer_type;

-- Create cutomer table
create table customer
(Customer_Account_Id char (10) not null,
Customer_Name varchar (100) not null,
Phone_Number char (15) not null,
Address varchar (200) not null,
NRC char (20) not null,
Email varchar (20) not null,
Customer_Type_Id char (10) not null,
primary key (Customer_Account_Id),
foreign key (Customer_Type_Id) references customer_type(Customer_Type_Id));

desc customer;

-- Insert data into the customer table
INSERT INTO customer VALUES
('100000001', 'U Aye Cho','09-798193142', '123 Main St, Yangon', '12/thaketa(N)373248', 'ayecho@gmail.com', 'CT01'),
('100000002', 'U Sett Da Kanda Thin Ka Yar','09-262349970', '456 Elm St, Yangon', '13/MAHAMA(N)237896', 'jane@gmail.com', 'CT01'),
('100000003', 'U Thuya Aung','09-406631003', '789 Maple St, Yangon', '5/MAYANA(N)246801', 'thuyaaung@gmail.com', 'CT03'),
('100000004', 'U Kyaw Saw','09-201313700', '101 Pine St, Yangon', '13/MAHAMA(N)237896', 'kyawsaw@gmail.com', 'CT01'),
('100000005', 'Daw Thida','09-409760013', '202 Oak St, Yangon', '6/PALANA(N)988743','thida@gmail.com', 'CT02'),
('100000006', 'Daw Thanda','09-794612800', '303 Birch St, Yangon', '12/MAGATA(N)014373','thanda@gmail.com', 'CT03'),
('100000007', 'Daw Nadi Kyaw','09-459886344', '404 Cedar St, Yangon', '14/KAHANA(N)062256','nadikyaw@gmail.com', 'CT04'),
('100000008', 'Daw Thin Thin','09-205562479', '505 Walnut St, Yangon', '9/AHMAZA(N)013620','thinthin@gmail.com', 'CT05'),
('100000009', 'Daw Ohnmar Kyint','09-456811379', '606 Chestnut St, Yangon', '12/YAKANA(N)037219','ohnmarkyint@gmail.com', 'CT04'),
('100000010', 'U Hla Myint','09-267704336', '707 Ash St, Yangon', '5/SAKANA(N)113784', 'hlamyint@gmail.com', 'CT05');
select *
from customer;
-- create loan type table
create table loan_type
(Loan_Type_Id char (10) not null,
Type_Description varchar (20) not null,
primary key (Loan_Type_Id));

desc loan_type;

-- Insert data into the loan_type table
INSERT INTO loan_type VALUES
('LT01', 'Personal Loan'),
('LT02', 'Home Loan'),
('LT03', 'Car Loan'),
('LT04', 'Business Loan'),
('LT05', 'Education Loan');

select *
from loan_type;

-- create loan table
create table loan
(Loan_Id char (10) not null,
Amount_Accepted_Percentage int not null,
Start_Date date not null,
End_Date date not null,
Status_ varchar (20) not null,
Loan_Type_Id varchar (10) not null,
primary key (Loan_Id),
foreign key (Loan_Type_Id) references loan_type(Loan_Type_Id));

desc loan;

-- Insert data into the loan table
INSERT INTO loan VALUES
('L001',20, '2023/02/01', '2024/02/01', 'Active', 'LT01'),
('L002',30, '2023/04/15', '2025/04/15', 'Active', 'LT02'),
('L003',30, '2023/06/10', '2024/02/10', 'Pending', 'LT03'),
('L004',40, '2023/08/20', '2028/08/20', 'Closed', 'LT04'),
('L005',50, '2023/11/25', '2029/11/25', 'Active', 'LT05'),
('L006',30, '2023/12/05', '2025/12/05', 'Active', 'LT02'),
('L007',20, '2023/12/30', '2024/12/30', 'Pending', 'LT01'),
('L008',40, '2024/01/15', '2029/01/15', 'Closed', 'LT04'),
('L009',30, '2024/02/01', '2024/10/01', 'Active', 'LT03'),
('L010',50, '2024/02/10', '2030/02/10', 'Active', 'LT05'),
('L011',20, '2024/03/01', '2025/03/01', 'Active', 'LT01'),
('L012',30, '2024/03/15', '2026/03/15', 'Active', 'LT02');

select *
from loan;

-- create rule table
create table rule
(Rule_Id char (10) not null,
Rule_Description varchar (100) not null,
primary key (Rule_Id));

desc rule;

-- Insert data into the rule table
INSERT INTO rule VALUES
('R0001', 'Customer must own the collateral'),
('R0002', 'Loan amount must not exceed 80% of collateral value'),
('R0003', 'Customer must have a stable income'),
('R0004', 'Loan term must not exceed 30 years'),
('R0005', 'Customer must have a good credit history');

select *
from rule;

-- create loan_rule table
create table loan_rule
(Loan_Id char (10) not null,
Rule_Id char (10) not null,
primary key (Loan_Id,Rule_Id),
foreign key (Loan_Id) references loan(Loan_Id),
foreign key (Rule_Id) references rule(Rule_Id));

desc loan_rule;

-- Insert data into the loan_rule table
INSERT INTO loan_rule VALUES
('L001', 'R0001'),
('L001', 'R0003'),
('L002', 'R0002'),
('L002', 'R0004'),
('L003', 'R0001'),
('L003', 'R0005'),
('L004', 'R0003'),
('L004', 'R0004'),
('L005', 'R0001'),
('L005', 'R0002'),
('L006', 'R0003'),
('L006', 'R0005'),
('L007', 'R0001'),
('L007', 'R0004'),
('L008', 'R0002'),
('L008', 'R0005'),
('L009', 'R0001'),
('L009', 'R0003'),
('L010', 'R0004'),
('L010', 'R0005'),
('L011', 'R0001'),
('L011', 'R0003'),
('L011', 'R0005'),
('L012', 'R0002'),
('L012', 'R0004'),
('L012', 'R0005');

select *
from loan_rule;

-- create staff_type table
create table staff_type
(Staff_Type_Id char (10) not null,
Staff_Type_Description varchar (20) not null,
Department varchar (20) not null,
primary key (Staff_Type_Id));

desc staff_type;

-- Insert data into the staff_type table
INSERT INTO staff_type VALUES
('ST001', 'Manager', 'Loan Department'),
('ST002', 'Officer', 'Loan Department'),
('ST003', 'Clerk', 'Loan Department'),
('ST004', 'Analyst', 'Loan Department'),
('ST005', 'Assistant', 'Loan Department'),
('ST006', 'Clerk', 'Customer Service'),
('ST007', 'Analyst', 'Finance Department'),
('ST008', 'Officer', 'Compliance Department'),
('ST009', 'Assistant', 'HR Department');

select *
from staff_type;

-- create staff table
create table staff
(Staff_Id char (10) not null,
Staff_Name varchar (100) not null,
Staff_Type_Id char (10) not null,
primary key (Staff_Id),
foreign key (Staff_Type_Id) references staff_type(Staff_Type_Id));

desc staff;

-- Insert data into the staff table
INSERT INTO staff VALUES
('S001', 'Hein Min', 'ST001'),
('S002', 'Shwe Zin', 'ST002'),
('S003', 'Ya Min', 'ST003'),
('S004', 'Zin Zin', 'ST004'),
('S005', 'La Yaung', 'ST005'),
('S006', 'Shine Htet', 'ST002'),
('S007', 'Zwe Min Thu', 'ST003'),
('S008', 'Shwe Yee Phyo', 'ST004'),
('S009', 'Myint Myat', 'ST005'),
('S010', 'Myat Noe', 'ST001');

select *
from staff;

-- create registration table
create table registration
(Register_Id char (10) not null,
Registration_Date date not null,
Approve varchar (20) not null,
Customer_Account_Id char (10) not null,
Loan_Id char (10) not null,
Staff_Id char (10) not null,
primary key (Register_Id),
foreign key (Customer_Account_Id) references customer(Customer_Account_Id),
foreign key (Loan_Id) references loan(Loan_Id),
foreign key (Staff_Id) references staff(Staff_Id));

desc registration;

-- Insert data into the registration table
INSERT INTO registration VALUES
('R000000001', '2023/01/01', 'Approved', '100000001', 'L001', 'S001'),
('R000000002', '2023/03/15', 'Approved', '100000002', 'L002', 'S001'),
('R000000003', '2023/05/10', 'Pending', '100000003', 'L003', 'S002'),
('R000000004', '2023/07/20', 'Rejected', '100000004', 'L004', 'S003'),
('R000000005', '2023/10/25', 'Approved', '100000005', 'L005', 'S003'),
('R000000006', '2023/11/05', 'Approved', '100000006', 'L006', 'S004'),
('R000000007', '2023/11/30', 'Pending', '100000007', 'L007', 'S005'),
('R000000008', '2023/12/15', 'Rejected', '100000008', 'L008', 'S006'),
('R000000009', '2024/01/01', 'Approved', '100000009', 'L009', 'S007'),
('R000000010', '2024/01/10', 'Approved', '100000010', 'L010', 'S008'),
('R000000011', '2024/02/01', 'Approved', '100000001', 'L011', 'S002'),
('R000000012', '2024/02/15', 'Approved', '100000005', 'L012', 'S003');

select *
from registration;

-- create collateral_type table
create table collateral_type
(Collateral_Type_Id char (10) not null,
Type_Description varchar (50) not null,
primary key (Collateral_Type_Id));

desc collateral_type;

-- Insert data into the collateral_type table
INSERT INTO collateral_type VALUES
('CT001', 'Real Estate'),
('CT002', 'Vehicle'),
('CT003', 'Jewelry'),
('CT004', 'Equipment'),
('CT005', 'Stocks and Bonds');

select *
from collateral_type;

-- create collateral table
create table collateral
(Collateral_Id char  (10) not null,
Collarteral_Description varchar (30) not null,
Location varchar (50) not null,
Estimated_Value dec (15,2) not null,
Owenership_Status varchar (50) not null,
Collateral_Type_Id char (10) not null,
primary key (Collateral_Id),
foreign key (Collateral_Type_Id) references collateral_type(Collateral_Type_Id));

desc collateral;

-- Insert data into the collateral table
INSERT INTO collateral VALUES
('C001', 'House in Yangon', '12/main stYangon', 300000000.00, 'Owned', 'CT001'),
('C002', 'Toyota Car', 'Mandalay', 20000000.00, 'Owned', 'CT002'),
('C003', 'Gold Necklace', 'Naypyidaw', 5000000.00, 'Owned', 'CT003'),
('C004', 'Tractor', 'Bago', 15000000.00, 'Owned', 'CT004'),
('C005', 'Corporate Bonds', 'Yangon', 15000000.00, 'Owned', 'CT005'),
('C006', 'Condo in Mandalay', 'Set Pu Thi Yi Condo Mandalay', 150000000.00, 'Mortgaged', 'CT001'),
('C007', 'Ford Truck', 'Naypyidaw', 5000000.00, 'Owned', 'CT002'),
('C008', 'Diamond Ring', 'Yangon', 1000000.00, 'Owned', 'CT003'),
('C009', 'Construction Equipment', 'Bago', 1000000.00, 'Leased', 'CT004'),
('C010', 'Mutual Funds', 'Yangon', 1500000.00, 'Owned', 'CT005'),
('C011', 'Apartment in Yangon', 'Yangon', 300000000.00, 'Owned', 'CT001'),
('C012', 'Motorcycle', 'Mandalay', 8400000.00, 'Owned', 'CT002'),
('C013', 'Silver Bracelet', 'Naypyidaw', 1000000.00, 'Owned', 'CT003'),
('C014', 'Truck', 'Bago', 6500000.00, 'Owned', 'CT004'),
('C015', 'Jewelry Stocks', 'Yangon', 500000000.00, 'Owned', 'CT005'),
('C016', 'Office Building in Mandalay', 'Mandalay', 200000000.00, 'Owned', 'CT001'),
('C017', 'BMW', 'Yangon', 400000000.00, 'Owned', 'CT002');

select *
from collateral;

-- create register_collateral table
create table register_collateral
(Collateral_Id char (10) not null,
Register_Id char (10) not null,
primary key (Collateral_Id,Register_Id),
foreign key (Collateral_Id) references collateral(Collateral_Id),
foreign key (Register_Id) references registration(Register_Id));

desc register_collateral;

-- Insert data into the register_collateral table
INSERT INTO register_collateral VALUES
('C001', 'R000000001'),
('C002', 'R000000001'),
('C003', 'R000000002'),
('C004', 'R000000003'),
('C005', 'R000000005'),
('C006', 'R000000006'),
('C007', 'R000000007'),
('C008', 'R000000008'),
('C009', 'R000000009'),
('C010', 'R000000010'),
('C011', 'R000000001'),
('C012', 'R000000002'),
('C013', 'R000000003'),
('C014', 'R000000004'),
('C015', 'R000000005'),
('C016', 'R000000011'),
('C017', 'R000000012');

select *
from register_collateral;

-- 1. The total amount that the bank loaned to each customer
SELECT c.Customer_Account_Id,c.Customer_Name,
SUM(co.Estimated_Value * l.Amount_Accepted_Percentage / 100) AS Total_Loan_Amount
FROM customer c,registration r,loan l,register_collateral rc,collateral co
WHERE c.Customer_Account_Id=r.Customer_Account_Id
AND r.Loan_Id=l.Loan_Id
AND r.Register_Id=rc.Register_Id
AND rc.Collateral_Id=co.Collateral_Id
AND r.Approve = 'Approved'
GROUP BY c.Customer_Account_Id, c.Customer_Name
ORDER BY Total_Loan_Amount DESC;

-- 2. Find the staff who have handled the most number of approved loans and the total loan amount they managed
SELECT s.Staff_Id,s.Staff_Name,COUNT(r.Loan_Id) AS Approved_Loans_Count,
SUM(co.Estimated_Value * l.Amount_Accepted_Percentage / 100) AS Total_Loan_Amount
FROM staff s,registration r,register_collateral rc,loan l,collateral co
WHERE s.Staff_Id = r.Staff_Id
AND r.Loan_Id = l.Loan_Id
AND r.Register_Id = rc.Register_Id
AND rc.Collateral_Id = co.Collateral_Id
AND r.Approve = 'Approved'
GROUP BY s.Staff_Id, s.Staff_Name
ORDER BY Approved_Loans_Count DESC, Total_Loan_Amount DESC;

-- 3. Find the loan type that has the highest total loan amount across all customers
SELECT lt.Type_Description, SUM(co.Estimated_Value * l.Amount_Accepted_Percentage / 100) AS Total_Loan_Amount
FROM loan l,loan_type lt,registration r,register_collateral rc,collateral co
WHERE l.Loan_Type_Id = lt.Loan_Type_Id
AND l.Loan_Id = r.Loan_Id
AND r.Register_Id = rc.Register_Id
AND rc.Collateral_Id = co.Collateral_Id
AND r.Approve = 'Approved'
GROUP BY lt.Type_Description
ORDER BY Total_Loan_Amount DESC
LIMIT 1;

-- 4. Find customers with more than one loan
SELECT c.Customer_Name, COUNT(l.Loan_Id) as 'Loan Count'
FROM customer c,registration r,loan l
WHERE c.Customer_Account_Id=r.Customer_Account_Id
AND r.Loan_Id=l.Loan_Id
GROUP BY c.Customer_Name
HAVING count(l.Loan_Id) >1;

-- 5. Show the total loan amount and number of loans for each customer who has taken loans of different types
SELECT c.Customer_Account_Id,c.Customer_Name,COUNT(DISTINCT l.Loan_Type_Id) AS Loan_Type_Count,
SUM(co.Estimated_Value * l.Amount_Accepted_Percentage / 100) AS Total_Loan_Amount
FROM customer c,registration r,loan l,register_collateral rc,collateral co
WHERE c.Customer_Account_Id = r.Customer_Account_Id
AND r.Loan_Id = l.Loan_Id
AND r.Register_Id = rc.Register_Id
AND rc.Collateral_Id = co.Collateral_Id
AND r.Approve = 'Approved'
GROUP BY c.Customer_Account_Id, c.Customer_Name
HAVING COUNT(DISTINCT l.Loan_Type_Id) > 1
ORDER BY Total_Loan_Amount DESC;

-- 6. Show the customers who have been approved for the highest number of loans with a specific rule applied
SELECT c.Customer_Account_Id,c.Customer_Name,COUNT(DISTINCT l.Loan_Id) AS Loan_Count,
SUM(co.Estimated_Value * l.Amount_Accepted_Percentage / 100) AS Total_Loan_Amount
FROM customer c,registration r,loan l,register_collateral rc,collateral co,loan_rule lr,rule ru
WHERE c.Customer_Account_Id = r.Customer_Account_Id
AND r.Loan_Id = l.Loan_Id
AND r.Register_Id = rc.Register_Id
AND rc.Collateral_Id = co.Collateral_Id
AND l.Loan_Id = lr.Loan_Id
AND lr.Rule_Id = ru.Rule_Id
AND r.Approve = 'Approved'
AND ru.Rule_Description = 'Loan amount must not exceed 80% of collateral value'
GROUP BY c.Customer_Account_Id, c.Customer_Name
ORDER BY Loan_Count DESC, Total_Loan_Amount DESC;

-- 7. List the staff members who have approved loans and the total number of loans they approved
SELECT s.Staff_Name, COUNT(r.Register_Id) AS ApprovedLoanCount
FROM staff s, registration r
WHERE s.Staff_Id=r.Staff_Id
GROUP BY s.Staff_Name;

-- 8. List the total value of collaterals provided by each customer
SELECT c.Customer_Name, SUM(co.Estimated_Value) AS TotalCollateralValue
FROM customer c,registration r,register_collateral rc,collateral co
WHERE c.Customer_Account_Id=r.Customer_Account_Id
AND r.Register_Id=rc.Register_Id
AND rc.Collateral_Id=co.Collateral_Id
GROUP BY c.Customer_Name;

-- 9. List the customers with loans ending in the current year
SELECT c.Customer_Name, l.End_Date
FROM customer c,registration r,loan l
WHERE c.Customer_Account_Id=r.Customer_Account_Id
AND r.Loan_Id=l.Loan_Id
AND YEAR(l.End_Date)=year(curdate());

-- 10. List customers who have provided collaterals valued more than the average collateral value
SELECT c.Customer_Name, co.Estimated_Value
FROM customer c,registration r,register_collateral rc,collateral co
WHERE c.Customer_Account_Id=r.Customer_Account_Id
AND r.Register_Id=rc.Register_Id
AND rc.Collateral_Id=co.Collateral_Id
AND co.Estimated_Value > (SELECT AVG(Estimated_Value) FROM collateral);
