Feature: Set Way Order Date

Scenario Outline: Set Way Order Date
Given I am a Nisa User
When I run the Way End of Day process
Then the EOCS Way Order Date will progress to the next date

Examples:

|  Date    | Current EOCS Way Order Date | New EOCS Way Order Date |
| 01-01-12 | 01-01-12                    | 02-01-12                |
| 01-01-12 | 02-01-12                    | 03-01-12                |