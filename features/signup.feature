Feature: Sign up option for world remit customers
	In order to start using worldremit services
	As a customer
	I want to be able to sign up

	Scenario: To test that it is NOT possbile to sign up with INVALID data
		Given I am on worldremit main page
		When I navigate to SignUp page
    Then I see signup page
		And I submit invalid register data
		Then I see signup error
