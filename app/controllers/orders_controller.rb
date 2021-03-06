class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update require_correct_user]
  before_action :require_correct_user, only: %i[show]

  def create
    @order = Order.new(user_id: params[:user_id])
    if @order.save
      flash[:success] = "Successfully submitted your order totaling #{view_context.number_to_currency(@cart.total_price)}"
      @cart.checkout(@order)
      session[:cart] = Hash.new(0)
      redirect_to dashboard_path
    else
      redirect_to cart_path
    end
  end

  def show; end

  def update
    @order.update(status: params[:status])
    redirect_to admin_dashboard_path
  end

  private

    def order_params
      params.require(:order).permit(:status)
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def require_correct_user
      return render file: 'public/404' if current_user.nil?
      render file: 'public/404' unless current_user.id == @order.user_id || current_admin?
    end
end
