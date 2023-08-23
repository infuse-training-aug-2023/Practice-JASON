require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/JasonGonsalves/Documents/Automation/chromedriver-win64/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

def navigate_to_bing(driver)
  driver.navigate.to "https://www.bing.com/"
end

def search_for(driver, query)
  search_box = driver.find_element(:name, "q")
  search_box.send_keys query
  search_box.submit
end

def click_images_tab(driver)
  images_tab = driver.find_element(:id, "b-scopeListItem-images")
  images_tab.click
end

def click_first_image(driver)
  first_image = driver.find_element(:css, "ul:first-child.dgControl_list > li:first-child > div.iuscp.isv")
  first_image.click
end

def wait_for_title(driver, title)
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { driver.title.start_with? title }
end

def wait_for_element(driver, id)
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { driver.find_element(:id, id) }
end

def get_current_url(driver)
  puts driver.current_url
end

def quit_driver(driver)
  driver.quit
end

navigate_to_bing(driver)
search_for(driver, "Selenium WebDriver")
wait_for_title(driver, "Selenium WebDriver")

click_images_tab(driver)
wait_for_title(driver, "Selenium WebDriver")

click_first_image(driver)
wait_for_element(driver, "b_content")

get_current_url(driver)

sleep 3

quit_driver(driver)