# Data-Analysis-of-Medical-Appointment-
SQL-based operational and financial analysis of hospital patient data, featuring multi-table joins, age-demographic bucketing, and treatment revenue tracking

##Project Overview
The Healthcare Management Dashboard is a Business Intelligence solution designed to analyze hospital operations, patient appointments, doctor performance, treatment utilization, billing activities, and revenue generation.
The project integrates data from multiple healthcare-related tables to provide actionable insights that support operational efficiency, patient management, and strategic decision-making.
The dashboard was developed using SQL Server for data preparation and business analysis, while Power BI was used for data modeling, visualization, and KPI tracking.

##Business Problem
Healthcare facilities manage large volumes of patient appointments, treatments, billing transactions, and doctor activities. Without a centralized reporting system, it becomes difficult to:
Monitor appointment attendance.
Track doctor performance.
Analyze treatment popularity.
Evaluate revenue generation.
Identify no-show and cancellation patterns.
Optimize hospital operations.
This project addresses these challenges by creating an interactive dashboard that consolidates operational data into meaningful insights.

##Project Objectives
The dashboard aims to:
Monitor appointment performance.
Analyze patient demographics.
Track treatment demand.
Evaluate doctor effectiveness.
Measure hospital revenue.
Identify appointment trends and peak periods.
Understand payment preferences.

##Dataset Description

The project utilizes five relational tables:

Patients Table
Fields include:

Patient ID
Gender
Age
Contact Information

Appointments Table
Contains appointment scheduling and attendance records.

Fields include:

Appointment ID
Patient ID
Doctor ID
Appointment Date
Appointment Status
Doctors Table

Contains doctor information.

Fields include:

Doctor ID
Doctor Name
Specialization
Treatments Table

Contains treatment details.

Fields include:

Treatment ID
Treatment Name
Cost
Billing Table

Contains financial transaction records.

Fields include:

Billing ID
Patient ID
Treatment ID
Payment Method
Revenue Amount
Data Preparation
SQL Data Cleaning

Several SQL transformations were performed before loading the data into Power BI.

Derived Columns
Age Group

##Data Cleaning/Preparation
Created Patient Age Groups: Grouped raw patient ages into defined ranges (e.g., 0–18, 19–35, 36–50, 51–65, 66+) to enable clean demographic and distribution analysis.

Extracted Day of Week: Formatted the appointment date column to extract the literal day of the week (e.g., Monday, Tuesday) to track operational trends and peak hospital days.

Patients were grouped into meaningful categories:
