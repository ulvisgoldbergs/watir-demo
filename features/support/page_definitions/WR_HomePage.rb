require 'watir-webdriver'
class WR_HomePage
  include PageObject
  self.page_url $worldData['config']['url'] + "/"
  select_list(:DESTINATION_COUNTRY_SELECT, :id => 'selectTo')
  link(:PRIVACY_POLICY, :link_text => 'Privacy policy')
  link(:TERMS_AND_CONDITIONS, :link_text => 'Terms and conditions')
  link(:GET_STARTED, :id => 'sendTargetHREF')
  link(:FAQ, :link_text => 'FAQ')
  link(:LOGIN, :text => 'Login')
  link(:SIGNUP, :text => 'Sign up')

  div(:USER_MENU, :class => 'user-menu')

  def waitForToBeVisible
    Watir::Wait.until {self.DESTINATION_COUNTRY_SELECT?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.GET_STARTED?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.SIGNUP?}
  end

  def waitToBeLoggedIn
    Watir::Wait.until {self.DESTINATION_COUNTRY_SELECT?}
    Watir::Wait.until {!self.LOGIN?}
    Watir::Wait.until {!self.SIGNUP?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.GET_STARTED?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.USER_MENU?}
  end

  def imNotLoggedIn
    Watir::Wait.until {self.DESTINATION_COUNTRY_SELECT?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.SIGNUP?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.GET_STARTED?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {!self.USER_MENU?}
  end

  def selectCountry(option, country)
    this.waitForElements
    if option == "Send From"
      self.ORIGIN_COUNTRY_SELECT.click
      self.ORIGIN_COUNTRY_INPUT.set(country)
      self.ORIGIN_COUNTRY_SEARCH_RESULT.click
    elsif option == "Send To"
      self.DESTINATION_COUNTRY_SELECT.click
      self.DESTINATION_COUNTRY_INPUT.set(country)
      self.DESTINATION_COUNTRY_SEARCH_RESULT.click
    end
  end
end
