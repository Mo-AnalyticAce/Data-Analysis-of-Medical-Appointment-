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

##Tools Used
Microsoft Excel: Used for initial data exploration to understand the layout and structure of the healthcare dataset.

SQL (SSMS): Used for data cleaning and transformation, specifically using conditional logic to create patient age groups and extracting the day of the week from the appointment date column.

Power BI: Used for building the interactive dashboard, configuring filters to slice data, and visualizing healthcare insights.

DAX: Used for creating calculated measures to isolate completed, cancelled, and no-show appointments, and to calculate their respective percentage rates.

##Data Cleaning/Preparation
Created Patient Age Groups: Grouped raw patient ages into defined ranges (e.g., 0–18, 19–35, 36–50, 51–65, 66+) to enable clean demographic and distribution analysis.

Extracted Day of Week: Formatted the appointment date column to extract the literal day of the week (e.g., Monday, Tuesday) to track operational trends and peak hospital days.

##Data Modeling & DAX Measures
A star-schema relationship model was implemented in Power BI.
Relationships
Patients → Appointments
Doctors → Appointments
Treatments → Billing	Patients → Billing
This model enabled efficient filtering and cross-table analysis.

Calculated Appointment Volumetrics: Formulated distinct counting filters on the core dataset using the appointment status column to dynamically isolate and aggregate individual running totals for completed, cancelled, and no-show bookings.

Calculated Performance Rates: Combined the individual appointment status metrics into logical division operations against the grand total of scheduled bookings to continuously recalculate the real-time completion, cancellation, and no-show percentages.

##Dashboard Overview
The Healthcare Management Dashboard is a Business Intelligence solution designed to analyze hospital operations, patient appointments, doctor performance, treatment utilization, billing activities, and revenue generation. The project integrates data from multiple healthcare-related tables to provide actionable insights that support operational efficiency, patient management, and strategic decision-making.By tracking key metrics like appointment completion rates, cancellations, and no-shows, it allows stakeholders to quickly spot scheduling risks, identify peak operational days, and reduce revenue leaks from missed slots.  
##Key Insights

###Appointment Problems
Low Success Rate: Only about 23 out of every 100 appointments are actually finished.

High Missed Slots: Over half of the appointments are either cancelled (25.5%) or patients just do not show up (26%).

Exact Numbers: Out of 200 total appointments, 52 were no-shows, 51 were cancelled, 51 stayed scheduled, and only 46 were completed.

###Patient Information
More Men: Men make up most of the visits at 76%, while women make up only 24%.

Top Age Group: Young adults aged 19–35 visit the hospital the most. Older people aged 66 and above visit the least.

###Busiest Days
Peak Days: Tuesday is the busiest day of the week for the clinic, followed closely by Wednesday.

Slow Days: Appointment numbers drop quickly and hit the lowest point on Thursday.

 ###Treatments and Money
Top Treatment: Chemotherapy is the most common treatment and brings in the most money.

Other Major Treatments: MRI and X-Ray are the next biggest treatments for both use and cost.

How People Pay: Most patients prefer to pay with a Credit Card, followed by Insurance and Cash.

 ###Doctor Breakdown
Most Busy Doctors: Doctors D001 and D003 finished the highest number of appointments (6 each).

Highest Cancellations: Doctor D002 had the most cancelled appointments (8), followed by Doctor D001 (7)


