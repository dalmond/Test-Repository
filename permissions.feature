Feature: Permissions

Scenario: Members redirected to content message
Given I am logged in as 'B00700'
And 'B00700' is a Member
When I log into EOCS
Then I will be redirected to the member front page message

Scenario: Internal Nisa User
Given I am logged in as 'dev'
And 'dev' is an internal nisa user
When I log into EOCS
Then I will be taken to the order management page
And I will have unrestricted acccess to the system