require 'application_system_test_case'

class HomesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'
    assert_selector 'h2', text: 'Twitter Scraping tool'
  end
end
