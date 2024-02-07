-- Create Database
USE master;
GO
CREATE DATABASE YourDatabaseName;
GO

-- Switch to the new database
USE YourDatabaseName;
GO

-- Create Table
CREATE TABLE YourTableName (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT
);
GO

-- Insert Data
INSERT INTO YourTableName (ID, Name, Age) VALUES (1, 'John Doe', 30);
INSERT INTO YourTableName (ID, Name, Age) VALUES (2, 'Jane Smith', 25);
INSERT INTO YourTableName (ID, Name, Age) VALUES (3, 'Bob Johnson', 40);
GO
