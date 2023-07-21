class ScrapingJob < ApplicationJob
  queue_as :default

  def perform
    products = Product.where('created_at < ?', 1.week.ago)
    products.each do |product|
      url = product.url
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      doc = Nokogiri::HTML(response.body)
      product = Product.find_or_initialize_by(url: url)
      product.title = doc.css('h1 span').text.strip
      product.description = doc.at('div._1AtVbE').text.strip
      product.price = doc.at('div._30jeq3._16Jk6d').text.gsub(/[^\d\.]/, '').to_f
      product.product_image = doc.css("._3kidJX")[0].children[1].children[0].values.split(",")[0][3]
      product.update!
      product.product_images.update(image: doc.css("._3kidJX")[0].children[1].children[0].values.split(",")[0][3])
    end
  end
end
