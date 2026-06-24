 CREATE DATABASE Hospital_Management;
 USE Hospital_Management;

 --What is the distribution of appointment status?

 SELECT status,
 COUNT(*) AS total_appointments
 FROM appointments
 GROUP BY status;

--What is the overall appointment completion vs cancellation rate?

SELECT status,
COUNT(*) AS appointments_rate
FROM appointments
WHERE status IN ('completed' , 'cancelled')
GROUP BY status;

]
SELECT status,
COUNT(*) AS appointments_rate
FROM appointments
WHERE status IN ('completed' , 'no-show')
GROUP BY status;




--Which days have the highest appointment activity?

SELECT DATENAME(WEEKDAY, appointment_date)
AS DAYOFWEEK,
COUNT (*) AS busiest_day
FROM appointments
GROUP BY DATENAME(WEEKDAY, appointment_date)
ORDER BY busiest_day DESC;




--PATIENT ANALYSIS
SELECT *
FROM patients;
--How many patients are registered?

SELECT COUNT(patient_id)
FROM patients;


--Which gender has the highest appointment attendance?


SELECT patients.gender,
COUNT(appointments.appointment_id) AS total_attended
FROM patients
INNER JOIN 
appointments ON 
patients.patient_id = appointments.patient_id
WHERE appointments.status = 'completed'
GROUP BY patients.gender
ORDER BY total_attended DESC; 

--Which age group has the highest hospital visits?

	SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 0 AND 18 THEN '0-18 (Children/Teens)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 19 AND 35 THEN '19-35 (Young Adults)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 36 AND 50 THEN '36-50 (Middle Aged)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 51 AND 65 THEN '51-65 (Older Adults)'
        ELSE '66+ (Aged)'
    END AS age_group,
    COUNT(appointments.appointment_id) AS total_visits
	FROM 
    appointments
	INNER JOIN 
    patients ON appointments.patient_id = patients.patient_id
	WHERE appointments.status = 'Completed'
	GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 0 AND 18 THEN '0-18 (Children/Teens)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 19 AND 35 THEN '19-35 (Young Adults)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 36 AND 50 THEN '36-50 (Middle Aged)'
        WHEN DATEDIFF(YEAR, patients.date_of_birth, GETDATE()) BETWEEN 51 AND 65 THEN '51-65 (Older Adults)'
        ELSE '66+ (Aged)'
		END
	ORDER BY 
    total_visits DESC;

		--DOCTOR PERFORMANCE ANALYSIS
		----Which doctor handles the most appointments?

		SELECT TOP 5 
		doctors.doctor_id,doctors.first_name,doctors.last_name, doctors.specialization,
		COUNT(appointments.appointment_id) AS total_appointments
		FROM doctors
		INNER JOIN appointments on
		doctors.doctor_id=appointments.doctor_id
		GROUP BY doctors.doctor_id, doctors.first_name, doctors.last_name, doctors.specialization
		ORDER BY total_appointments DESC;

		--Which doctor has the highest cancellation rate?

		SELECT TOP 3
		doctors.doctor_id,doctors.first_name,doctors.last_name, doctors.specialization,
		COUNT(appointments.status) AS total_cancellation
		FROM doctors
		INNER JOIN appointments ON
		doctors.doctor_id=appointments.doctor_id
		WHERE appointments.status = 'cancelled'
		GROUP BY doctors.doctor_id,doctors.first_name,doctors.last_name, doctors.specialization
		ORDER BY total_cancellation DESC;

		--Average workload per doctor?

		SELECT doctors.doctor_id,doctors.first_name,doctors.last_name, doctors.specialization,
		COUNT(appointments.appointment_id) AS doctor_total_appointments,
		AVG(COUNT(appointments.appointment_id)* 1.0) OVER() AS average_workload
		FROM doctors
		INNER JOIN appointments ON
		doctors.doctor_id=appointments.doctor_id
		WHERE appointments.status = 'completed'
		GROUP BY doctors.doctor_id,doctors.first_name,doctors.last_name, doctors.specialization
		ORDER BY average_workload DESC;

		--TREATMENT ANALYSIS
		SELECT * FROM treatments;
		--What are the most common treatments?

		SELECT 
			treatments.treatment_type,
			COUNT(treatments.treatment_type) AS frequent_treatments
		FROM treatments
		INNER JOIN appointments ON
			treatments.appointment_id=appointments.appointment_id
		WHERE appointments.status = 'completed'
			AND treatments.treatment_id is NOT NULL
		GROUP BY treatments.treatment_type
		ORDER BY frequent_treatments DESC;
		

	--Which treatments are linked to highest cost?		

	SELECT treatments.treatment_type,
	SUM(billing.amount) AS highest_bill
	FROM billing
	INNER JOIN treatments ON
	billing.treatment_id =treatments.treatment_id
	INNER JOIN appointments ON
	treatments.appointment_id=appointments.appointment_id
	WHERE appointments.status = 'completed'
	GROUP BY treatments.treatment_type
	ORDER BY highest_bill DESC;

	--BILLING / REVENUE ANALYSIS
	--What is total hospital revenue?

SELECT
SUM(billing.amount) AS total_revenue
FROM billing
INNER JOIN treatments ON
billing.treatment_id=treatments.treatment_id
INNER JOIN appointments ON
treatments.appointment_id=appointments.appointment_id
	WHERE appointments.status = 'completed'
	AND payment_status = 'paid';


	--What is the distribution of payment methods
	SELECT payment_method,
 COUNT(*) AS total_payment_method
 FROM billing
 GROUP BY payment_method
 ORDER BY total_payment_method;


	--What is the revenue generated by treatment type
SELECT treatments.treatment_type,
SUM(billing.amount) AS total_revenue_by_treatment
FROM billing
INNER JOIN treatments ON
billing.treatment_id=treatments.treatment_id
INNER JOIN appointments ON
treatments.appointment_id=appointments.appointment_id
	WHERE appointments.status = 'completed'
	AND payment_status = 'paid'
	GROUP BY treatments.treatment_type
	ORDER BY total_revenue_by_treatment;

--What is average treatment cost per patient?

SELECT treatments.treatment_type,
AVG(billing.amount)  AS average_cost_per_patient
FROM billing
INNER JOIN treatments ON
billing.treatment_id=treatments.treatment_id
INNER JOIN appointments ON
treatments.appointment_id=appointments.appointment_id
WHERE appointments.status = 'completed'
	AND payment_status = 'paid'
	GROUP BY treatments.treatment_type
	ORDER BY average_cost_per_patient;




