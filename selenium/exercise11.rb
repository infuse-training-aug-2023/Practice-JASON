require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://the-internet.herokuapp.com/tables"

table = driver.find_element(:id, "table1")

row = table.find_elements(:xpath, ".//tbody/tr")[1]

cell = row.find_elements(:tag_name, "td")[2]

puts cell.text

sleep 3

driver.quit