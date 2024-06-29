require "test_helper"

class ProductsTest < ActionDispatch::IntegrationTest
  def setup
    @product = products(:one)
    @maker = makers(:kokuyo)
  end
  test "index検索条件なし" do
    get products_path
    assert_response :success
    # 編集ボタン
    assert_select 'form[action=?]', edit_product_path(@product.id)
    # 削除ボタン
    assert_select 'form[action=?]', product_path(@product.id)
    assert_select 'td', @product.name
  end

  test "index商品名検索一致" do
    get products_path, params: { name: @product.name }
    assert_response :success
    # 編集ボタン
    assert_select 'form[action=?]', edit_product_path(@product.id)
    # 削除ボタン
    assert_select 'form[action=?]', product_path(@product.id)
    assert_select 'td', @product.name
  end

  test "index商品名検索不一致" do
    get products_path, params: { name: 'hogehoge' }
    assert_response :success
    assert_select 'td', false, @product.name
  end

  test "indexメーカー検索一致" do
    get products_path, params: { maker_id: @product.maker_id }
    assert_response :success
    # 編集ボタン
    assert_select 'form[action=?]', edit_product_path(@product.id)
    # 削除ボタン
    assert_select 'form[action=?]', product_path(@product.id)
    assert_select 'td', @product.name
  end

  test "indexメーカー検索不一致" do
    get products_path, params: { maker_id: 999 }
    assert_response :success
    assert_select 'td', false, @product.name
  end

  test "登録成功" do
    get new_product_path
    assert_response :success
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: 'test', maker_id: @maker.id, product_code: 'test',
          jancode: '123456789012', price: 123, unit: 1, note: 'note'} }
      @product = assigns(:product)
    end
  end

  test "登録失敗_商品名空白" do
    get new_product_path
    assert_response :success
    assert_difference 'Product.count', 0 do
      post products_path, params: { product: { name: '', maker_id: @maker.id, product_code: 'test',
        jancode: '123456789012', price: 123, unit: 1, note: 'note'} }
      @product = assigns(:product)
    end
  end

  test "更新成功" do
    get edit_product_path(@product)
    assert_response :success
    patch products_path, params: { product: { name: 'test2' } }
    assert @product.name, 'test2'
  end

  test "更新失敗" do
    get edit_product_path(@product)
    assert_response :success
    patch products_path, params: { product: { name: '' } }
    assert_not_equal @product.name, 'test2'
  end
end
