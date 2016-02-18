Feature: WorldRemit customer options and policies
	In order to get more information about worldremit policies
	As a customer
	I want to be able to view worldremit policies

	Scenario: To test that it is possible to view Privacy Policy page
		Given I am on worldremit main page
		When I view privacy policy
		Then I see privacy policy page

	Scenario: To test that it is possible to view terms and conditions
		Given I am on worldremit main page
		When I view terms and conditions
		Then I see terms and conditions page

	Scenario: To test that it is possible to view FAQ
		Given I am on worldremit main page
		When I view FAQ
    Then I see FAQ page
