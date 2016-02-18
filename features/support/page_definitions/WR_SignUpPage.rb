require 'watir-webdriver'
class WR_SignUp
  include PageObject
  self.page_url $worldData['config']['url'] + "/send/SignUp.aspx"
  h1(:GENERAL_INTRO_TEXT, :text => 'Sign up')
  link(:PRIVACY_POLICY, :link_text => 'Privacy policy')
  link(:TERMS_AND_CONDITIONS, :link_text => 'Terms and conditions')
  div(:REGISTRATION_FORM, :class => 'registration-form')
  text_field(:NAME_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_lblRemitente')
  text_field(:MIDDLE_NAME_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_txtCUR_MIDDLE_NAME')
  text_field(:LAST_NAME_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_lblRemitenteApellido')
  text_field(:EMAIL_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_lblEmailUser')
  text_field(:PASSWORD_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_txtClave')
  text_field(:CONFIRM_PASSWORD_FIELD, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_txtClave2')
  button(:SIGNUP_BUTTON, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_btnSalvar')
  link(:FAQ, :link_text => 'FAQ')
  link(:LOGIN, :text => 'Login')
  link(:SIGNUP, :text => 'Sign up')
  span(:ERROR, :id => 'ContentPlaceHolder1_ContentPlaceHolder1_ctCustomerSenderEdit1_rlblRemitente')

  def waitForToBeVisible
    Watir::Wait.until {self.GENERAL_INTRO_TEXT?}
    Watir::Wait.until {self.PRIVACY_POLICY?}
    Watir::Wait.until {self.TERMS_AND_CONDITIONS?}
    Watir::Wait.until {self.REGISTRATION_FORM?}
    Watir::Wait.until {self.NAME_FIELD?}
    Watir::Wait.until {self.MIDDLE_NAME_FIELD?}
    Watir::Wait.until {self.LAST_NAME_FIELD?}
    Watir::Wait.until {self.EMAIL_FIELD?}
    Watir::Wait.until {self.PASSWORD_FIELD?}
    Watir::Wait.until {self.CONFIRM_PASSWORD_FIELD?}
    Watir::Wait.until {self.SIGNUP_BUTTON?}
    Watir::Wait.until {self.FAQ?}
    Watir::Wait.until {self.LOGIN?}
    Watir::Wait.until {self.SIGNUP?}
  end


  def submit_invalid_reg_data
    self.NAME_FIELD_element.set($worldData['config']['invalidUser']['first_name'])
    self.MIDDLE_NAME_FIELD_element.set($worldData['config']['invalidUser']['middle_name'])
    self.LAST_NAME_FIELD_element.set($worldData['config']['invalidUser']['last_name'])
    self.EMAIL_FIELD_element.set($worldData['config']['invalidUser']['username'])
    self.PASSWORD_FIELD_element.set($worldData['config']['invalidUser']['password'])
    self.CONFIRM_PASSWORD_FIELD_element.set($worldData['config']['invalidUser']['password'])
    self.SIGNUP_BUTTON_element.click
  end

  def see_error
    #TODO add rest off error elements
    Watir::Wait.until {self.ERROR_element.visible?}
  end
end
