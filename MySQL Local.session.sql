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

ALTER TABLE customers
CHANGE Customer_ID customer_id INT,
CHANGE Full_Name full_name VARCHAR(255),
CHANGE Place_of_Birth place_of_birth VARCHAR(255),
CHANGE Date_of_Birth date_of_birth DATE,
CHANGE Citizenship citizenship VARCHAR(255),
CHANGE Gender gender VARCHAR(10),
CHANGE Number_of_Children number_of_children INT,
CHANGE Marital_Status marital_status VARCHAR(50),
CHANGE Occupation occupation VARCHAR(255),
CHANGE Customer_Registration_Date customer_registration_date DATE,
CHANGE Monthly_Income monthly_income DECIMAL(10,2),
CHANGE Education_Level education_level VARCHAR(100),
CHANGE City city VARCHAR(255),
CHANGE Number_of_Loans number_of_loans INT;

ALTER TABLE credit_scores
CHANGE Customer_ID customer_id INT,
CHANGE Credit_Score credit_score INT;

ALTER TABLE customer_loans
CHANGE Document_ID document_id INT,
CHANGE Customer_ID customer_id INT,
CHANGE Product_Type product_type VARCHAR(255),
CHANGE Loan_Type loan_type VARCHAR(50),
CHANGE Currency_Type currency_type VARCHAR(10),
CHANGE Loan_Start_Date loan_start_date DATE,
CHANGE Loan_End_Date loan_end_date DATE,
CHANGE Loan_Status loan_status VARCHAR(50),
CHANGE Requested_Amount requested_amount DECIMAL(10,2),
CHANGE Approved_Amount approved_amount DECIMAL(10,2),
CHANGE Principal_Debt principal_debt DECIMAL(10,2),
CHANGE Total_Debt total_debt DECIMAL(10,2),
CHANGE Secondary_Purpose_Code secondary_purpose_code VARCHAR(10),
CHANGE Secondary_Purpose_Description secondary_purpose_description VARCHAR(255),
CHANGE Tertiary_Purpose_Code tertiary_purpose_code VARCHAR(10),
CHANGE Tertiary_Purpose_Description tertiary_purpose_description VARCHAR(255);

ALTER TABLE surveys
CHANGE Customer_ID customer_id INT,
CHANGE Country_of_Residence country_of_residence VARCHAR(255),
CHANGE Citizenship citizenship VARCHAR(255),
CHANGE Is_Politician is_politician BOOLEAN,
CHANGE Has_Political_Affiliation has_political_affiliation BOOLEAN,
CHANGE Account_Purpose account_purpose VARCHAR(255),
CHANGE Annual_Account_Activity_Range annual_account_activity_range VARCHAR(255),
CHANGE Current_Account_Local_Currency_Balance current_account_local_currency_balance DECIMAL(10,2),
CHANGE Number_of_Current_Accounts number_of_current_accounts INT,
CHANGE Savings_Account_Local_Currency_Balance savings_account_local_currency_balance DECIMAL(10,2),
CHANGE Number_of_Savings_Accounts number_of_savings_accounts INT,
CHANGE Investment_Account_Local_Currency_Balance investment_account_local_currency_balance DECIMAL(10,2),
CHANGE Number_of_Investment_Accounts number_of_investment_accounts INT,
CHANGE Authorized_Signatory_Country_of_Residence authorized_signatory_country_of_residence VARCHAR(255),
CHANGE Authorized_Signatory_Citizenship authorized_signatory_citizenship VARCHAR(255),
CHANGE Company_Partner_Citizenship company_partner_citizenship VARCHAR(255),
CHANGE Number_of_Family_Members number_of_family_members INT,
CHANGE Gender gender VARCHAR(10),
CHANGE Marital_Status marital_status VARCHAR(50),
CHANGE Education_Level education_level VARCHAR(100),
CHANGE Occupation occupation VARCHAR(255),
CHANGE Age age INT,
CHANGE Additional_Income additional_income DECIMAL(10,2),
CHANGE Has_Collateral has_collateral BOOLEAN,
CHANGE Owns_Valuable_Items owns_valuable_items BOOLEAN,
CHANGE Owns_Real_Estate owns_real_estate BOOLEAN,
CHANGE Loan_Purpose loan_purpose VARCHAR(255),
CHANGE Loan_Branch loan_branch VARCHAR(255),
CHANGE Number_of_Loans number_of_loans INT,
CHANGE Loan_Month loan_month VARCHAR(50),
CHANGE Primary_Income_Percentage primary_income_percentage DECIMAL(5,2),
CHANGE Income_Type income_type VARCHAR(50),
CHANGE Expense_to_Income_Ratio expense_to_income_ratio DECIMAL(5,2),
CHANGE Negative_Comment_from_Loan_Department negative_comment_from_loan_department BOOLEAN,
CHANGE Years_of_Employment years_of_employment INT,
CHANGE Years_in_Same_Residence years_in_same_residence INT,
CHANGE Job_Position job_position VARCHAR(255),
CHANGE Movable_Property_Value_in_USD movable_property_value_in_usd DECIMAL(15,2),
CHANGE Immovable_Property_Value_Land_in_USD immovable_property_value_land_in_usd DECIMAL(15,2),
CHANGE Second_Property_Value_in_USD second_property_value_in_usd DECIMAL(15,2),
CHANGE Immovable_Property_Value_House_in_USD immovable_property_value_house_in_usd DECIMAL(15,2),
CHANGE Is_Customer_on_Banned_List is_customer_on_banned_list BOOLEAN,
CHANGE Is_Regular_Customer is_regular_customer BOOLEAN,
CHANGE Total_Score total_score DECIMAL(5,2);

ALTER TABLE credit_scores
ADD COLUMN m1 DECIMAL(10, 2),
ADD COLUMN m2 DECIMAL(10, 2);

UPDATE credit_scores
SET m1 = 100.50, m2 = 200.75
WHERE Customer_ID = 1;

UPDATE credit_scores
SET m1 = 110.50, m2 = 210.75
WHERE Customer_ID = 2;

UPDATE credit_scores
SET m1 = 120.50, m2 = 220.75
WHERE Customer_ID = 3;
