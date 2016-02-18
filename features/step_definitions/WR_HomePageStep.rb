Given /^I am on worldremit main page/ do
  $worldData['homePage'] = WR_HomePage.new($browser)
  $worldData['homePage'].goto
  $worldData['homePage'].waitForToBeVisible
end

When(/^I view terms and conditions$/) do
  $worldData['homePage'].TERMS_AND_CONDITIONS_element.click
end

When(/^I view privacy policy$/) do
  $worldData['homePage'].PRIVACY_POLICY_element.click
end

When(/^I view FAQ$/) do
  $worldData['homePage'].FAQ_element.click
end

When(/^I navigate to Login page$/) do
	$worldData['homePage'].LOGIN_element.click
end

When(/^I navigate to SignUp page$/) do
	$worldData['homePage'].SIGNUP_element.click
end

Then(/^I am successfully logged in$/) do
	$worldData['homePage'].waitToBeLoggedIn
end

Then(/^I am not logged in$/) do
	$worldData['homePage'].imNotLoggedIn
end
