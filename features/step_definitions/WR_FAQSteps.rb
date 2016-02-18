Then(/^I see FAQ page$/) do
  $worldData['termsAndConditionsPage'] = WR_FAQ.new($browser)
  $worldData['termsAndConditionsPage'].waitForToBeVisible
end
