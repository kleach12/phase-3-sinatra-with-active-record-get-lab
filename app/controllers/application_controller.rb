class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do

    bakeries = Bakery.all

    bakeries.to_json
  end

  get '/bakeries/:id' do

    bakeries = Bakery.find(params[:id])

    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods' do

    goods_by_price = BakedGood.all

    goods_by_price.to_json

  end

  get '/baked_goods/by_price' do

    goods_by_price = BakedGood.by_price

    goods_by_price.to_json

  end

  get '/baked_goods/most_expensive' do

    goods_by_price = BakedGood.by_price.first()

    goods_by_price.to_json

  end

end
