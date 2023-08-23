require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://www.google.com"

text_area = driver.find_element(:id, "APjFqb")

text_area.send_keys "Web Driver"

search_btn = driver.find_element(:css, "div.FPdoLc.lJ9FBc > center > input:first-child.gNO89b")

search_btn.click

sleep 3

driver.quit