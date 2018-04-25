require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, auth_token: @user.auth_token, avatar: @user.avatar, birthday: @user.birthday, confirm_at: @user.confirm_at, confirm_send_at: @user.confirm_send_at, confirm_token: @user.confirm_token, deleted_at: @user.deleted_at, email: @user.email, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, middle_name: @user.middle_name, password_digest: @user.password_digest, phone: @user.phone, reset_send_at: @user.reset_send_at, reset_token: @user.reset_token, role_id: @user.role_id } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, auth_token: @user.auth_token, avatar: @user.avatar, birthday: @user.birthday, confirm_at: @user.confirm_at, confirm_send_at: @user.confirm_send_at, confirm_token: @user.confirm_token, deleted_at: @user.deleted_at, email: @user.email, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, middle_name: @user.middle_name, password_digest: @user.password_digest, phone: @user.phone, reset_send_at: @user.reset_send_at, reset_token: @user.reset_token, role_id: @user.role_id } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
