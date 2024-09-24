# Students-Mental-Health-Analysis

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Project Goals and Objectives](#project-goals-and-objectives)
- [Tools Used](#tools-used)
- [Data Analysis](#data-analysis)
- [Findings](#findings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)


## Project Overview

This project focused on analyzing the mental health of students based on various factors such as stress, anxiety, depression, academic workload, etc. The main goal is to gain valuable 
insights that can be essential to understanding the various patterns of mental health issues among these students, and also explore how different areas of a student's life , such as 
their CGPA, involvement in extracurricular activities, and financial stress, affect their mental well-being. The findings from this analysis provide valuable recommendations that 
help to improve students' mental health and overall wellbeing.

### Data Sources

The dataset used in this project comes from a Student Mental Health Survey gotten from Kaggle, capturing various mental health factors such as stress levels, anxiety scores, depression 
scores, and lifestyle factors like sleep quality, physical activity, and social support. The dataset also includes demographic and academic-related variables like CGPA, course, and 
semester credit load. 

### Project Goals and Objectives

The primary goal of this project is to analyze the mental health of students to identify trends and relationships between academic performance, lifestyle factors, and mental well-being.
However, the specific objectives include;

- Mental Health Trend Analysis: This is to understand patterns of stress, anxiety, and depression among the students.
- Health and Lifestyle Relationships: This is to examine the effect of sleep quality and social support on mental health of the students.
- Impact of Academic Load and Financial Stress: This is to explore how academic workload and financial concerns affect students’ mental well-being.
- Family and Chronic Illness Impact: This is to understand how family history and chronic illness contribute to mental health.

### Tools Used

- Microsoft Excel: Data cleaning, formatting, and initial exploration of the dataset.
- SQL Server Management Studio (SSMS): Querying the data and performing analysis on the student mental health dataset.
- Tableau: Data visualization, helping to visually interpret the relationships and trends discovered through the analysis.

### Data Analysis

The analysis focused on answering important questions related to students' mental health. A few of the main queries included:

- How does diet quality relate with stress, depression, and anxiety?
- How do students with high extracurricular involvement compare in terms of mental health to those who do not participate?
- Are students with chronic illnesses or a family history of mental health issues more likely to use counseling services?
- How many students experience high financial stress and what is the average CGPA of these students?
- How common is substance use among these students and how does it link to their stress, depression, and anxiety scores?

```SQL
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
```

### Findings

I came up with the some findings after analysis and a few of these findings include;

- Both male and female students experience similar levels of stress, depression, and anxiety. This demonstrates that gender may have little impact on the overall mental health scores
  of students.
  
- Medical students experience the highest stress levels, law students experience the highest anxiety while computer science students experience the highest depression. This shows
  that mental health issues vary significantly across academic courses, with some students (e.g., medical, law, and computer science) who face the most difficulties.

- Students who have workload of more than 25 credit happen to have CGPAs below 3.0. This demonstrates that high academic loads may have a negative impact on students' academic performance which signifies the potential challenge students face when balancing heavier course loads with maintaining strong academic performance.

- Students with moderate involvement in extracurricular activities experience lower stress than those with high or low involvement which may mean that a balanced involvement in
  extracurricular activities may contribute to better management of stress among students.

- Students with a family history of mental illness report higher stress levels, however their depression and anxiety scores are kind of similar to others and this suggest that family
  history contributes to increased stress but does not exactly affect other mental health issues.


### Recommendations

Based on my findings, I have the following recommendations;

- Universities should consider offering academic counseling conferences and time-management sessions to help students manage overwhelming academic pressure without compromising and altering their mental health.

- Universities should bring about opportunities for students to engage in mentorship programs, or mental health communities as these things can provide the
  emotional support students need, particularly during stressful times.

- Universities should provide additional scholarships or grants for students facing financial difficulties which can help reduce the burden of financial stress, which in turn could curb
  anxiety and depression that these students usually experience.

- Universities should promote extracurricular activities as a way to help students balance their academic responsibilities with personal interests, ensuring that these activities contribute
  to their mental and overall well-being.

- Universities could work on offering lighter workload adjustments for students during specific intense school periods, like mid semester tests, exams, etc.to help them effectively manage their courseworks better.

### Limitations

Considering this is my first personal SQL project, I experienced a lot of frustrations from getting frequent query errors from answering specific data questions that fit my data 
objectives. It took constant trials and errors, resilience and fighting spirit. I expected that it wouldn't be a smooth work process considering it's a first but not as challenging
as it was. However, I am grateful for the challenges as it served as a great learning opportunity for me and as I have also been able to gain valuable insights and also understand a 
lot of things from working with SQL which is forever stuck with me.
