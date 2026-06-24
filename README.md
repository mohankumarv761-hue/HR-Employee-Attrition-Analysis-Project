# HR Employee Attrition Analysis Project
End to End HR Employee Attrition Analysis using MYSQL, Python ,Power BI and Jira

## Project Overview

This project analyzes the "Atlas Lab HR Analytics dataset" to uncover why employees leave, who is most at risk, what factors(salary, overtime, manager quality, tenure, and training) drive attrition and which department has the most attrition rate.

The project covers the complete data analytics workflow: data cleaning → SQL analysis → Python EDA → Power BI dashboard and managed end-to-end pipeline using Jira for agile project tracking.


## Business Problem Solved

- What is the overall attrition rate and how is it distributed across departments.
- Does overtime significantly increase the probability of an employee leaving
- How do manager ratings and training opportunities affect attrition
- Which tenure band carries the highest attrition risk
- Do salary levels and commute distance influence attrition behavior
- Does overtime affects the employees worklife balance


## Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| **Database** | MySQL (Workbench) | Data storage, cleaning, and analysis |
| **Language** | Python 3 | Exploratory Data Analysis (EDA) |
| **Libraries** | Pandas, Matplotlib, Seaborn | Data manipulation and visualization |
| **BI Tool** | Power BI Desktop | Interactive dashboard and reporting |
| **Notebook** | Jupyter Notebook | For coding Python(Pandas,matplotlib,Seaborn) Scripts |
| **Project Management** | Jira (Kanban Board) | Agile task tracking across all phases |


##  Project Workflow

- ### Phase 1 — SQL Data Cleaning (`data_cleaning.sql`)

    **Goal:** Transform raw imported data into a clean, analysis-ready schema.


- ### Phase 2 — SQL Analysis (`sql_analysis.sql`)

    **Goal:** Answer core business questions using analytical SQL.

- ### Phase 3 — Python EDA (`python_analysis.ipynb`)

    **Goal:** Perform exploratory data analysis on two demographic dimensions not easily handled in SQL alone.

- ### Phase 4 — Power BI Dashboard (`powerbi_dashboard.pbix`)

    **Goal:** 3 interactive dashboard pages built for Attrition Analysis.

| Page | Key Visuals | Key Insight |
|---|---|---|
| **Executive Summary** | KPI cards, horizontal bar chart (job roles), donut chart, overtime bar chart | 16.12% attrition; Sales Reps highest risk (39.76%); overtime employees 3× more likely to leave |
| **Attrition by Ratings** | Combo bar+line (manager rating), donut (training opportunities) | Rating 2 drives 21.25% attrition; 0 training = 38.82% attrition |
| **Attrition by Tenure** | Dual-axis chart (employee count + attrition rate by tenure), bar chart (manager tenure) | 0–1yr = 32–34% attrition; new managers (<1yr) → 27%; stabilises post-7 years |

**Dashboard Features:**
- Department slicer (Human Resources / Sales / Technology)
- KPI cards: Total Employees, Active Employees, Attrition Rate, Average Salary, Average WorkLife Balance rating, Average Since lastPromotion(in years), Average Manager Rating, Average JobSatisfaction
- Cross-page filtering for drill-down analysis


##  Dashboard Screenshots

### Executive Summary
<img width="811" height="491" alt="Executive Summary" src="https://github.com/user-attachments/assets/c48e6d9e-3fb6-439e-a6ba-ceeea7edf700" />


### Attrition by Ratings
<img width="815" height="506" alt="Attrition by Ratings" src="https://github.com/user-attachments/assets/7ba78ded-35f2-4764-b304-db20db0ea089" />


### Attrition by Tenure
<img width="792" height="503" alt="Attrition by tenure" src="https://github.com/user-attachments/assets/92768b9f-b8a6-4cbf-8206-0705bf874a21" />


##  Project Management — Jira Board

This project was managed using a **Jira Kanban board** with 11 tasks tracked across 3 sprints:

<img width="1333" height="593" alt="Jira Project Management" src="https://github.com/user-attachments/assets/e1a0e066-6c2c-4e95-be87-f93fde8490ae" />
