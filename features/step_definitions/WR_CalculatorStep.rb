Given /^I am on calculator page$/ do
  calculatorPage = WR_CalculatorPage.new($browser)
  calculatorPage.goto
  calculatorPage.waitForElements
end
