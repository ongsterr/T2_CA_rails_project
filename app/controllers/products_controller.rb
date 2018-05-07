class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.transporter = current_user

    if @product.save
        flash[:notice] = 'Product created!'
        redirect_to product_show_path
    else
        flash[:alert] = 'Product listing could not be created!'
        redirect_back
    end
  end

  def show
  end

  def index
    @products = Product.all
  end

  def edit
  end

  def update
    if @product.update(product_params)
        flash[:notice] = 'Product updated!'
        redirect_to product_show_path
    else
        flash[:alert] = 'Product listing could not be updated!'
        redirect_back
    end
  end

  def destroy
    @product.destroy
    flash[:alert] = 'Product listing was successfully deleted!'
    redirect_to profile_show_path
  end

  private
    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:price_per_day, :vehicle_model, :vehicle_capacity, :vehicle_description, :vehicle_image_data, :cancellation_policy, :things_to_note, :location)
    end
end
