require 'test_helper'

class ProductsImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_image = products_images(:one)
  end

  test 'should get index' do
    get products_images_url
    assert_response :success
  end

  test 'should get new' do
    get new_products_image_url
    assert_response :success
  end

  test 'should create products_image' do
    assert_difference('ProductsImage.count') do
      post products_images_url, params: { products_image: { deleted_at: @products_image.deleted_at, image: @products_image.image, product_id: @products_image.product_id } }
    end

    assert_redirected_to products_image_url(ProductsImage.last)
  end

  test 'should show products_image' do
    get products_image_url(@products_image)
    assert_response :success
  end

  test 'should get edit' do
    get edit_products_image_url(@products_image)
    assert_response :success
  end

  test 'should update products_image' do
    patch products_image_url(@products_image), params: { products_image: { deleted_at: @products_image.deleted_at, image: @products_image.image, product_id: @products_image.product_id } }
    assert_redirected_to products_image_url(@products_image)
  end

  test 'should destroy products_image' do
    assert_difference('ProductsImage.count', -1) do
      delete products_image_url(@products_image)
    end

    assert_redirected_to products_images_url
  end
end
