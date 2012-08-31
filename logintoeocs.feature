Feature: Login to EOCS

Scenario: Invalid Username
Given I have entered the username 'B77880'
And the user 'B77880' does not exist
When I submit the details
Then I will not be logged in
And an error message is returned

Scenario: Incorrect Password
Given I have entered the username 'dev'
And I have entered the password 'pwd'
And the password for 'dev' is 'password'
When I submit the details
Then I will not be logged in
And an error message is returned

Scenario: Correct Password
Given I have entered the username 'dev'
And I have entered the password 'enmass'
And the password for dev is 'enmass'
When I submit the details
Then I will be logged in as 'dev'
