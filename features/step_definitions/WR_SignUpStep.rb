Then(/^I see signup page$/) do
  $worldData['signUpPage'] = WR_SignUp.new($browser)
  $worldData['signUpPage'].waitForToBeVisible
end

When(/^I submit invalid register data$/) do
	$worldData['signUpPage'].submit_invalid_reg_data
end

Then(/^I see signup error$/) do
	$worldData['signUpPage'].see_error
end
