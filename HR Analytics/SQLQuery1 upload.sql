
-- joining three tables
select a.*,
b.Reason,
c.comp_hr
from
Absenteeism_at_work as a
left join Reasons as b 
on a.Reason_for_absence = b.Number
left join compensation as c
on a.ID = c.ID;


--find the healthiest employee for the bonus 
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index <=25
and Absenteeism_time_in_hours < (select AVG(absenteeism_time_in_hours) from Absenteeism_at_work);


--calculating compensation rate increase for non smokers
--compensation rate is the amount of money the non-smokers will get on an hourly basis afetr the bonus has awarded
--the bonus amount is $983,221.
--employee worrks 8 hr per day, 5 days a week, 52 weeks in a year

select cast((983221.0/((select count(*) from Absenteeism_at_work where Social_smoker = 0) * (8 *5*52))) as float) 

--compensation rate increase = 69 cents per hour

--Creating the categorical fields for Body_mass_index and Month_of_absence.
select a.ID,
b.Reason,
a.Month_of_absence,
a.Body_mass_index,
case when a.Body_mass_index < 18.5 then 'underweight'
	 when a.Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	 when a.Body_mass_index between 25 and 30 then 'Over Weight'
	 when a.Body_mass_index > 30 then 'obese'
	 else 'Unknown' end as BMI_Category,
case when a.Month_of_absence in (12, 1, 2) then 'Winter'
	 when a.Month_of_absence in (3, 4, 5) then 'Spring'
	 when a.Month_of_absence in (6, 7, 8) then 'Summer'
	 when a.Month_of_absence in (9, 10, 11) then 'Fall'
	 else 'unknown' end as Seasons_names,
a.Seasons,
a.Day_of_the_week,
a.Transportation_expense,
a.Education,
a.Son,
a.Social_drinker,
a.Social_smoker,
a.Pet,
a.Disciplinary_failure,
a.Age,
a.Work_load_Average_day,
a.Absenteeism_time_in_hours
from
Absenteeism_at_work as a
left join Reasons as b 
on a.Reason_for_absence = b.Number
left join compensation as c
on a.ID = c.ID;