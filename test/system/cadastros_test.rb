require "application_system_test_case"

class CadastrosTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'
    # save_and_open_screenshot
    assert_selector 'h2', text: 'Twitter Scraping tool'
  end

  test 'visiting the all users' do
    visit '/cadastros'
    # save_and_open_screenshot
    assert_selector 'td', text: 'Trump'
    assert_selector 'td', text: 'you'
  end

  # test/system/products_test.rb
class ProductsTest < ApplicationSystemTestCase
  # [...]
  test "Create a user" do
    visit "/cadastros/new"
    # save_and_open_screenshot

    fill_in "cadastro_name", with: "Le Wagon"
    fill_in "cadastro_url", with: "https://twitter.com/usefretadao"
    # save_and_open_screenshot

    click_on 'Create'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    # assert_equal cadastros_path, page.current_path
    assert_selector 'h2', text: 'User Data'
  end
end
end
