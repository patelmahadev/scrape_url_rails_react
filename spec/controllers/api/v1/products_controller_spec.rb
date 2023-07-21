require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
 describe 'GET #index' do
  it 'returns a list of products' do
   get :index
   expect(response).to have_http_status(:success)
  end
 end

 describe 'POST #create' do
  it 'creates a new product' do
   url = 'https://www.flipkart.com/srpm-wayfarer-sunglasses/p/itmaf19ae5820c06'
   mock_response = instance_double(Net::HTTPResponse, body: '<html><body><h1><span>Product Title</span></h1><div class="_1AtVbE">Product Description</div><div class="_30jeq3 _16Jk6d">$19.99</div></body></html>')
   allow(Net::HTTP).to receive(:get_response).and_return(mock_response)
   post :create, params: { url: url }
   expect(response.status).to eq 200
  end
 end

 describe 'GET #show' do
  product = Product.create(url: 'https://www.flipkart.com/srpm-wayfarer-sunglasses/p/itmaf19ae5820c06' )
  it 'returns the details of a product' do

   get :show, params: { id: product.id }

   expect(response).to have_http_status(:success)
   expect(JSON.parse(response.body)).to eq(product.as_json)
  end
 end
end