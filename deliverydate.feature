Feature: Default delivery date

Scenario: Set default delivery date
Given I have created an order
When the order page loads
Then the delivery date will be set to the order date plus 24 hours