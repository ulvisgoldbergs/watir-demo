require 'watir-webdriver'
class WR_ThermsAndConditions
  include PageObject
  self.page_url $worldData['config']['url']+ "/en/about-us/terms-and-conditions"
  h1(:GENERAL_INTRO_TEXT, :text => 'WorldRemit Terms And Conditions')
  link(:PRIVACY_POLICY, :link_text => 'Privacy policy')
  link(:TERMS_AND_CONDITIONS, :link_text => 'Terms and conditions')
  div(:GENERAL_INTRO, :id => 'general-intro')
  div(:GENERAL_CONTENT, :id => 'general-content')
  link(:FAQ, :link_text => 'FAQ')
  link(:LOGIN, :text => 'Login')
  link(:SIGNUP, :text => 'Sign up')

  def waitForToBeVisible
    Watir::Wait.until {self.GENERAL_INTRO_TEXT?}
    Watir::Wait.until {self.GENERAL_INTRO?}
    Watir::Wait.until {self.GENERAL_CONTENT?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.GENERAL_INTRO?}
    Watir::Wait.until {self.GENERAL_CONTENT?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.SIGNUP?}
  end
end
