Feature: Restrict EOCS order number

Scenario: Restrict EOCS order number

When an order is created in EOCS
Then the order number must be in the range '9000000' to '9999999'

Scenario: Next order number
Given the last order number generated is '9999999'
When I create an order
Then the order number will be '9999998'