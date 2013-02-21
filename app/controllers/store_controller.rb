class StoreController < ApplicationController
  def index
    @products = Product.order(:title).limit(10)
    @cart = current_cart
  end
end
