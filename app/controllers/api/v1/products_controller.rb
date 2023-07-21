class Api::V1::ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	require 'nokogiri'
	require 'net/http'

  def index
  	@products = Product.all 
  	render json: @products
  end 

	def create
		url = params[:url]
		uri = URI.parse(url)
		response = Net::HTTP.get_response(uri)
		doc = Nokogiri::HTML(response.body)
    product = Product.find_or_initialize_by(url: url)
		product.title = doc.css('h1 span').text.strip
		product.description = doc.at('div._1AtVbE').text.strip
		product.price = doc.at('div._30jeq3._16Jk6d').text.gsub(/[^\d\.]/, '').to_f
		product.product_image = doc.css("._3kidJX")[0].children[1].children[0].values.split(",")[0][3] rescue nil
		product.save!
		product.product_images.create(image: doc.css("._3kidJX")[0].children[1].children[0].values.split(",")[0][3]) rescue nil
		render json: product
	end

	def show
		@product = Product.find(params[:id])
		render json: @product
	end

  private

  def product_params
    params.require(:product).permit(:url)
  end
end
