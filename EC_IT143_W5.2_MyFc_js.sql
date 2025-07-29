/*****************************************************************************************************************
NAME:  EC_IT143_W5.2_MyFC_js.sql
PURPOSE:     This script compares average monthly salaries between Goalkeepers and Forwards using MyFC dataset.
             It demonstrates multi-table joins across fact and dimension tables to extract meaningful business insights.

MODIFICATION LOG:
Ver      Date        Author                  Description
-----   ----------   ----------------------   -------------------------------------------------------------
1.0     07/30/2025   Joysunrose Saplaco      1. Built for BYU Pathway IT Project - Position Salary Comparison
                                              2. Uses tblPlayerFact, tblPlayerDim, tblPositionDim
                                              3. Filters and groups by position label (Goalkeeper, Forward)

RUNTIME:     ~0m 2s

NOTES:
- This script joins player fact data to position labels via dimension tables
- Filters for specific roles (Goalkeeper and Forward) and calculates average salary
- Ready for peer sharing and future extensions across other roles or teams

******************************************************************************************************************/


-- 1: Which positions have the largest target allocation, and why?
-- Author: Joysunrose C. Saplaco

SELECT p_id, COUNT(*) AS PlayerCount
FROM tblPositionDim
GROUP BY p_id
ORDER BY PlayerCount DESC;


-- 2: Which team has the highest number of registered players?
-- Author: Joysunrose C.Saplaco

SELECT t_id, COUNT(*) AS RegisteredPlayers
FROM tblPlayerDim
GROUP BY t_id
ORDER BY RegisteredPlayers DESC;


-- 3: What’s the average monthly salary for all players as of January 31, 2019?
-- Author: Joysunrose C.Saplaco

SELECT AVG(mtd_salary) AS AvgSalary_Jan2019
FROM tblPlayerFact
WHERE as_of_date = '2019-01-31';

-- 4: What is the average salary of Goalkeepers vs Forwards in MyFC?
-- Author: Auburn Lewis(from Baliseng Mazibuko's post)

SELECT 
    Pos.p_name AS position,
    COUNT(*) AS player_count,
    AVG(F.mtd_salary) AS avg_salary
FROM 
    tblPlayerFact AS F
JOIN 
    tblPlayerDim AS D ON F.pl_id = D.pl_id
JOIN 
    tblPositionDim AS Pos ON D.p_id = Pos.p_id
WHERE 
    Pos.p_name IN ('Goalkeeper', 'Forward')
GROUP BY 
    Pos.p_name
ORDER BY 
    avg_salary DESC;



















