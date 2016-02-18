require 'watir-webdriver'
class WR_CalculatorPage
  include PageObject
  self.page_url $worldData['config']['url'] + "/"
  div(:ORIGIN_COUNTRY_SELECT, :id => 's2id_originCountries')
  div(:ORIGIN_COUNTRY_SELECTED, :id => 'select2-chosen-1')
  unordered_list(:ORIGIN_COUNTRY_SEARCH_RESULT, :class => 'select2-results')
  text_field(:ORIGIN_COUNTRY_INPUT, :id =>'s2id_autogen1_search')

  div(:DESTINATION_COUNTRY_SELECT, :id => 's2id_destinationCountries')
  div(:DESTINATION_COUNTRY_SELECTED, :id => 'select2-chosen-2')
  text_field(:DESTINATION_COUNTRY_INPUT, :id =>'s2id_autogen2_search')
  unordered_list(:DESTINATION_COUNTRY_SEARCH_RESULT, :class => 'select2-results')

  image(:COUNTRY_FLAGS, :xpath => '//*[@id="select2-chosen-1"]/span/img')
  div(:CALCULATION_DATA, :id => 'calculationData')
  div(:SERVICE_CONTAINER, :id => 'servicesContainer')
  div(:CORIDOR_CONTAINER, :id => 'corridorsContainer')

  def waitForElements
    Watir::Wait.until {self.ORIGIN_COUNTRY_SELECT?}
    Watir::Wait.until {self.DESTINATION_COUNTRY_SELECT?}
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
  attr_accessor :pageURL
end
