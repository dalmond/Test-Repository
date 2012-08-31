Feature: Delete Duplicates in Detail View

Scenario: Delete Duplicate Order

Given orders are flagged as duplicates
| order number |
| 9999999      |
| 9999998      |
| 9999997      |
And the following orders are displayed
| order number |
| 9999999      |
| 9999998      |
When order '9999999' is deleted
Then order '9999999' will be removed from EOCS
And order '9999997' will be loaded to the screen

Scenario: Display Largest Order Number

Given orders are flagged as duplicates
| order number |
| 9999999      |
| 9999998      |
| 9999997      |
| 9999996      |
And the following orders are displayed
| order number |
| 9999997      |
| 9999999      |
When order '9999999' is deleted
Then order '9999999' will be removed from EOCS
And order '9999998' will be loaded to the screen