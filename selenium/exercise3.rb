require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_button_test"

get_website_btn = driver.find_element(:id, "getwebsitebtn")

get_website_btn.click

sleep 3

driver.quit