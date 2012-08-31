Feature: Generate Milk Standing Order

Scenario: Generate Milk Standing Order

Given the milk standing order file is populated
When I run the milk standing order process
Then new orders will be created for all members on the milk standing order file
And the 'date last run' will be set to the current system date
And the upload details will be loaded
And the total number of orders created will be displayed