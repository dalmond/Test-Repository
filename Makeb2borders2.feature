Feature: Make B2B Orders

Given an XML is received
When the system receives a valid xml file with store 'T05300'
And scheme 'Way'
And products and quantities
| itemCode | quantity |
| 47248    | 1        |
| 47247    | 1        |
| 47249    | 5        |
Then an order will be created for member 'T05300'
And will have scheme 'Way'
And will have products and quantities
| itemCode | quantity |
| 47248    | 1        |
| 47247    | 1        |
| 47249    | 5        |