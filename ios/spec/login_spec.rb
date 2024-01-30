require_relative 'requires'
describe 'Login' do
  include Test::Unit::Assertions
  before(:each) do
    @driver = setup_driver
    @home_view = HomeView.new(@driver)
    @login_view = LoginView.new(@driver)
    @user_view = UserView.new(@driver)
    @driver.start_driver
  end
  after(:each) do
    @driver.driver_quit
  end
  it 'Login with valid credentials' do
    @home_view.nav_to_login
    @login_view.login('alice', 'mypassword')
    user = @user_view.get_logged_in_user
    assert_equal(user, 'alice')
  end
end
