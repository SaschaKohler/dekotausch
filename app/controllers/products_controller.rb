class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:category_id]
        @products = Category.find(params[:category_id]).products
    else
     	@products = Product.all
    end
    @order_item = current_order.order_items.new
   end


  # GET /products/1
  # GET /products/1.json
  def show
    @product  = Product.find(params[:id])
    @pictures = @product.pictures

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product  = Product.find(params[:id])
    @pictures = @product.pictures
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)


    respond_to do |format|
      if @product.save
          if params[:images]
      	    #===== The magic is here ;)
            params[:images].each { |image|
            @product.pictures.create(image: image)
       	     }
      	     end

        format.html { redirect_to edit_user_registration_path , notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end

        format.html { redirect_to edit_user_registration_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to edit_user_registration_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :pictures,:category_id,
      					      :user_id)
    end
end
