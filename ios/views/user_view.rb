# UserView
# view once the user logs in
class UserView
  def initialize(driver)
    @d = driver
    @message = [
      :xpath,
      "//XCUIElementTypeOther[contains(@name, 'You are logged in as')]"
    ]
  end

  def get_logged_in_user
    message = @d.wait { @d.find_element(*@message) }.text
    message.split[-2]
  end
end
