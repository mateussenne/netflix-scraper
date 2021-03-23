class MoviesSpider < Kimurai::Base
  @name = 'movies_spider'
  @engine = :mechanize
  @url = 'https://www.netflix.com/br/browse/genre/34399'

  def self.scrape
    @start_urls = [@url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//li[@class='nm-content-horizontal-row-item']").each do |movie|
      item = {}

      item[:name] = movie.css('span.nm-collections-title-name')&.text&.squish
      item[:url] = movie.css('a')[0]['href']
      item[:image] = movie.css('img')[0]['src']      

      Movie.where(item).first_or_create
    end
  end
end