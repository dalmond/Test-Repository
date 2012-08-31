Feature: Upload Orders

Scenario: Valid CSV file

Given a csv file with headings
| Headings            |
| ocs_order_id        |
| store_order_id      |
| store               | 
| scheme              |
| supplier            |
| delivery_date       |
| ocs_line_number     |
| item                |
| presell_ind         |
| ocs_presell_id      |
| initial_qty         |
| nsp                 |
| nsp_currency        |
| rsp                 |
| rsp_currency        |
| to_be_priced_nsp    |
| create_date         |
| ocs_creation_date   |
| order_date          |
| web_deal_type       |
| to_be_priced_rsp    |
| sd_ind              |
| sd_prim_master_item |
| sd_prim_master_qty  |
| order_source        |
| extend_cred_ind     |
When I upload the CSV file
Then the file will be uploaded

Scenario: Reject CSV File Headings
Given a CSV without the headings
| Headings            |
| ocs_order_id        |
| store_order_id      |
| store               | 
| scheme              |
| supplier            |
| delivery_date       |
| ocs_line_number     |
| item                |
| presell_ind         |
| ocs_presell_id      |
| initial_qty         |
| nsp                 |
| nsp_currency        |
| rsp                 |
| rsp_currency        |
| to_be_priced_nsp    |
| create_date         |
| ocs_creation_date   |
| order_date          |
| web_deal_type       |
| to_be_priced_rsp    |
| sd_ind              |
| sd_prim_master_item |
| sd_prim_master_qty  |
| order_source        |
| extend_cred_ind     |
When I upload the file
Then the file will be rejected
And an error message will be displayed

Scenario: Reject Non CSV File

Given a non CSV file
When I upload the file
Then the file will not be uploaded
And an error message will be displayed

Scenario: Reject File With No Records

Given a CSV file has valid headings
And the CSv file has no other records
When I upload the file
Then the upload will be rejected 
And an error message will be displayed

Scenario: Create Order

Given a valid CSV file with values
| store  | scheme | item   | initial_qty |
| B00700 | way    | 123456 | 5           |
| B00700 | way    | 012345 | 10          |
| B00700 | way    | 100453 | 5           |
And the last order created in the system was '9999999'
When the file is uploaded
Then an order will be created with order number '9999998'
And product lines
| item   | quantity |
| 123456 | 5        |
| 012345 | 10       |
| 100453 | 5        |
And a message will be displayed showing '1 order created, 3 lines added'

Scenario: Reject Blacklisted Products

Given a valid CSV file with values
| store  | scheme | item   | initial_qty |
| B00700 | way    | 123456 | 5           |
| B00700 | way    | 012345 | 10          |
| B00700 | way    | 100453 | 5           |
And the last order created in the system was '9999999'
And item '123456' is on the blacklisted file
When the file is uploaded
Then an order will be created with order number '9999998'
And product lines
| item   | quantity |
| 012345 | 10       |
| 100453 | 5        |
And a message will be displayed showing '1 order created, 2 lines added, 1 line rejected'
And the rejected line will be displayed

Scenario: Reject Wrong Scheme

Given a valid CSV file with values
| store  | scheme | item   | initial_qty |
| B00700 | way    | 123456 | 5           |
| B00700 | way    | 012345 | 10          |
| B00700 | way    | 100453 | 5           |
And item '123456' does not have scheme 'Way'
And the last order created in the system was '9999999'
When the file is uploaded
Then an order will be created with order number '9999998'
And product lines
| item   | quantity |
| 123456 | 5        |
| 012345 | 10       |
| 100453 | 5        |
And a message will be displayed showing '1 order created, 2 lines added, 1 line rejected'
And the rejected line will be displayed

Scenario: Different Scheme Same Member

Given a valid CSV file with values
| store  | scheme         | item   | initial_qty |
| B00700 | way            | 123456 | 5           |
| B00700 | way            | 012345 | 10          |
| B00700 | way            | 100453 | 5           |
| B00700 | freeze & chill | 923456 | 5           |
| B00700 | freeze & chill | 912345 | 10          |
| B00700 | freeze & chill | 900453 | 5           |
And the last order created in the system was '9999999'
When the file is uploaded
Then an order will be created with order number '9999998'
And order '0000008' will have product lines
| item   | quantity |
| 123456 | 5        |
| 012345 | 10       |
| 100453 | 5        |
And an order will be created with order number '9999997'
And order '9999997' will have product lines
| item   | quantity |
| 923456 | 5        |
| 912345 | 10       |
| 900453 | 5        |
And a message will be displayed showing '2 orders created, 6 lines added'

Scenario: Multiple Member Orders

Given a valid CSV file with values
| store  | scheme         | item   | initial_qty |
| B00700 | way            | 123456 | 5           |
| B00700 | way            | 012345 | 10          |
| B00700 | way            | 923456 | 5           |
| B00700 | way            | 912345 | 10          |
| T05300 | way            | 900453 | 5           |
| T05300 | way            | 100453 | 5           |
And the last order created in the system was '9999999'
When the file is uploaded
Then an order will be created with order number '9999998'
And order '0000008' will have product lines
| item   | quantity |
| 123456 | 5        |
| 012345 | 10       |
| 923456 | 5        |
| 912345 | 10       |
And an order will be created with order number '9999997'
And order '9999997' will have product lines
| item   | quantity |
| 100453 | 5        |
| 900453 | 5        |
And a message will be displayed showing '2 orders created, 6 lines added'

Given a valid CSV file with values
| store  | scheme         | item   | initial_qty |
| B00700 | way            | 123456 | 5           |
| B00700 | way            | 012345 | 10          |
| T05300 | way            | 100453 | 5           |
| B00700 | way            | 923456 | 5           |
| B00700 | way            | 912345 | 10          |
| B00700 | way            | 900453 | 5           |
And the last order created in the system was '9999999'
When the file is uploaded
Then an order will be created with order number '9999998'
And order '0000008' will have product lines
| item   | quantity |
| 123456 | 5        |
| 012345 | 10       |
| 923456 | 5        |
| 912345 | 10       |
| 900453 | 5        |
And an order will be created with order number '9999997'
And order '9999997' will have product lines
| item   | quantity |
| 100453 | 5        |
And a message will be displayed showing '2 orders created, 6 lines added'








