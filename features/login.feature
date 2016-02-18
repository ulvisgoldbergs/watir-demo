Feature: Login possibility for a customer existing customers
	In order to use worldremit services
	As a customer
	I want to be able to login

	Scenario: To test that is possible to make possitive login
		Given I am on worldremit main page
		When I navigate to Login page
		And I see login page
		And I submit valid user data
		Then I am successfully logged in

	Scenario: To test that is possible to make negative login
		Given I am on worldremit main page
		When I navigate to Login page
		And I see login page
		And I submit invalid user data
		Then I see 'Invalid username or password.' login error
		And I see login page
