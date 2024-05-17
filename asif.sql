CREATE DATABASE Vehicle_Rental_System;

USE Vehicle_Rental_System;

CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Date_of_Birth DATE,
  Gender VARCHAR(10),
  Contact_Info VARCHAR(100),
  Driver_License_Number VARCHAR(20)
);

CREATE TABLE Vehicles (
  Vehicle_ID INT PRIMARY KEY,
  Make VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  Type VARCHAR(50),
  License_Plate VARCHAR(20),
  Status VARCHAR(20)
);

CREATE TABLE Rentals (
  Rental_ID INT PRIMARY KEY,
  Customer_ID INT,
  Vehicle_ID INT,
  Rental_Start_Date DATE,
  Rental_End_Date DATE,
  Total_Cost DECIMAL(10, 2),
  Status VARCHAR(20),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);

CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Rental_ID INT,
  Payment_Date DATE,
  Amount DECIMAL(10, 2),
  Payment_Method VARCHAR(20),
  Status VARCHAR(20),
  FOREIGN KEY (Rental_ID) REFERENCES Rentals(Rental_ID)
);

CREATE TABLE Maintenance (
  Maintenance_ID INT PRIMARY KEY,
  Vehicle_ID INT,
  Maintenance_Date DATE,
  Description VARCHAR(100),
  Cost DECIMAL(10, 2),
  Status VARCHAR(20),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);

CREATE TABLE Employees (
  Employee_ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Role VARCHAR(50),
  Contact_Info VARCHAR(100)
);

CREATE TABLE Reservations (
  Reservation_ID INT PRIMARY KEY,
  Customer_ID INT,
  Vehicle_ID INT,
  Reservation_Date DATE,
  Start_Date DATE,
  End_Date DATE,
  Status VARCHAR(20),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
  FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles(Vehicle_ID)
);

CREATE TABLE Feedback (
  Feedback_ID INT PRIMARY KEY,
  Customer_ID INT,
  Rental_ID INT,
  Comments VARCHAR(500),
  Rating INT,
  Date DATE,
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
  FOREIGN KEY (Rental_ID) REFERENCES Rentals(Rental_ID)
);