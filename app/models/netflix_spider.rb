class NetflixSpider < Kimurai::Base
  @name = 'netflix_spider'
  @engine = :selenium_chrome
  @url = 'https://www.netflix.com/br/browse/genre/34399'
  @config = {
    before_request: { delay: 8..10 }
  }

  def self.scrape
    @start_urls = [@url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//li[@class='nm-content-horizontal-row-item']").each do |movie|
      item = {}

      item[:name] = movie.css('span.nm-collections-title-name')&.text&.squish
      item[:url] = movie.css('a')[0]['href']
      item[:image] = movie.css('img.nm-collections-title-img')[0]['src']
      item [:stream_service] = 'netflix'      
      Movie.where(item).first_or_create
    end
  end
end
