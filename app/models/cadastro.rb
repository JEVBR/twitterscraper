class Cadastro < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true

  after_validation :scraper, :schrink_url

  private

  def scraper
    self.scraped_title = 'title not found'
    self.scraped_description = 'description not found'
    self.scraped_user = '@user not found'

    return unless url.match?(/\A(https:\/\/twitter.com\/)/)

    page = HTTParty.get(url)
    return unless (200..299).cover?(page.code)

    doc = Nokogiri::HTML(page)
    self.scraped_title = doc.css('.ProfileHeaderCard-nameLink.u-textInheritColor').text
    self.scraped_description = doc.css('.ProfileHeaderCard-bio.u-dir').text
    self.scraped_user = doc.css('.ProfileHeaderCard-screennameLink .username.u-dir').text
  end

  def schrink_url
    return if short_url.present?

    party_url = "https://is.gd/create.php?format=simple&url=#{url}"
    r = HTTParty.post(party_url)
    self.short_url = (200..299).cover?(r.code) ? r.parsed_response : 'No short URL available'
  end
end
