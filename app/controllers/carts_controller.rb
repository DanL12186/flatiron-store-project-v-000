class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_cart = current_user.current_cart ||= Cart.new #fixes creates new cart when adding first item/uses same cart with 2nd
    @items = @current_cart.items
  end

  def checkout
    @items = current_user.current_cart.items
    @items.each do |item|
       item.line_items.each do |line_item|
         item.inventory -= line_item.quantity
         item.save
         current_user.current_cart.destroy
       end
     end
   end

private

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
