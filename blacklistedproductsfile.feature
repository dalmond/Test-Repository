Feature: Keep the blacklisted products file up to date

Scenario: Update blacklisted products file
Given the blacklisted products file on EOCS has just been updated
When 10 minutes have passed
And OCS is available
Then the blacklisted products file from OCS will be updated to EOCS