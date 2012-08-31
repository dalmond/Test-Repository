Feature: Update Standing Order Files

Scenario: Update Milk Standing Orders

Given the milk standing order file has just been updateed
When 24 hours pass
And OCS is available
Then the milk standing order file will be updated

Scenario: Update bread standing order file

Given the bread standing order file has just been updateed
When 24 hours pass
And OCS is available
Then the bread standing order file will be updated
And the 'date last updated' field will be set to the system date

Scenario: Update milk standing order override flags

Given the milk standing order override flags file has just been updateed
When 24 hours pass
And OCS is available
Then the milk standing order override flags file will be updated
And the 'date last updated' field will be set to the system date