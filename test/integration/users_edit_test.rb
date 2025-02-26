require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest


  def setup
   @user = users(:testone)
   @other_user = users(:sample)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Test Two"
    email = "hello.one@rmit.edu.au"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "asdasd",
                                              password_confirmation: "asdasd" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_redirected_to root_url
  end
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }

    assert_redirected_to root_url
  end


  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name  = "test"
    email = "test.blah@rmit.edu.au"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "asdasd",
                                              password_confirmation: "asdasd" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end



end
