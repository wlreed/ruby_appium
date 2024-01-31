require_relative 'requires'
def login_with_valid_credentials
  it 'Login with valid credentials' do
    @home_view.nav_to_login
    @login_view.login('alice', 'mypassword')
    user = @user_view.get_logged_in_user
    assert_equal(user, 'alice')
  end
end
