Feature: Restrict OCS Order Numbers

Scenario: Restrict OCS Order number

When an order is generated in OCS
Then the order number will not be in the range '9000000' to '9999999'