INSERT INTO customers (Customer_ID, Full_Name, Place_of_Birth, Date_of_Birth, Citizenship, Gender, Number_of_Children, Marital_Status, Occupation, Customer_Registration_Date, Monthly_Income, Education_Level, City, Number_of_Loans)
VALUES
(1, 'John Doe', 'New York', '1985-06-15', 'USA', 'Male', 2, 'Married', 'Software Engineer', '2020-03-22', 7500.50, 'Bachelor', 'Los Angeles', 2),
(2, 'Jane Smith', 'Berlin', '1990-12-05', 'Germany', 'Female', 1, 'Single', 'Data Scientist', '2021-07-14', 6800.00, 'Master', 'Berlin', 1),
(3, 'Michael Brown', 'London', '1978-09-25', 'UK', 'Male', 3, 'Married', 'Consultant', '2019-02-10', 10500.75, 'PhD', 'London', 4);

INSERT INTO credit_scores (Customer_ID, Credit_Score)
VALUES
(1, 750),
(2, 680),
(3, 820);

INSERT INTO customer_loans (Document_ID, Customer_ID, Product_Type, Loan_Type, Currency_Type, Loan_Start_Date, Loan_End_Date, Loan_Status, Requested_Amount, Approved_Amount, Principal_Debt, Total_Debt, Secondary_Purpose_Code, Secondary_Purpose_Description, Tertiary_Purpose_Code, Tertiary_Purpose_Description)
VALUES
(1001, 1, 'Home Loan', 'Fixed', 'USD', '2020-01-10', '2030-01-10', 'Active', 300000.00, 280000.00, 250000.00, 270000.00, '001', 'Mortgage', '002', 'House Purchase'),
(1002, 2, 'Car Loan', 'Variable', 'EUR', '2021-05-15', '2026-05-15', 'Active', 25000.00, 24000.00, 22000.00, 23000.00, '003', 'Vehicle', '004', 'Car Purchase'),
(1003, 3, 'Personal Loan', 'Fixed', 'GBP', '2019-03-25', '2024-03-25', 'Closed', 15000.00, 14000.00, 13000.00, 13500.00, '005', 'Personal Expenses', '006', 'Debt Consolidation');

INSERT INTO surveys (Customer_ID, Country_of_Residence, Citizenship, Is_Politician, Has_Political_Affiliation, Account_Purpose, Annual_Account_Activity_Range, Current_Account_Local_Currency_Balance, Number_of_Current_Accounts, Savings_Account_Local_Currency_Balance, Number_of_Savings_Accounts, Investment_Account_Local_Currency_Balance, Number_of_Investment_Accounts, Authorized_Signatory_Country_of_Residence, Authorized_Signatory_Citizenship, Company_Partner_Citizenship, Number_of_Family_Members, Gender, Marital_Status, Education_Level, Occupation, Age, Additional_Income, Has_Collateral, Owns_Valuable_Items, Owns_Real_Estate, Loan_Purpose, Loan_Branch, Number_of_Loans, Loan_Month, Primary_Income_Percentage, Income_Type, Expense_to_Income_Ratio, Negative_Comment_from_Loan_Department, Years_of_Employment, Years_in_Same_Residence, Job_Position, Movable_Property_Value_in_USD, Immovable_Property_Value_Land_in_USD, Second_Property_Value_in_USD, Immovable_Property_Value_House_in_USD, Is_Customer_on_Banned_List, Is_Regular_Customer, Total_Score)
VALUES
(1, 'USA', 'USA', FALSE, FALSE, 'Personal', 'High', 5000.00, 2, 10000.00, 1, 20000.00, 2, 'USA', 'USA', 'USA', 4, 'Male', 'Married', 'Bachelor', 'Engineer', 39, 2000.00, TRUE, TRUE, TRUE, 'Mortgage', 'NYC', 2, 'January', 75.00, 'Salary', 0.5, FALSE, 10, 5, 'Manager', 15000.00, 50000.00, 20000.00, 25000.00, FALSE, TRUE, 85),
(2, 'Germany', 'Germany', FALSE, FALSE, 'Business', 'Medium', 3000.00, 1, 15000.00, 2, 25000.00, 1, 'Germany', 'Germany', 'Germany', 3, 'Female', 'Single', 'Master', 'Data Scientist', 34, 1000.00, FALSE, TRUE, FALSE, 'Car Purchase', 'Berlin', 1, 'February', 65.00, 'Freelance', 0.4, FALSE, 7, 3, 'Consultant', 10000.00, 60000.00, 15000.00, 30000.00, FALSE, TRUE, 70),
(3, 'UK', 'UK', TRUE, TRUE, 'Investment', 'High', 8000.00, 3, 12000.00, 1, 30000.00, 2, 'UK', 'UK', 'UK', 5, 'Male', 'Married', 'PhD', 'Consultant', 46, 3000.00, TRUE, TRUE, TRUE, 'Personal Expenses', 'London', 4, 'March', 80.00, 'Business', 0.6, TRUE, 15, 10, 'CEO', 20000.00, 100000.00, 50000.00, 40000.00, FALSE, TRUE, 90);

