CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

insert into job_applied (
    job_id, application_sent_date,
     custom_resume, resume_file_name, 
     cover_letter_sent, cover_letter_file_name, 
     status)
values 
(1, '2023-10-01', true, 'resume_software_engineer.pdf', true, 'cover_letter_software_engineer.pdf', 'Applied'),
(2, '2023-10-03', false, 'generic_resume.pdf', false, NULL, 'Applied'),
(3, '2023-10-05', true, 'resume_data_scientist.pdf', true, 'cover_letter_data_scientist.pdf', 'Interview Scheduled'),
(4, '2023-10-07', false, 'generic_resume.pdf', false, NULL, 'Rejected'),
(5, '2023-10-09', true, 'resume_product_manager.pdf', true, 'cover_letter_product_manager.pdf', 'Offer Received');

SELECT * FROM job_applied;

alter TABLE job_applied
ADD COLUMN contact varchar(50);

update job_applied
SET contact = 'Vishal'
where job_id = 1;

update job_applied
SET contact = 'Shaun'
where job_id = 2;

update job_applied
SET contact = 'Marika'
where job_id = 3;

update job_applied
SET contact = 'Scott'
where job_id = 4;

update job_applied
SET contact = 'Victor'
where job_id = 5;

ALTER TABLE job_applied
alter COLUMN contact type text;

alter TABLE job_applied
rename contact to contact_person;

Drop TABLE job_applied;



