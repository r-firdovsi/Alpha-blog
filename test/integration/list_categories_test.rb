require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category_second = Category.create(name: "Travel")
  end

  test 'should show category listing' do
    get '/categories'
    assert_select "a[href=?]", categories_path(@category), text: @category.name
    assert_select "a[href=?]", categories_path(@category_second), text: @category_second.name
  end
end
