Feature: Make B2B Orders

Scenario: Accept B2B Order

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

Scenario: Valid Rejection File

Given an XML is received
When the system receives an invalid XML file
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

Given an XML is received
When the system receives an XMl file with docType 'dispatch'
Then a valid rejection file will be created

Scenario: Reject Debits

Given an XML is received
When the system receives an XML file with docType 'cdnote'
Then a valid rejection file will be created

Scenario: Reject Consumer Promotions

Given an XML is received
When the system receives an XML file with docType 'consumerPromotions'
Then a valid rejection file will be created

Scenario: Reject Dispatch

Given an XML is received
When the system receives an XML file with docType 'dispatch'
Then a valid rejection file will be created

Scenario: Reject Catalogue

Given an XML is received
When the system receives an XML file with docType 'catalogue'
Then a valid rejection file will be created

Scenario: Reject Invoices

Given an XML is received
When the system receives an XML file with docType 'invoice'
Then a valid rejection file will be created

Scenario: Reject Consumer Promotions

Given an XML is received
When the system receives an XML file with docType 'consumerPromotions'
Then a valid rejection file will be created