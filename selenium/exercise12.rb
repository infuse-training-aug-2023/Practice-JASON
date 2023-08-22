require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.navigate.to "https://www.bing.com/"

search_box = driver.find_element(:name, "q")

search_box.send_keys "Selenium WebDriver"

search_box.submit

wait = Selenium::WebDriver::Wait.new(timeout: 10)
wait.until { driver.title.start_with? "Selenium WebDriver" }

puts driver.title

images_tab = driver.find_element(:id, "b-scopeListItem-images")
images_tab.click

wait.until { driver.title.start_with? "Selenium WebDriver" }

puts driver.title

first_image = driver.find_element(:css, "ul:first-child.dgControl_list > li:first-child > div.iuscp.isv")
first_image.click

wait.until { driver.find_element(:id, "b_content") }

puts driver.current_url

sleep 3

driver.quit