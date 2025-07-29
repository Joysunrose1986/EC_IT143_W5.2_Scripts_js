/*****************************************************************************************************************
NAME:        EC_IT143_W5.2_Simpsons_js.sql
PURPOSE:     Answer-focused SQL script for analyzing financial and member data in the Planet_Express dataset.
             Covers tenure, spending patterns, transaction frequencies, and member-specific totals.

MODIFICATION LOG:
Ver      Date        Author                  Description
-----   ----------   ----------------------  -----------------------------------------------------------------------
1.0     07/30/2025   Joysunrose Saplaco      Initial version for BYU Pathway Deliverable 5.2
                                             Includes queries for tenure, debit amounts, monthly spending,
                                             and most common transaction descriptions.

RUNTIME:    ~0m 3s

NOTES:
- Uses fact table: Planet_Express
- Assumes related member data (tenure) is stored in a separate Members table
- Designed using the Answer-Focused Approach—clear, standalone queries for each question
- Script is organized with comments for readability and attribution

******************************************************************************************************************/

-- 1: Which member has the highest cumulative debit amount?
-- Author: Joysunrose C.Saplaco

SELECT Card_Member, SUM(Amount) AS TotalDebit
FROM Planet_Express
GROUP BY Card_Member
ORDER BY TotalDebit DESC;

-- 2: Which month had the highest total spending?
-- Author:Joysunrose C.Saplaco

SELECT FORMAT(Date, 'yyyy-MM') AS SpendingMonth, SUM(Amount) AS MonthlyTotal
FROM Planet_Express
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY MonthlyTotal DESC;

-- 3: Which transaction descriptions appear most often in the dataset?
-- Author: Joysunrose C.Saplaco

SELECT Description, COUNT(*) AS Frequency
FROM Planet_Express
GROUP BY Description
ORDER BY Frequency DESC;

-- 4: What is the total amount spent in a year including all card members?
-- Author: Baliseng Mazibuko

SELECT YEAR(Date) AS SpendingYear, SUM(Amount) AS TotalSpent
FROM Planet_Express
GROUP BY YEAR(Date)
ORDER BY SpendingYear;

