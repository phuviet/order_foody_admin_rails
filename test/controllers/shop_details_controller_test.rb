require 'test_helper'

class ShopDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_detail = shop_details(:one)
  end

  test 'should get index' do
    get shop_details_url
    assert_response :success
  end

  test 'should get new' do
    get new_shop_detail_url
    assert_response :success
  end

  test 'should create shop_detail' do
    assert_difference('ShopDetail.count') do
      post shop_details_url, params: { shop_detail: { deleted_at: @shop_detail.deleted_at, key: @shop_detail.key, value: @shop_detail.value } }
    end

    assert_redirected_to shop_detail_url(ShopDetail.last)
  end

  test 'should show shop_detail' do
    get shop_detail_url(@shop_detail)
    assert_response :success
  end

  test 'should get edit' do
    get edit_shop_detail_url(@shop_detail)
    assert_response :success
  end

  test 'should update shop_detail' do
    patch shop_detail_url(@shop_detail), params: { shop_detail: { deleted_at: @shop_detail.deleted_at, key: @shop_detail.key, value: @shop_detail.value } }
    assert_redirected_to shop_detail_url(@shop_detail)
  end

  test 'should destroy shop_detail' do
    assert_difference('ShopDetail.count', -1) do
      delete shop_detail_url(@shop_detail)
    end

    assert_redirected_to shop_details_url
  end
end
