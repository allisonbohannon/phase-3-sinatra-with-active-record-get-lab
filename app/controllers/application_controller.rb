class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    Bakery.all.to_json
  end

  get "/bakeries/:id" do
    Bakery.find(params[:id]).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).limit(1)
    baked_goods.to_json
  end


end
