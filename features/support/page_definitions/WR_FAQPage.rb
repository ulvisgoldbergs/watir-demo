require 'watir-webdriver'
class WR_FAQ
  include PageObject
  self.page_url $worldData['config']['url'] + "/en/faqs"
  h2(:HEADER_TEXT, :text => 'Frequently Asked Questions')
  form(:CALCULATOR, :id => 'calculator-form')
  link(:PRIVACY_POLICY, :link_text => 'Privacy policy')
  link(:TERMS_AND_CONDITIONS, :link_text => 'Terms and conditions')
  link(:FAQ, :link_text => 'FAQ')
  link(:LOGIN, :text => 'Login')
  link(:SIGNUP, :text => 'Sign up')

  def waitForToBeVisible
    Watir::Wait.until {self.HEADER_TEXT?}
    Watir::Wait.until {self.CALCULATOR?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.SIGNUP?}
  end
end
