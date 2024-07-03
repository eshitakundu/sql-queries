-- Using 'book' database

USE book;

-- Create table 'Member'

CREATE TABLE Member(
Member_Id INT PRIMARY KEY,
Member_Name varchar(30) NOT NULL,
Member_address Varchar(50),
Acc_Open_Date Date,
Membership_type Varchar(20) CHECK(Membership_type IN('Lifetime', 'Annual', 'Half Yearly', 'Quarterly')),
Fees_paid INT,
Max_Books_Allowed INT CHECK(Max_Books_Allowed < 7),
Penalty_amount DECIMAL(7,2) CHECK(Penalty_amount <= 1000)
);

-- Insert values into 'Member'

INSERT INTO Member (Member_Id, Member_Name, Member_address, Acc_Open_Date, Membership_type, Fees_paid, Max_Books_Allowed, Penalty_amount) VALUES
(1, 'Sayantan Sinha', 'Pune', '2010-12-10', 'Lifetime', 2000, 6, 50),
(2, 'Abhirup Sarkar', 'Kolkata', '2011-01-19', 'Annual', 1400, 3, 0),
(3, 'Ritesh Bhuniya', 'Gujrat', '2011-02-20', 'Quarterly', 350, 2, 100),
(4, 'Paresh Sen', 'Tripura', '2011-03-21', 'Half Yearly', 700, 1, 200),
(5, 'Sohini Haldar', 'Birbhum', '2011-04-11', 'Lifetime', 2000, 6, 10),
(6, 'Suparna Biswas', 'Kolkata', '2011-04-12', 'Half Yearly', 700, 1, 0),
(7, 'Suranjana Basu', 'Purulia', '2011-06-30', 'Annual', 1400, 3, 50),
(8, 'Arpita Roy', 'Kolkata', '2011-07-31', 'Half Yearly', 700, 1, 0);

------------------------------------------------------------------------------------------------

-- Create table 'Book'

CREATE TABLE Books(
Book_No INT PRIMARY KEY,
Book_Name Varchar(30) NOT NULL,
Author_Name Varchar(30),
Cost Decimal(7,2),
Category Char(10) CHECK(Category IN('Science', 'Database', 'System', 'Others'))
);

-- Insert values into 'Books'

INSERT INTO book.Books (Book_No, Book_Name, Author_Name, Cost, Category) VALUES
(101,'Let us C','Denis Ritchie',450,'Others'),
(102,'Oracle-Complete Ref','Loni',550,'Database'),
(103,'Visual Basic 10','BPB',700,'Others'),
(104,'Mastering SQL','Loni',450,'Database'),
(105,'PL SQL-Ref','Scot Urman',470,'Database'),
(106,'UNIX','Sumitava Das',300,'System'),
(107,'Optics','Ghatak',600,'Science'),
(108,'Data Structure','G.S Baluja',350,'Others');

------------------------------------------------------------------------------------------------

-- Create table 'Issue'

CREATE TABLE Issue(
Lib_Issue_Id INT PRIMARY KEY,
Book_No INT,
Member_Id INT,
Issue_Date Date,
Return_date Date,
FOREIGN KEY (Book_No) REFERENCES book.Books (Book_No),
FOREIGN KEY (Member_Id) REFERENCES book.Member (Member_Id)
);

-- Insert values into 'Issue'

INSERT INTO book.Issue ( Lib_Issue_Id, Book_No, Member_Id, Issue_Date, Return_date) VALUES
(7001, 101, 1, '2011-01-10', NULL),
(7002, 102, 2, '2011-01-25', NULL),
(7003, 104, 1, '2011-02-01', NULL),
(7004, 104, 2, '2011-03-15', NULL),
(7005, 101, 4, '2011-04-04', NULL),
(7006, 108, 5, '2011-04-12', NULL),
(7007, 101, 8, '2011-08-01', NULL);
