def setup_driver
  appium_txt = File.join(Dir.pwd, '..', 'appium.txt')
  caps = Appium.load_appium_txt(file: appium_txt)
  Appium::Driver.new(caps)
end
