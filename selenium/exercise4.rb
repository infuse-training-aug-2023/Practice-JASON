require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://demo.automationtesting.in/Register.html"

checkbox = driver.find_element(:id, "checkbox1")

checkbox.click

radio_button = driver.find_element(:css, "label > input.ng-pristine.ng-untouched.ng-invalid.ng-invalid-required")

radio_button.click

sleep 3

driver.quit