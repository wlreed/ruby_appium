require 'rspec'
require 'appium_lib'
RSpec.configure do |config|
  config.before(:all) do
    appium_txt = File.join(Dir.pwd, 'appium.txt')
    caps = Appium.load_appium_txt(file: appium_txt)
    @driver = Appium::Driver.new(caps)
    @home_view = HomeView.new(@driver)
    @login_view = LoginView.new(@driver)
    @user_view = if caps[:caps][:platformName].downcase == 'ios'
                   IOSUserView.new(@driver)
                 else
                   AndroidUserView.new(@driver)
                 end
  end
  config.before(:each) do
    @driver.start_driver
  end
  config.after(:each) do
    @driver.driver_quit
  end
end
