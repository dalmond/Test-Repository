Feature: Set Freeze and Chill Order Date

Scenario Outline: Set Order Date
Given I am a Nisa User
When I run the Freeze and Chill End of Day process
Then the EOCS Freeze and Chill Order Date will progress to the next date

Examples:

|  Date    | Current EOCS Freeze and Chill Order Date | New EOCS Freeze and Chill Order Date |
| 01-01-12 | 01-01-12                                 | 02-01-12                             |
| 01-01-12 | 02-01-12                                 | 03-01-12                             |