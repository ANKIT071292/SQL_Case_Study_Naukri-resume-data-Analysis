select * from portal 

select * from user_registration order by registration_datetime desc

select * from resume_doc 

--Q1 --> what is the count of registartions every month on the 'Resume Now' protal for 2024.

--select format(registration_datetime,'MMM') as month, count(*) as ttl_count from portal p
--left join user_registration u on p.portal_id = u.portal_id
--where portal_name = 'Resume Now' and year(registration_datetime) = 2024
--group by format(registration_datetime,'MMM')


--Q --> 2 which portal has the highest subscription rate in last 30 days.
--subscription rate = total sunscription/total registrations

--with cte as (
--select portal_name,
--count(*) as ttl_registration,
--sum(case when subscription_flag = 'Y' then 1 else 0 end ) as ttl_subs
--from portal p
--inner join user_registration u on p.portal_id = u.portal_id
--where registration_datetime >= dateadd(day,-30,'2025-01-15')
--group by portal_name)
--select portal_name,	
--ttl_subs*100.0/ttl_registration
--from cte


--Q--> 3 How many registered users create less than 3 resumes.

--select u.user_id,count(r.resume_id) from user_registration u
--left join resume_doc r on u.user_id = r.user_id
--group by u.user_id
--having count(r.resume_id) <3

--Q--> 4 create a list of users who subscribed in 2024 on the "Zety" portal and get the experience_years on their first resume
--with cte as (
--select  u.user_id, r.experience_years,r.date_created,
--ROW_NUMBER () over (partition by u.user_id order by r.date_created) as rnk
--from portal p
--inner join user_registration u on p.portal_id = u.portal_id
--inner join  resume_doc r on r.user_id = u.user_id
--where portal_name = 'Zety' and year(subscription_datetime) = 2024 
--)
--select user_id,
--experience_years from cte
--where rnk = 1
--and experience_years >0
