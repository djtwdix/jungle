class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.order(id: :desc).all
  end

  def new
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Sale deleted!'
  end
end
