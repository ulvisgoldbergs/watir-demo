require 'watir-webdriver'
require 'yaml'
require 'page-object'
$env= ENV['ENV']
config = YAML.load_file("config.yml")
$worldData = Hash["config" => config[$env]]

Before do |scenario|
  chromedriver_path = File.join(File.absolute_path("..", File.dirname(__FILE__)),"drivers","chromedriver")
  Selenium::WebDriver::Chrome.driver_path = chromedriver_path
  $browser=Watir::Browser.new :chrome
end

After do |scenario|
  $browser.quit
end
at_exit do
  $browser.quit
end
