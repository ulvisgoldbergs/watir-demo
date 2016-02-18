require 'watir-webdriver'
class WR_Login
  include PageObject
  self.page_url $worldData['config']['url'] + "/send/LoginPage.aspx"
  h1(:GENERAL_INTRO_TEXT, :text => 'Login')
  link(:PRIVACY_POLICY, :link_text => 'Privacy policy')
  link(:TERMS_AND_CONDITIONS, :link_text => 'Terms and conditions')
  list_item(:LOGIN_BOX, :id => 'login-box')
  text_field(:EMAIL_FIELD, :id => 'email')
  text_field(:PASSWORD_FIELD, :id => 'password')
  button(:LOGIN_BUTTON, :id => 'submit-login')
  list_item(:SIGNUP_BOX, :id => 'signup-box')
  link(:FORGOT_PASSWORD, :link_text => 'Forgotten Your Password ?')
  link(:FAQ, :link_text => 'FAQ')
  link(:LOGIN, :text => 'Login')
  link(:SIGNUP, :text => 'Sign up')
  paragraph(:ERROR, :class => 'error')

  def waitForToBeVisible
    Watir::Wait.until {self.GENERAL_INTRO_TEXT?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.LOGIN_BOX?}
    Watir::Wait.until {self.EMAIL_FIELD?}
    Watir::Wait.until {self.PASSWORD_FIELD?}
    Watir::Wait.until {self.LOGIN_BUTTON?}
    Watir::Wait.until {self.SIGNUP_BOX?}
    Watir::Wait.until {self.FORGOT_PASSWORD?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.SIGNUP?}
  end

  def submit_valid_login
    self.EMAIL_FIELD_element.set($worldData['config']['validUser']['username'])
    self.PASSWORD_FIELD_element.set($worldData['config']['validUser']['password'])
    self.LOGIN_BUTTON_element.click
  end

  def submit_invalid_login
    self.EMAIL_FIELD_element.set($worldData['config']['invalidUser']['username'])
    self.PASSWORD_FIELD_element.set($worldData['config']['invalidUser']['password'])
    self.LOGIN_BUTTON_element.click
  end

  def see_error(error)
    Watir::Wait.until {self.ERROR?}
    puts self.ERROR
    unless self.ERROR == error
      raise
    end
  end
end
