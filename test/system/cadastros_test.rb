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
end
