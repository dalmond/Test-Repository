Feature: Keep the product file up to date

Scenario: Update product file
Given the product file on EOCS has just been updated
When 24 hours have passed
And OCS is available
Then the product file from OCS will be updated to EOCS