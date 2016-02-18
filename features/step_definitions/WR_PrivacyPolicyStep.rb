Then(/^I see privacy policy page$/) do
  $worldData['privacyPolicyPage'] = WR_PrivacyPolicy.new($browser)
  $worldData['privacyPolicyPage'].waitForToBeVisible
end
