require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://computer-database.gatling.io/computers"

table = driver.find_element(:class, "computers")

rows = table.find_elements(:xpath, ".//tbody/tr")

random_column = rand(0..3)

rows.each do |row|
  cells = row.find_elements(:tag_name, "td")
  puts cells[random_column].text
end

sleep 3

driver.quit