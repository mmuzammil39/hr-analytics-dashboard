-- HR ANALYTICS PROJECT
-- Dataset: IBM HR Analytics Employee Attrition
-- Database: hr_analytics
-- Table: employees
-- Total records expected: 1,470
--
-- How to use:
-- 1. Open this file in MySQL Workbench.
-- 2. Select the hr_analytics schema or run the USE statement below.
-- 3. You can execute the whole script, or run one query/view section at a time.
--
-- Note: The income groups in this combined script use the ranges from Step 36:
-- Low Income < 3000; Medium Income 3000-6000; High Income > 6000.

USE hr_analytics;

-- =========================================================
-- PART A: 19 SQL ANALYSIS QUERIES
-- =========================================================

-- QUERY 1: Overall employee attrition
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_Stayed,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees;

-- QUERY 2: Attrition by department
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 3: Attrition by overtime
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 4: Attrition by job role
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 5: Attrition by monthly income group
-- These boundaries match the income view created in Step 36.
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Income_Group
ORDER BY
    CASE Income_Group
        WHEN 'Low Income' THEN 1
        WHEN 'Medium Income' THEN 2
        ELSE 3
    END;

-- QUERY 6: Attrition by years at company
SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 years'
        WHEN YearsAtCompany BETWEEN 2 AND 5 THEN '2-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE 'More than 10 years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Tenure_Group
ORDER BY
    CASE Tenure_Group
        WHEN 'Less than 2 years' THEN 1
        WHEN '2-5 years' THEN 2
        WHEN '6-10 years' THEN 3
        ELSE 4
    END;

-- QUERY 7: Attrition by job satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- QUERY 8: Attrition by age group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN 'Under 25' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
        WHEN '45-54' THEN 4
        ELSE 5
    END;

-- QUERY 9: Attrition by business travel
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 10: Attrition by marital status
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY MaritalStatus
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 11: Attrition by job level
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;

-- QUERY 12: Attrition by work-life balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- QUERY 13: Attrition by gender
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Gender;

-- QUERY 14: Attrition by years since last promotion
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- QUERY 15: Attrition by total working years
SELECT
    CASE
        WHEN TotalWorkingYears < 5 THEN 'Less than 5 years'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 years'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 years'
        ELSE 'More than 20 years'
    END AS Experience_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Experience_Group
ORDER BY
    CASE Experience_Group
        WHEN 'Less than 5 years' THEN 1
        WHEN '5-10 years' THEN 2
        WHEN '11-20 years' THEN 3
        ELSE 4
    END;

-- QUERY 16: Attrition by job involvement
SELECT
    JobInvolvement,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobInvolvement
ORDER BY JobInvolvement;

-- QUERY 17: Attrition by education field
SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY EducationField
ORDER BY Attrition_Rate_Percent DESC;

-- QUERY 18: Job satisfaction and overtime together
SELECT
    JobSatisfaction,
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobSatisfaction, OverTime
ORDER BY JobSatisfaction, OverTime;

-- QUERY 19: Job roles ranked by number of employees who left
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobRole
ORDER BY Employees_Left DESC;

-- =========================================================
-- PART B: SUMMARY VIEWS FOR POWER BI (STEPS 21-37)
-- =========================================================

-- STEP 21: Overall attrition summary
CREATE OR REPLACE VIEW vw_hr_attrition_summary AS
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_Stayed,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees;

SELECT * FROM vw_hr_attrition_summary;

-- STEP 22: Department attrition
CREATE OR REPLACE VIEW vw_hr_department_attrition AS
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- STEP 23: Job role attrition
CREATE OR REPLACE VIEW vw_hr_jobrole_attrition AS
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;

-- STEP 24: Overtime attrition
CREATE OR REPLACE VIEW vw_hr_overtime_attrition AS
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- STEP 25: Age group attrition
CREATE OR REPLACE VIEW vw_hr_age_attrition AS
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Age_Group;

-- STEP 26: Marital status attrition
CREATE OR REPLACE VIEW vw_hr_marital_attrition AS
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY MaritalStatus;

-- STEP 27: Work-life balance attrition
CREATE OR REPLACE VIEW vw_hr_worklife_attrition AS
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- STEP 28: Job satisfaction attrition
CREATE OR REPLACE VIEW vw_hr_satisfaction_attrition AS
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- STEP 29: Education field attrition
CREATE OR REPLACE VIEW vw_hr_education_attrition AS
SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY EducationField
ORDER BY Attrition_Rate_Percent DESC;

-- STEP 30: Business travel attrition
CREATE OR REPLACE VIEW vw_hr_travel_attrition AS
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Percent DESC;

-- STEP 31: Job level attrition
CREATE OR REPLACE VIEW vw_hr_joblevel_attrition AS
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;

-- STEP 32: Total working experience attrition
CREATE OR REPLACE VIEW vw_hr_experience_attrition AS
SELECT
    CASE
        WHEN TotalWorkingYears < 5 THEN 'Less than 5 years'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 years'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 years'
        ELSE 'More than 20 years'
    END AS Experience_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Experience_Group
ORDER BY
    CASE Experience_Group
        WHEN 'Less than 5 years' THEN 1
        WHEN '5-10 years' THEN 2
        WHEN '11-20 years' THEN 3
        ELSE 4
    END;

-- STEP 33: Job involvement attrition
CREATE OR REPLACE VIEW vw_hr_involvement_attrition AS
SELECT
    JobInvolvement,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY JobInvolvement
ORDER BY JobInvolvement;

-- STEP 34: Gender attrition
CREATE OR REPLACE VIEW vw_hr_gender_attrition AS
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Gender;

-- STEP 35: Years since last promotion attrition
CREATE OR REPLACE VIEW vw_hr_promotion_attrition AS
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- STEP 36: Monthly income attrition
CREATE OR REPLACE VIEW vw_hr_income_attrition AS
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent
FROM employees
GROUP BY Income_Group
ORDER BY
    CASE Income_Group
        WHEN 'Low Income' THEN 1
        WHEN 'Medium Income' THEN 2
        ELSE 3
    END;

-- STEP 37: Dashboard KPI summary
CREATE OR REPLACE VIEW vw_hr_dashboard_summary AS
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Employees_Stayed,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS Attrition_Rate_Percent,
    ROUND(AVG(Age), 1) AS Average_Age,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income,
    ROUND(AVG(YearsAtCompany), 1) AS Average_Years_At_Company
FROM employees;

-- =========================================================
-- PART C: OPTIONAL CHECKS - RUN AFTER CREATING THE VIEWS
-- =========================================================
SELECT * FROM vw_hr_attrition_summary;
SELECT * FROM vw_hr_dashboard_summary;
SELECT * FROM vw_hr_department_attrition;
SELECT * FROM vw_hr_jobrole_attrition;
SELECT * FROM vw_hr_overtime_attrition;
SELECT * FROM vw_hr_age_attrition;
SELECT * FROM vw_hr_marital_attrition;
SELECT * FROM vw_hr_worklife_attrition;
SELECT * FROM vw_hr_satisfaction_attrition;
SELECT * FROM vw_hr_education_attrition;
SELECT * FROM vw_hr_travel_attrition;
SELECT * FROM vw_hr_joblevel_attrition;
SELECT * FROM vw_hr_experience_attrition;
SELECT * FROM vw_hr_involvement_attrition;
SELECT * FROM vw_hr_gender_attrition;
SELECT * FROM vw_hr_promotion_attrition;
SELECT * FROM vw_hr_income_attrition;
