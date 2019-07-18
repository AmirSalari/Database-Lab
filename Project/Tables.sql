create table 
Employees ( ID char(5),
 First_name varchar(20) not null,
 Last_name varchar(20),
 YearStart  int,
 primary key (ID)
 )

create table 
interview ( interviewID int,
 StartTime  DATETIME,
 EndTime  DATETIME,
 Status  int,
 Interviewer varchar(20),    
 primary key (interviewID)
 foreign key (Interviewer) references Employees)
 )
 
create table 
jobs ( job_name char(10),
 Salary  int,
 EndTime  DATETIME,
 hoursWeek  int,
 Manager    varchar(20),   
 MinEducation varchar(20),
 primary key (job_name)
 foreign key (Manager) references Employees)
 )
 
 create table 
Requst ( ReqID int,
 ApplicantID   int,
 Education  varchar(20),
 Expected_Salary  int,
 Record_Time    DATETIME,   
 Status varchar(5),
 primary key (ReqID)
 foreign key (ApplicantID) references Applicant )
 )
 
  create table 
Applicant ( ApplicantID int,
 Name   varchar(20),
 Age    int,
 Education  varchar(20),
 ExpectedSalary  int,   
 ExpectedJob varchar(5),
 primary key (ApplicantID)
 )