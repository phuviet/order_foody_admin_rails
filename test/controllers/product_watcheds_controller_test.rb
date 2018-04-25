require 'test_helper'

class ProductWatchedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_watched = product_watcheds(:one)
  end

  test 'should get index' do
    get product_watcheds_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_watched_url
    assert_response :success
  end

  test 'should create product_watched' do
    assert_difference('ProductWatched.count') do
      post product_watcheds_url, params: { product_watched: { deleted_at: @product_watched.deleted_at, product_id: @product_watched.product_id, user_id: @product_watched.user_id } }
    end

    assert_redirected_to product_watched_url(ProductWatched.last)
  end

  test 'should show product_watched' do
    get product_watched_url(@product_watched)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_watched_url(@product_watched)
    assert_response :success
  end

  test 'should update product_watched' do
    patch product_watched_url(@product_watched), params: { product_watched: { deleted_at: @product_watched.deleted_at, product_id: @product_watched.product_id, user_id: @product_watched.user_id } }
    assert_redirected_to product_watched_url(@product_watched)
  end

  test 'should destroy product_watched' do
    assert_difference('ProductWatched.count', -1) do
      delete product_watched_url(@product_watched)
    end

    assert_redirected_to product_watcheds_url
  end
end
