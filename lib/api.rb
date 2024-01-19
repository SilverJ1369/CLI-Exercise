require "nokogiri"
require "open-uri"
require "byebug"
require "json"

class API
  BASE_URL = 'https://books.toscrape.com/catalogue/category/books/'
  def self.get_data(category)
    case category
      when 1
        category = 'philosophy_7'
      when 2
        category = 'science_22'
      when 3
        category = 'psychology_26'
      when 4
        category = 'history_32'
      when 5
        category = 'health_47'
      else
        puts "Please enter a valid category"
      end
    doc = Nokogiri::HTML(URI.open(BASE_URL + category + "/index.html"))

    scrape_results = doc.css('article.product_pod>h3', 'p.price_color').text.strip
    scrape_results.each do |book|
      puts "#{book}\n"
    end

    
  end
end
