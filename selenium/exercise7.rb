require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://testpages.herokuapp.com/styled/basic-html-form-test.html"

dropdown = driver.find_element(:name, "dropdown")

i = 2

option = dropdown.find_elements(:tag_name, "option")[i]

option.click

value = option.attribute("value")

puts "Selected dropdown item value: #{value}"


sleep 3

driver.quit