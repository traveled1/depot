#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_app, :authorize

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        session[:dest_url] = request.url
        redirect_to login_url, notice: "Please log in"
      end
    end

  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def init_app
      unless request.xhr?
        @cart = current_cart
      end
    end

end
