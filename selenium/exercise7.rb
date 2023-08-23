require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://testpages.herokuapp.com/styled/basic-html-form-test.html"

dropdown_xpath = driver.find_element(:xpath, '//*[@id="HTMLFormElements"]/table/tbody/tr[8]/td/select')

select = Selenium::WebDriver::Support::Select.new(dropdown_xpath)

options = select.options

i = 2

option = options[i]

option.click

value = option.attribute("value")

puts "Selected dropdown item value: #{value}"

sleep 3

driver.quit