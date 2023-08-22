require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://cosmocode.io/automation-practice-webtable/"

table = driver.find_element(:id, "countries")

row = table.find_element(:xpath, ".//tbody/tr[1]")

cells = row.find_elements(:tag_name, "td")

cells.each do |cell|
    puts cell.text
end

sleep 3

driver.quit