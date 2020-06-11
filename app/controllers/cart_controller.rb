class CartController < ApplicationController
 # before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def add
#    @plant = Plant.find(params[:id])
#    @item = @cart.add(params[:id])
    flash[:cart_notice] = "Added to cart"
    redirect_to "/plants#index"
  end


  def new
    @cart = Cart.new
    @cart.cart_items.new
  end

  def create
    #@cart = Cart.create(cart_params)
    #respond_with(@cart)
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    #@cart = Cart.find(params[:id])
    #@cart.update(cart_params)
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def index
    @cart = Cart.all
  end

    # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private
#  def set_cart
#    @cart = Cart.find(params[:id])
#  end

  def cart_params
    params.require(:cart).permit(cart_items_attributes: [:product_id, :quantity])
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end

end
