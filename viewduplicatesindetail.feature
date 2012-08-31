Feature: View Duplicates in Detail

Scenario: Load View Duplicates Screen

Given an order '9999999' is flagged as a duplicate
And '9999998' is flagged as its duplicate
When I select '9999999' in the duplicates table
Then I will be taken to the view duplicates screen
And order '9999999' will be displayed
And order '9999998' will be displayed

Scenario: Multiple Duplicates Load Selected

Given the following orders are flagged as duplicates
| order number |
| 9999999      |
| 9999998      |
| 9999997      |
| 9999996      |
When I select '9999998' in the duplicates table
Then I will be taken to the view duplicates screen
And order '9999998' will be displayed
And order '9999999' will be displayed

Scenario: Group Products

Given a flagged order has product lines
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
And its duplicate order has product lines
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
When the orders are loaded
Then these product lines will be grouped
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
And the non-matching product lines will be grouped
| products | quantity |
| 123461   | 1        |