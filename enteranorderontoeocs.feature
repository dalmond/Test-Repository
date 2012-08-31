Feature: Enter an order onto EOCS

Scenario: Valid Product
Given I have entered a product number '123456'
And the product number '123456' exists in the product file
And the product number '123456' is not in the blacklisted file
And the product number '123456' matches the specified scheme
And the quantity is greater than zero
When I add the product to the order
Then an order line is added

Scenario: Reject Non-Existing Products
Given I have entered a product number '123456'
And the product number '123456' does not exist in the product file
When I add the product to the order
Then an order line is not added
And an error message is displayed

Scenario: Reject Blacklisted Products
Given I have entered a product number '123456'
And the product number '123456' exists in the product file
And the product number '123456' is exists in the blacklisted file
When I add the product to the order
Then an order line is not added
And an error message is displayed

Scenario Outline: Reject Wrong Scheme
Given I have entered a scheme for the order <order scheme>
And I have entered a product with a scheme <prod scheme>
When I add the product to the order
Then the outcome should be <outcome>

Examples:
| order scheme   | product scheme | outcome  |
| way            | freeze & chill | rejected |
| freeze & chill | way            | rejected |

Scenario: Reject Invalid Quantity
Given I have entered a quantity '0'
When I add the product to the order
Then an order line is not added to the order
And an error message is displayed

Scenario: Reject Invalid Member
Given I have entered a Member ID 'B00700'
And there are members with member ids
| member id|
| T05300      |
| A00200     |
When I submit the member id
Then an error message will be returned

Scenario: Create Order
Given I have added products to an order 
And the order does not exist on the system
And the last order number created is '9999996'
When I  submit the order
Then an order will be added to the system
And the order number will be '9999995'

Scenario: Delete Products from Order
Given I am editing an existing order '0001'
When I delete a product '123456'
Then the product '123456' will be removed from the order '0001'

Scenario: Update Quantity of Product
Given I am editing an existing order '0001'
And the order has product '123456'
And product '123456' has quantity '1'
And I amend the quantity to '5'
When I leave the field
Then the product '123456' in order '0001' will have quantity '5'

Scenario: Reject Invalid Edited Quantity
Given I am editing an existing order '0001'
And the order has product '123456'
And product '123456' has quantity '1'
And I amend the quantity to '0'
When I leave the field
Then the product '123456' in order '0001' will have quantity '1'
And an error message will be displayed

Scenario: Order Summary
Given an order with order lines
| product id | quantity |
| 123456      | 5            |
| 000001      | 2            |
| 000002      | 5            |
Then the summary table will return
| Total Products | Total Cases |
| 3                      | 12               |