Feature: Delete Duplicates

Scenario: Delete duplicate
Given an order '999999' is flagged as a duplicate
And order '999901' is flagged as the duplicate of '999999'
And order '999901' is not flagged as the duplicate of another order
And order '999999' is selected
When I delete the order
Then order '999999' will be removed from the system
And order '999901' will no longer be flagged as a duplicate
