Feature: Filter

Scenario: No Match Member ID
Given I have entered filtercriteria for member id 't05300'
And there are orders with member ids;
| menber id  |
| B00700 |
| dev       |
| T0934   |
When I run the filter
Then no orders will be returned

Scenario: Partial Match Member ID
Given I have entered filter criteria for member id 't0'
And there are orders with member ids;
| member id  |
| B00700 |
| dev       |
| T0934   |
| T00567 |
When I run the filter
Then only orders where member ID = 'T0934' or 'T00567' will be returned

Scenario: Exact Match Member ID
Given I have entered filter criteria for member id 't0934'
And there are orders with member ids;
| member id  |
| B00700 |
| dev       |
| T0934   |
| T00567 |
When I run the filter
Then only orders where member ID = 'T0934' will be returned

Scenario: Null Member ID
Given I have entered a null member id
When I run the filter
Then there will be no filter placed on member id

Scenario: Order Date
Given I have entered an order date '01-01-2012'
And there are orders with order date;
| order id | order date   |
| 0001      | 01-01-2012 |
| 0002      | 01-01-2012 |
| 0003      | 02-01-2012 |
| 0004      | 02-01-2012 |
When I run the filter
Then orders '0001' and '0002' will be returned

Scenario: Export Date
Given I have entered an export date '01-01-2012'
And there are orders with export date;
| order id | export date  |
| 0001      | 01-01-2012  |
| 0002      | 01-01-2012  |
| 0003      | 02-01-2012  |
| 0004      | 02-01-2012  |
When I run the filter
Then orders '0001' and '0002' will be returned

Scenario: Way Orders
Given I have checked 'Way'
And there orders with schemes
| order id | scheme          |
| 001        | way                |
| 002        | Freeze & chill |
When I run the filter
Then order '001' will be returned

Scenario: Freeze & Chill Orders
Given I have checked 'Freeze & Chill'
And there orders with schemes
| order id | scheme          |
| 001        | way                |
| 002        | Freeze & chill |
When I run the filter
Then order '002' will be returned

Scenario: Way Plus Freeze & Chill
Given I have checked 'Way'
And I have checked 'Freeze & Chill'
And there orders with schemes
| order id | scheme          |
| 001        | way                |
| 002        | Freeze & chill |
When I run the filter
Then order '001' and '002' will be returned

Scenario: Live Orders
Given I have checked 'Live'
And there orders with status
| order id | status          |
| 001        | live              |
| 002        | exported     |
When I run the filter
Then order '001' will be returned

Scenario: Exported Orders
Given I have checked 'Exported'
And there orders with status
| order id | status          |
| 001        | live              |
| 002        | exported     |
When I run the filter
Then order '002' will be returned

Scenario: Live Plus Exported
Given I have checked 'Live'
And I have checked 'Exported'
And there orders with status
| order id | status          |
| 001        | live              |
| 002        | exported     |
When I run the filter
Then order '001' and '002' will be returned

Scenario: B2B Orders
Given I have checked 'B2B'
And there orders with source
| order id | source         |
| 001        | B2B             |
| 002        | order entry |
When I run the filter
Then order '001' will be returned

Scenario: Order Entry Orders
Given I have checked 'Order Entry'
And there orders with source
| order id | source         |
| 001        | B2B             |
| 002        | order entry |
When I run the filter
Then order '002' will be returned

Scenario: B2B Plus Order Entry Orders
Given I have checked 'B2B'
And I have checked 'Order Entry'
And there orders with source
| order id | source         |
| 001        | B2B             |
| 002        | order entry |
When I run the filter
Then order '001' and '002' will be returned

Scenario: Milk Standing Order Override

Given I have checked 'Only view members with standing order override turned off'
And member 'B00700' has 'If checked any milk orders submitted with a delivery date on the same day as a standing order for milk, will be delivered in addition to the standing order' checked in OCS
And the flag has been updated in EOCS
And member 'b00700' has orders in EOCS
When I run the filter
Then no orders for 'B00700' will be returned
