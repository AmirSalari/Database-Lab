Question 1
-------------------------------------------
select First_name,Last_name
from interview natural join Employees
where Employees.id in (
select interviewerID,count(*)
from interview
group by interviewerID
having count(*)>2
)
-------------------------------------------

Question 2
-------------------------------------------
select count(ApplicantID)
from Request natural join Interview
where  TIMEDIFF(NOW(),Interview_Time) < 30 and applicantID in(
select Applicant.id  
from Applicant natural jobs
where Applicant.ExpectedSalary > jobs.Salary
)
-------------------------------------------
Question 3
-------------------------------------------
select job_Name
from interview 
where job_Name in (
select job_Name,salary,avg(ExpectedSalary)
from Request natural join Interview
group by Request.job_Name,Interview.Salary
having avg(ExpectedSalary) > Interview.Salary
)
-------------------------------------------
Question 4
-------------------------------------------
select ApplicantID
from Request natural join Interview
where Education = M.S.C or Education = Dr and status = Reject  

Question 5
-------------------------------------------
select ApplicantID
from Request natural join Interview 
where TIMEDIFF( NOW() ,Request.Record Time) > 30
-------------------------------------------
 
Question 6
-------------------------------------------
delimiter//
CREATE PROCEDURE simpleproc (OUT param1 INT)
  BEGIN
  delete from Request where ApplicantID in( 
	select ApplicantID
	from Interview natural join Request
	where Education = other and Interview.status = Reject;)
	
	  delete from Interview where ApplicantID in( 
	select ApplicantID
	from Interview natural join Request
	where Education = other and Interview.status = Reject;)
	
  END//
delimiter ;
-------------------------------------------



Question 7
-------------------------------------------
delimiter//
CREATE PROCEDURE simpleproc (OUT param1 INT)
  BEGIN
	update  Interview set status=wait where ApplicantID in (
	select ApplicantID
	from interview 
	where status=Accept and job_Name in (
	select job_Name,salary,avg(ExpectedSalary)
	from Request natural join Interview
	group by Request.job_Name,Interview.Salary
	having avg(ExpectedSalary) < Request.ExpectedSalary
	)
	)
  END//
delimiter ;
-------------------------------------------