Feature: Make B2B Orders

Scenario: Accept B2B Order

Given a member has submitted an EPOS order
And the last created order number is '9999998'
When EOCS receives a valid xml file with store 'T05300'
And scheme 'Way'
And product lines
| itemCode | quantity |
| 47248    | 1        |
| 47247    | 1        |
| 47249    | 5        |
Then an order will be created for member 'T05300'
And will have order number '9999997'
And will have scheme 'Way'
And source 'B2B'
And a valid EPOS response will be generated
And will have product lines
| itemCode | quantity |
| 47248    | 1        |
| 47247    | 1        |
| 47249    | 5        |

Scenario: Reject Blacklisted Products

Given a valid EPOS order has product number '123456'
And the product number '123456' exists in the product file
And the product number '123456' exists in the blacklisted file
When EOCS receives the file
Then an order is created
And the product '123456' is not accepted
And a message is added to the EPOS response
<warningCode>
<code>701</code>
<description>Item not available </description>
</warningCode>
And the quantityAccepted will be set to '0.0'

Scenario: Reject Non-Existing Products

Given a valid EPOS order has product number '123456'
And the product number '123456' does not exists in the product file
When EOCS receives the file
Then an order is created
And the product '123456' is not accepted
And a message is added to the EPOS response
<warningCode>
<code>301</code>
<description>Invalid item </description> 
</warningCode>
And the quantityAccepted will be set to '0.0'

Scenario: Valid Rejection File

Given a member has submitted an EPOS order
When EOCS receives an invalid XML file
And document uid of '<document-uid>T05300-09999-2012-07-23 17:17:01.95701234567890</document-uid>'
And document date of '<document-date>2012-07-23 17:17:01.957</document-date>'
Then an XML file will be created with first line of '<?xml version="1.0" encoding="UTF-8"?>'
And second line of '<!DOCTYPE ocs-b2b-document-response SYSTEM "http://www.ntorder-int.com/ocs-b2b-document-response.dtd">'
And third line of '<ocs-b2b-document-response>
And fourth line of '<header>'
And fifth line of '<document-info>'
And sixth line of '<document-uid>T05300-09999-2012-07-23 17:17:01.95701234567890</document-uid>'
And seventh line of '<document-date>2012-07-23 17:17:01.957</document-date>'
And eigth line of '</document-info>'
And nineth line of '</header>'
And tenth line of '<body/>'
And eleventh line of '</ocs-b2b-document-response>'

Scenario: Reject Dispatch
Given a member has submitted an EPOS order
When the system receives an XMl file with docType 'dispatch'
Then a valid rejection file will be created

Scenario: Reject Debits
Given a member has submitted an EPOS order
When the system receives an XML file with docType 'cdnote'
Then a valid rejection file will be created

Scenario: Reject Consumer Promotions
Given a member has submitted an EPOS order
When the system receives an XML file with docType 'consumerPromotions'
Then a valid rejection file will be created

Scenario: Reject Catalogue
Given a member has submitted an EPOS order
When the system receives an XML file with docType 'catalogue'
Then a valid rejection file will be created

Scenario: Reject Invoices
Given a member has submitted an EPOS order
When the system receives an XML file with docType 'invoice'
Then a valid rejection file will be created