require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

driver.get "https://www.globalsqa.com/demo-site/sliders/#Steps"

iframe = driver.find_element(:css, "iframe.demo-frame.lazyloaded")

driver.switch_to.frame(iframe)

slider = driver.find_element(:id, "slider")

slider_width = slider.size.width

slider_position = slider_width / 2

driver.action.click_and_hold(slider).move_by(slider_position, 0).release.perform

amount = driver.find_element(:id, "amount").attribute("value")

puts "Amount: #{amount}"

sleep(3)

driver.switch_to.default_content

driver.quit
