
SELECT *
FROM FirstSqlProject..StudentsMentalHealthProject


-- What is the difference in stress, depression, and anxiety scores between male and female students?

SELECT 
    Gender,
    COUNT(*) AS Count,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
     FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Gender


-- What is the difference in stress, depression, and anxiety levels across different academic courses?

SELECT 
    Course,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Course
ORDER BY 
    AverageStress DESC


-- What is the difference in stress, depression, and anxiety scores between students that stay on campus and those that stay off campus?

SELECT 
    Residence_Type,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Residence_Type
ORDER BY 
    AverageStress DESC


-- What is the CGPA of students with high semester workload?

SELECT 
   CGPA,
   AVG(Semester_Credit_Load) AS AverageCreditLoad
FROM 
   FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
	CGPA
HAVING 
   AVG(Semester_Credit_Load) >= 25
ORDER BY
	AverageCreditLoad
	

-- What is the relationship between CGPA and stress, depression, and anxiety levels?

SELECT 
   CASE 
      WHEN CGPA BETWEEN 0 AND 2.0 THEN 'Low CGPA'
      WHEN CGPA BETWEEN 2.1 AND 3.5 THEN 'Medium CGPA'
      ELSE 'High CGPA'
   END AS CGPACategory,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
   FirstSqlProject..StudentsMentalHealthProject
GROUP BY
	CASE 
      WHEN CGPA BETWEEN 0 AND 2.0 THEN 'Low CGPA'
      WHEN CGPA BETWEEN 2.1 AND 3.5 THEN 'Medium CGPA'
      ELSE 'High CGPA'
   END
ORDER BY
	CGPACategory


-- How many students experience high financial stress and what is the average CGPA of these students?

SELECT 
    COUNT(*) AS NumberofStudents,
    AVG(CGPA) AS AverageCGPA
FROM 
    FirstSqlProject..StudentsMentalHealthProject
WHERE 
    Financial_Stress >= 4


-- How many students have a CGPA of 3.5 and above, what's their extracurricular involvement and mental health scores?

SELECT 
	COUNT(*) AS CGPACount,
	Extracurricular_Involvement,
	AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
	FirstSqlProject..StudentsMentalHealthProject
WHERE
	CGPA >= 3.5
GROUP BY 
    Extracurricular_Involvement
ORDER BY
	CGPACount DESC


-- Are students involved in extracurricular activities more or less stressed?

SELECT 
   Extracurricular_Involvement,
   AVG(Stress_Level) AS AverageStress
FROM 
   FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
   Extracurricular_Involvement


-- How common is substance use among these students and how does it link to their stress, depression, and anxiety scores?

SELECT 
   Substance_Use,
   COUNT(*) AS CountofSubstanceUse,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
   FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
   Substance_Use
ORDER BY
	CountofSubstanceUse


-- What effect does social support have on students' stress, depression, and anxiety scores?

SELECT 
    Social_Support,
    COUNT(*) AS CountofSocialSupport,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Social_Support
ORDER BY
	CountofSocialSupport


-- How many students are experiencing high stress and what is the average anxiety score for these students?

SELECT 
   SUM(CASE WHEN Stress_Level >= 4 THEN 1 ELSE 0 END) AS Total_High_Stress,
   AVG(Anxiety_Score) AS AverageAnxiety
FROM 
   FirstSqlProject..StudentsMentalHealthProject
WHERE 
   Stress_Level >= 4


--  How does diet quality relate with stress, depression, and anxiety?

SELECT 
   Diet_Quality,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
      FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
   Diet_Quality


-- How many students experience poor sleep and high depression?

SELECT 
   COUNT(*) AS CountofPoorSleepHighDepression
FROM 
   FirstSqlProject..StudentsMentalHealthProject
WHERE 
   Sleep_Quality = 'Low' AND Depression_Score >= 4


-- Which relationship status is more likely to use counseling services?

SELECT 
    Relationship_Status, 
    COUNT(Counseling_Service_Use) AS CountofCounseling
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Relationship_Status
ORDER BY
	CountofCounseling DESC
	
	
-- What is the difference in stress, depression, and anxiety scores by relationship status?

SELECT 
    Relationship_Status,
    AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Relationship_Status
ORDER BY 
    AverageStress DESC


-- How does family history of mental illness impact students' stress, anxiety, and depression scores?

SELECT 
    CASE 
      WHEN Family_History = 1 THEN 'Yes'
      ELSE 'No'
   END AS FamilyHistory,
	AVG(Stress_Level) AS AverageStress,
    AVG(Depression_Score) AS AverageDepression,
    AVG(Anxiety_Score) AS AverageAnxiety
FROM 
    FirstSqlProject..StudentsMentalHealthProject
GROUP BY 
    Family_History


-- Are students with chronic illnesses or a family history of mental health issues more likely to use counseling services?

SELECT 
   CASE 
      WHEN Family_History = 1 THEN 'Yes'
      ELSE 'No'
   END AS FamilyHistory,
   
   CASE 
      WHEN Chronic_Illness = 1 THEN 'Yes'
      ELSE 'No'
   END AS ChronicIllness,
    COUNT(Counseling_Service_Use) AS CountofCounselingServices
FROM 
    FirstSqlProject..StudentsMentalHealthProject
WHERE 
    Counseling_Service_Use = 'Frequently' 
GROUP BY 
	Family_History, Chronic_Illness
ORDER BY
	CountofCounselingServices DESC
