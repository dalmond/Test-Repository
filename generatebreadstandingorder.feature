Feature: Generate Bread Standing Order

Scenario: Generate Bread Order

Given the bread standing order file is populated
When I run the bread standing order process
Then new orders will be created for all members on the bread standing order file
And the 'date last run' will be set to the current system date
And the upload details will be loaded
And the total number of orders created will be displayed