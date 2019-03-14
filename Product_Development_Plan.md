## QA from Zack:

Can I assume a Rails app? 
Yes 
 
How many developers are dedicated to this project?
Just one on this feature, and you can assume that other developers are working on separate enough features that merge conflicts shouldn't add extra time.  

Are we bootstrapping the frontend or using a similar framework to reduce FE work and keep styling consistent?
Yes, assume the frontend will be built using an existing component library that includes fonts, styling, and basic components like buttons and dropdowns. 

How much time will we have for manual user testing of the product before we are dependent on the product for business need? 
Up to you. How much will we need? 

How many employees/admins will be using this product?
Assume we have an existing base of admins on the order of 10 - 100 and that an average job would receive approximately 100 applications. 

Do we need to set up an SMTP server for emailing or are we using ActionMailer?
We can assume that an existing email integration has been built using a third party like SendGrid or Mailchimp. 

Where and how is this app currently deployed? Heroku, AWS? 
Yes, deployed using Heroku, hosted on AWS. 

How many applicants do we expect for each job?
Approximately 0 - 100, maybe more in edge cases 

I'm assuming we have an applicant model and table in the DB already with the fields we need to sort by. Is this correct?
Assume that the model exists for jobs and admins, but that candidates/applicants are a new concept for this scope. 

Do we have automation tests for any parts of the app yet? This is necessary to cut down risk of bugs in its current form impeding more feature stories.
Yes, assume that the existing app has solid test coverage. Tests related to new features will need to be newly written as needed. 

## QA Zack Part 2:
Would we want to implement this story with one deploy or could we deploy each step of the acceptance criteria as we had it?
I'd like to hear your thoughts. If there is a smaller component of the story that you think would provide meaningful user value, feel free to plan to release in stages.

How long do deployments generally take?
About an hour

Do we have a CI/CD cycle set up? 
Yes



## Mockup
● https://projects.invisionapp.com/share/CPQW7D4EYQ6#/screens/350963640


## Acceptance Criteria

1. Assume that the basic infrastructure of the application already exists including a
public-facing site that enables job seekers to submit applications.

2. When an admin user logs into HobNobJobs and navigates to My Jobs, show a list of job
openings assigned to the admin.
* Create one to many relationship in table Admin(has_many jobs) to Job(belongs_to admin)
  * Conservative estimate: 30 minutes
  * Stretch estimate: 15 minutes
* Test the relationship
  * Conservative estimate: 30 minutes
  * Stretch estimate: 15 minutes
* Create route, controller action (index of Admin or Dashboard Controller depending on precedent), and view for My Jobs page
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test all of these
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test regular users cannot access this view/route and get 404 but admin users can access this view
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes

3. When the admin selects a job opening from the list, show a list of applicants to that
particular job.
* Create Applicant Model and Table
  * Conservative estimate: 15 minutes
  * Stretch estimate: 8 minutes
* Validate specific fields and test model, status in particular needs to default to undecided
  * Conservative estimate: 30 minutes
  * Stretch estimate: 15 minutes
* Test Model/Table
  * Conservative estimate: 30 minutes
  * Stretch estimate: 15 minutes
* Create many to many relationship for Job and Applicant, Applicant may apply for more than one job
  * Conservative estimate: 15 minutes
  * Stretch estimate: 8 minutes
* Test the relationship
  * Conservative estimate: 30 minutes
  * Stretch estimate: 15 minutes
* Create route, controller action (show of Admin::Job Controller or Dashboard::Job Controller depending on precedent), and view for Inidividual Job
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test all of these
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test regular users cannot access this view/route and get 404 but admin users can access this view
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Deploy
  * Conservative estimate: 3 hours
  * Stretch estimate: 1 hour
* Test Deployment with a FE automation framework like Cypress
  * Conservative estimate: 3 hours
  * Stretch estimate: 1 hour

4. Applicants can be sorted by Name, Email, Status, and Date Submitted.
* Add Order By methods using active record on each field
  * Conservative estimate: 15 mins
  * Stretch estimate: 8 mins
* Test ascending and descending sorts
  * Conservative estimate: 15 mins
  * Stretch estimate: 8 mins

5. Selecting an applicant shows an Applicant Detail Modal, which displays and allows for
modification of the applicant information.
* Consult with design on modal component boundaries/implementation
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Implement modal component
  * Conservative estimate: 4 hours
  * Stretch estimate: 2 hours
* Create view/route/controller action(edit) for Admin::Job::Applicant
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test all of these
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test regular users cannot access this view/route and get 404 but admin users can access this view
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Deploy
  * Conservative estimate: 3 hours
  * Stretch estimate: 1 hour
* Test Deployment with a FE automation framework like Cypress
  * Conservative estimate: 2 hours
  * Stretch estimate: 1 hours

6. Setting the status of a candidate to "Declined" sends an email to the candidate notifying
them.
* Add Email template
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test that setting a status sends correct email
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes

7. Setting the status of a candidate to "Interview Requested" sends an email requesting the
candidate's availability.
* Add Email template
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Test that setting a status sends correct email
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes
* Add logic that adds `interview_scheduled?` field and verifies whether an interview is scheduled yet, Possible integration with Calendly or Google Calendar API
  * Conservative estimate without API: 1 hour
  * Stretch estimate without API: 30 minutes
  * Conservative estimate with API: 3 days
  * Stretch estimate with API: 1 day
* Deploy
* Test Deployment with a FE automation framework like Cypress
  * Conservative estimate: 1 hour
  * Stretch estimate: 30 minutes

8. Manual testing with internal team/admins
  * Conservative estimate: 5 days
  * Stretch estimate: 3 days
