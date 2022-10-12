-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns.
Select campaign.backers_count,
cf_id,
outcome
FROM campaign
WHERE outcome = 'live'
ORDER by backers_count DESC

Select campaign.backers_count,
campaign.cf_id,
campaign.outcome
FROM campaign
WHERE outcome = 'live'
ORDER by cf_id DESC

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT backers.cf_id,
backers.first_name,
backers.last_name,
backers.email
FROM backers
ORDER BY cf_id DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order.
SELECT co.first_name,
co.last_name,
co.email,
(ca.goal - ca.pledged) as "Remaining Goal Amount"
ca.outcome
INTO email_contacts_remaining_goal_amount
FROM contact as co
INNER JOIN campaign as ca
ON (co.contact_id = ca.contact_id)
WHERE outcome = 'live'
ORDER by "Remaining Goal Amount" DESC




-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order,
-- and has the first and last name of each backer, the cf_id, company name, description,
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal".
SELECT b.email,
b.first_name,
b.last_name,
b.cf_id,
ca.company_name,
ca.description,
ca.end_date,
(ca.goal - ca.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as ca
ON (b.cf_id = ca.cf_id)
ORDER BY b.email DESC


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount
