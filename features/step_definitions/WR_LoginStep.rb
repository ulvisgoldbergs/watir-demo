Then(/^I see login page$/) do
  $worldData['loginPage'] = WR_Login.new($browser)
  $worldData['loginPage'].waitForToBeVisible
end

When(/^I submit valid user data$/) do
	$worldData['loginPage'].submit_valid_login
end

When(/^I submit invalid user data$/) do
	$worldData['loginPage'].submit_invalid_login
end

Then(/^I see '(.*)' login error$/) do |error|
	$worldData['loginPage'].see_error(error)
end
