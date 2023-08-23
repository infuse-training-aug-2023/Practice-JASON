require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://letcode.in/forms"

dropdown_xpath = driver.find_element(:xpath, '//select[starts-with(.,"AfghanistanÅland IslandsAlbaniaAlgeriaAmerican")]')

select = Selenium::WebDriver::Support::Select.new(dropdown_xpath)

options = select.options

options.each do |option|
  puts option.text
end

sleep 3

driver.quit