-- BANK LOAN DATA ANALYSIS PROJECT

CREATE DATABASE bank_loan;
USE bank_loan;

SELECT * 
FROM bank_loan_data;

-- BANK LOAN REPORT | SUMMARY
-- 1.Primary KPI's:

-- 1.Total Loan Applications
-- Calculates the total number of applications.
SELECT COUNT(id) AS Total_Loan_Application 
FROM bank_loan_data;

-- 2.MTD Loan Applications
-- Calculates the total number of loan applications in December 2021. (MTD - Month to Date).
SELECT COUNT(id) AS MTD_Total_Loan_Application 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 3.PMTD Loan Applications
-- Calculates the total number of loan applications for the previous month (PMTD - Previous Month to Date).
SELECT COUNT(id) AS PMTD_Total_Loan_Application 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 4.MOM Loan Applications
-- Calculates the percentage change in total loan applications compared to the previous month.
SELECT
	(
     (SELECT COUNT(id) 
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
     (SELECT COUNT(id)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     ) * 100.0 /
     (SELECT COUNT(id)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     AS MOM_Percentage;

-- 5.Total Funded Amount
-- Calculates the total funded amount across all loan applications.
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank_loan_data;

-- 6.MTD Total Funded Amount
-- Calculates the Month-to-Date (MTD) total funded amount in December 2021.
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 7.PMTD Total Funded Amount
-- Calculates the total funded amount for the previous month (PMTD - Previous Month to Date).
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 8.MOM Loan Applications
-- Calculates the percentage change in total funded amount compared to the previous month.   
SELECT
	(
     (SELECT SUM(loan_amount)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
     (SELECT SUM(loan_amount)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     ) * 100.0 /
     (SELECT SUM(loan_amount)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     AS MOM_Percentage;
     
-- 9.Total Amount Received
-- Calculates the total amount collected from loan payments.
SELECT SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data;

-- 10.MTD Total Amount Received
-- Calculates the Month-to-Date (MTD) total amount collected from loan payments in December 2021.
SELECT SUM(total_payment) AS MTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 11.PMTD Total Amount Received
-- Calculates the Previous Month-to-Date (PMTD) total amount collected from loan payments.
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 12.MOM Total Amount Received
-- Calculates the percentage change in total amount received compared to the previous month.
SELECT
	(
     (SELECT SUM(total_payment)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
     (SELECT SUM(total_payment)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     ) * 100.0 /
     (SELECT SUM(total_payment)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     AS MOM_Percentage;

-- 13.Average Interest Rate
-- Calculates the average interest rate across all loan applications.
SELECT AVG(int_rate) * 100 AS Average_Interest_Rate
FROM bank_loan_data;

SELECT ROUND(AVG(int_rate) * 100, 4)  AS Average_Interest_Rate
FROM bank_loan_data;

-- 14.MTD Average Interest Rate
-- Calculates the Month-to-Date (MTD) average interest rate for loan applications in December 2021.
SELECT ROUND(AVG(int_rate) * 100, 4) AS MTD_Average_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 15.PMTD Average Interest Rate
-- Calculates the Previous Month-to-Date (PMTD) average interest rate for loan applications.
SELECT ROUND(AVG(int_rate) * 100, 4) AS MTD_Average_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 16.MOM Average Interest Rate
-- Calculates the percentage change in average interest rate compared to the previous month.     
SELECT
	(
     (SELECT ROUND(AVG(int_rate) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
     (SELECT ROUND(AVG(int_rate) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     ) * 100.0 /
     (SELECT ROUND(AVG(int_rate) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     AS MOM_Percentage;
     
-- 17.Average DTI
-- Calculates the average Debt-to-Income Ratio (DTI) across all loan applications.
SELECT ROUND(AVG(dti) * 100, 4) AS Average_DTI
FROM bank_loan_data;

-- 18.MTD Average DTI
-- Calculates the Month-to-Date (MTD) average Debt-to-Income Ratio (DTI) for loan applications in December 2021.
SELECT ROUND(AVG(dti) * 100, 4) AS MTD_Average_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 19.PMTD Average DTI
-- Calculates the Previous Month-to-Date (PMTD) average Debt-to-Income Ratio (DTI) for loan applications.
SELECT ROUND(AVG(dti) * 100, 4) AS PMTD_Average_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 20.MOM Average DTI
-- Calculates the percentage change in average Debt-to-Income Ratio (DTI) compared to the previous month.    
SELECT
	(
     (SELECT ROUND(AVG(dti) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021) -
     (SELECT ROUND(AVG(dti) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     ) * 100.0 /
     (SELECT ROUND(AVG(dti) * 100, 4)
     FROM bank_loan_data
     WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021)
     AS MOM_Percentage;
 
 
-- 2.GOOD LOAN ISSUED

-- 1.Good Loan Application Percentage
-- Calculates the percentage of loans that are 'Fully Paid' or 'Current'.  
SELECT
	(COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current')
		THEN id END) * 100) / COUNT(id)
       AS Good_Loan_Percentage
       FROM bank_loan_data;
       
-- 2.Good Loan Applications
-- Counts the number of loan applications that are classified as 'Fully Paid' or 'Current'
SELECT COUNT(id) As Good_Loan_Application 
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- 3.Good Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- 4.Good Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');


-- 3.BAD LOAN ISSUED

-- 1.Bad Loan Application Percentage
-- Calculates the percentage of loans that are 'Charged Off'.
SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off'
		THEN id END) * 100) / COUNT(id)
       AS Bad_Loan_Percentage
       FROM bank_loan_data;
       
-- 2.Bad Loan Applications
-- Counts the number of loan applications that are classified as 'Charged Off'
SELECT COUNT(id) As Bad_Loan_Application 
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- 3.Bad Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Charged Off'
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- 4.Bad Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Charged Off'
SELECT SUM(total_payment) AS Bad_Loan_Total_Received_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- 4.LOAN STATUS

/* 
1. Retrieves loan status statistics, including counts, total funded amount, 
   total amount received, average interest rate, and average Debt-to-Income Ratio (DTI).
*/
SELECT loan_status,
        COUNT(id) AS Total_Loan_Application,
        SUM(loan_amount) AS Total_Funded_Amount,
        SUM(total_payment) AS Total_Amount_Received,
        AVG(int_rate * 100) AS Average_Interest_Rate,
        AVG(dti * 100) AS Average_DTI
    FROM bank_loan_data
    GROUP BY loan_status;

/*
2. Retrieves Month-to-Date (MTD) loan status statistics for December 2021, 
   including total amount received and total funded amount.
   */
SELECT loan_status,
	SUM(loan_amount) AS MTD_Total_Funded_Amount,
	SUM(total_payment) AS MTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status;


-- BANK LOAN REPORT | OVERVIEW

/* 
1. MONTHLY OVERVIEW
   Monthly Trends by Issue Date 
   Retrieves monthly overview statistics, including the month number, month name, 
   total loan applications, total funded amount, and total amount received.
   */
SELECT 
	MONTH(issue_date) AS Month_number, 
	DATE_FORMAT(issue_date, '%M') AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATE_FORMAT(issue_date, '%M')
ORDER BY Month_number;

/*
2. STATEWISE OVERVIEW
   Regional Analysis by State
   Retrieves statewise overview statistics, including the state name, 
   total loan applications, total funded amount, and total amount received.
*/  
SELECT
	address_state AS State,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY State
ORDER BY State;

/*
3. LOAN TERM OVERVIEW
   Retrieves loan term overview statistics, including the term (duration), 
   total loan applications, total funded amount, and total amount received.
*/
SELECT
	term AS Loan_term,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;

/*
4. EMPLOYEE LENGTH OVERVIEW
   Retrieves employee length overview statistics, including the employee length, 
   total loan applications, total funded amount, and total amount received.
*/
SELECT
	emp_length AS Employee_Length,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

/*
5. PURPOSE OVERVIEW
   Retrieves purpose overview statistics, including the loan purpose, 
   total loan applications, total funded amount, and total amount received.
*/ 
SELECT
	purpose AS Loan_Purpose,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;

/*
6. HOME OWNERSHIP OVERVIEW
   Retrieves home ownership overview statistics, including the home ownership status, 
   total loan applications, total funded amount, and total amount received.
*/
SELECT
	home_ownership AS Home_Ownership,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY Home_Ownership
ORDER BY Home_Ownership;

/*
Retrieves total loan applications, total funded amount, and total amount received
categorized by a selected parameter (e.g., home ownership, purpose, or term),
Grade and state filters can be modified as needed.
*/
SELECT
	home_ownership AS Home_Ownership,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE GRADE = 'A' AND address_state = 'CA'
GROUP BY Home_Ownership
ORDER BY Home_Ownership;