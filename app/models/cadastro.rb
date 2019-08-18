class Cadastro < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true

  after_validation :default, :scraper, :schrink_url

  private

  def default
    # after validation went well, get the data from Twitter and make a short URL
    self.scraped_title = 'title not found'
    self.scraped_description = 'description not found'
    self.scraped_user = '@user not found'
  end

  def scraper
    # Url not on twitter: (could make this as a validation)
    return unless url.match?(/\A(https:\/\/twitter.com\/)/)

    page = HTTParty.get(url)
    # keep the "not found" msg if party not good (200.299 range = good)
    return unless (200..299).cover?(page.code)

    doc = Nokogiri::HTML(page)
    self.scraped_title = doc.css('.ProfileHeaderCard-nameLink.u-textInheritColor').text
    self.scraped_description = doc.css('.ProfileHeaderCard-bio.u-dir').text
    self.scraped_user = doc.css('.ProfileHeaderCard-screennameLink .username.u-dir').text
  end

  def schrink_url
    self.short_url = 'VeryshortURL'
  end
end
