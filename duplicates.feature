Feature: Locate Duplicates

Scenario: Exact Duplicate Orders
Given a member has an order with products and quantities
| products | quantity |
| 123456   | 5        |
| 123457   | 8        |
And the member makes another order with products and quantities
| products | quantity |
| 123456   | 5        |
| 123457   | 8        |
When the second order is created
Then both orders will be flagged as potential duplicates

Scenario: Match 90% of Order - Varying Lines

Given a member has an order with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
| 123454   | 1        |
| 123455   | 1        |
| 123456   | 1        |
| 123457   | 1        |
| 123458   | 1        |
| 123459   | 1        |
| 123460   | 1        |
And the member makes another order with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
| 123454   | 1        |
| 123455   | 1        |
| 123456   | 1        |
| 123457   | 1        |
| 123458   | 1        |
| 123459   | 1        |
| 123460   | 1        |
| 123461   | 1        |
When the second order is created
Then both orders will be flagged as potential duplicates

Scenario: Match 90% of Order - Varying Quantities

Given a member has an order with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
| 123454   | 1        |
| 123455   | 1        |
| 123456   | 1        |
| 123457   | 1        |
| 123458   | 1        |
| 123459   | 1        |
| 123460   | 1        |
And the member makes another order with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
| 123454   | 1        |
| 123455   | 1        |
| 123456   | 1        |
| 123457   | 1        |
| 123458   | 1        |
| 123459   | 1        |
| 123460   | 10       |
When the second order is created
Then both orders will be flagged as potential duplicates

Scenario: Match more than one order

Given a member has an order with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
And an order flagged as a duplicate with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
And a third order is made with products and quantities
| products | quantity |
| 123451   | 1        |
| 123452   | 1        |
| 123453   | 1        |
When the third order is created
Then all three orders will be flagged as potential duplicates

