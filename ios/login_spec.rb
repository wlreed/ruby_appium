require 'appium_lib'
describe 'Login' do
  before(:each) do
    appium_txt = File.join(Dir.pwd, 'appium.txt')
    caps = Appium.load_appium_txt(file: appium_txt)
    @driver = Appium::Driver.new(caps)
    @driver.start_driver
  end
  after(:each) do
    @driver.driver_quit
  end
  it 'Login with valid credentials' do
    @driver.wait { 
      @driver.find_element(:accessibility_id, 'Login Screen') 
    }.click
    username = @driver.wait {
      @driver.find_element(:xpath, "//XCUIElementTypeTextField[@name=\"username\"]")
    }
    password = @driver.find_element(:xpath, "//XCUIElementTypeSecureTextField[@name=\"password\"]")
    username.send_keys('alice')
    password.send_keys('mypassword')
    @driver.find_element(:accessibility_id, 'loginBtn').click
    @driver.wait {
      @driver.find_element(:accessibility_id, 'You are logged in as alice')
    }
  end
end
