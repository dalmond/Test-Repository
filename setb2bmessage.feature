Feature: Set message to be displayed to members when they view b2b orders

Scenario: Set message
Given I have entered a message in the rich text editor
When I submit the changes
Then the message will stored
And the message will be shown as a page to members when they click on the link sent with b2b orders

Scenario: Cancel changes
Given I have entered changes to a message in the rich text editor
When I cancel the changes
Then the message will not be altered