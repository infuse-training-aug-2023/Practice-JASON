require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://letcode.in/forms"

dropdown = driver.find_element(:css, "div:nth-child(5).columns.container > div:last-child.column.is-half > div.field > div.control")

options = dropdown.find_elements(:tag_name, "option")

options.each do |option|
  puts option.text
end

sleep 3

driver.quit