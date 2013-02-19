class StoreController < ApplicationController
  def index
    @products = Product.order(:title).limit(4)
  end
end
