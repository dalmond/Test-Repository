Feature: Export Orders in EOCS
As a Nisa User
I want to export orders in EOCS
So that orders can be imported into OCS or RMS

Scenario Outline: Export Selected
Given I have selected orders "<selected>"
When I export the orders
Then a record will be added to a csv file "<output>"
And order status "<status>" will be set to Exported

Examples:
| ocs_order_id | store_order_id | store | scheme | supplier | delivery_date | ocs_line_number | item | presell_ind | ocs_presell_id initial_qty | nsp | nsp_currency | rsp | rsp_currency | to_be_priced_nsp | create_date | ocs_creation_date | order_date web_deal_type to_be_priced_rsp | sd_ind | sd_prim_master_item sd_prim_master_qty | order_source extend_cred_ind | 

Scenario: Export Selected Order Entry
Given the following orders

| Order id | member id | member name | order date   | delivery date | scheme | source         | total products | qty | status | date exported | selected |
| 0001       | T01530       | John Smith       | 01-01-2012 | 02-01-2012   | Way      | Order Entry | 2                     | 5    | Live    |                         | Yes         |
| 0002       | B00700       | John Smith       | 01-01-2012 | 02-01-2012   | Way      | Order Entry | 1                     | 5    | Live    |                         | No         |

And product lines

| order id | product id | qty |
| 0001      | 000001      | 4    |
| 0001      | 000002      | 1    |
| 0002      | 000001      | 5    |

And export occurs at 01-01-2012 15:00:00
And order was captured at 01-01-2012 12:00:00

When I export the Orders
Then a record <output> will be written to the csv file
And the order status will be set to 'Exported'

| output                                                                                                                                                                                |
| 0001,,T01530,Way,,02-01-2012,,000001,Y,,4,,GBP,,GBP,,01-01-2012 15:00:00,01-01-2012 12:00:00,01-01-2012,,Y,,,,T,N |

Scenario: Only Export Live

Given the following orders

| Order id | member id | member name | order date   | delivery date | scheme | source         | total products | qty | status      | date exported | selected |
| 0001       | T01530       | John Smith       | 01-01-2012 | 02-01-2012   | Way      | Order Entry | 2                     | 5    | Live         |                         | Yes         |
| 0002       | B00700       | John Smith       | 01-01-2012 | 02-01-2012   | Way      | Order Entry | 1                     | 5    | Exported |                         | Yes         |

And product lines

| order id | product id | qty |
| 0001      | 000001      | 4    |
| 0001      | 000002      | 1    |
| 0002      | 000001      | 5    |

And export occurs at 01-01-2012 15:00:00
And order was captured at 01-01-2012 12:00:00

When I export the Orders
Then a record <output> will be written to the csv file
And the order status will be set to 'Exported'

| output                                                                                                                                                                                |
| 0001,,T01530,Way,,02-01-2012,,000001,Y,,4,,GBP,,GBP,,01-01-2012 15:00:00,01-01-2012 12:00:00,01-01-2012,,Y,,,,T,N |