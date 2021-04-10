class PrimevideoSpider < Kimurai::Base
  @name = 'primevideo_spider'
  @engine = :selenium_chrome
  @url = 'https://www.amazon.com/Prime-Movies/b?ie=UTF8&node=7613704011'
  @config = {
    before_request: { delay: 4..7 }
  }

  def self.scrape
    @start_urls = [@url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//li[@class='-e5Lt1 tst-card-wrapper tst-hoverable-card']").each do |movie|
      item = {}

      item[:name] = movie.css('a')[0]['aria-label']
      # item[:synopsis] = movie.css('').text
      item[:url] = build_url(movie.css('a')[0]['href'])
      item[:image] = movie.css('img')[0]['src']
      item [:stream_service] = 'prime_video'
      Movie.where(item).first_or_create
      # puts item
    end
  end

  private

  def build_url(relative_url)
    "https://www.amazon.com#{relative_url}"
  end
end
