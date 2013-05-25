class ApplicationController < ActionController::Base
  protect_from_forgery

  private #se marca como privado el meto, y así se evita que Rails lo
          #utilice como una acción disponible en el controlador

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
