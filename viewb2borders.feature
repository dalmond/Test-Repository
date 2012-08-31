Feature: View B2B orders

Scenario: View message
Given I have received an XML response
And I have a GUI flag
When I click on the link provided in the B2B document
Then I will be directed to the B2B message content managed page