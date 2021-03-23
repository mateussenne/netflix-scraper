class MoviesSpider < Kimurai::Base
  @name = 'movies_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='shop-srp-listings__listing-container']").each do |vehicle|
      item = {}
    end
  end

end