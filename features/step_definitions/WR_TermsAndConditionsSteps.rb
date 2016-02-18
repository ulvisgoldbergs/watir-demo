Then(/^I see terms and conditions page$/) do
  $worldData['termsAndConditionsPage'] = WR_ThermsAndConditions.new($browser)
  $worldData['termsAndConditionsPage'].waitForToBeVisible
end
