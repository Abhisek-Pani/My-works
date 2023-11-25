-- create a joint table 
Select * from AbsentATWork a
LEFT JOIN compensation b
on a.ID = b.ID
LEFT JOIN Reasons c
on a.Reason_for_absence = c.Number;

-- Find the Healthiest employees for the bonus .
Select * from AbsentATWork
where Social_drinker= 0 and Social_smoker=0 and Body_mass_index< 25 and
Absenteeism_time_in_hours < (Select AVG(Absenteeism_time_in_hours) from AbsentATWork)

--compensation rate increase for non-smokers 
Select COUNT(*) from AbsentATWork
where Social_smoker=0 

--optimise this query 
Select 
a.ID,
c.Reason,
Body_mass_index,
CASE WHEN Body_mass_index < 18 then 'Underweight'
     WHEN Body_mass_index between 18 and 30 then 'Healthy'
	 WHEN Body_mass_index >30 then 'Obese'
	 ELSE 'Unknown' END AS BMI_CATEGORY,
Month_of_absence,
CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
     WHEN Month_of_absence IN (3,4,5) THEN 'spring'
	 WHEN Month_of_absence IN (6,7,8) THEN 'summer'
	 WHEN Month_of_absence IN (9,10,11) THEN 'Rainy'
	 ELSE 'uNKNOWN' END AS Season_Names,
Transportation_expense,
Day_of_the_week,
Absenteeism_time_in_hours,
Education,
Son,
Social_drinker,
Social_smoker,
Age,
Work_load_Average_day
From AbsentATWork a
LEFT JOIN compensation b
on a.ID = b.ID
LEFT JOIN Reasons c
on a.Reason_for_absence = c.Number;