class Admin::UsersController < ApplicationController
 before_filter :authenticate_user!, :admin_user?
# before_action :set_user , only: [:show , :edit, :update, :destroy]


  def index
    @users = User.all
    @orders = Order.all
    @order_items = OrderItem.all
  end

  # GET /admin/users/edit/1
  def edit
    @user  = User.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @user }
    end
  end


  def update_resource(resource, params)
  end 

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
       	format.html { redirect_to :admin_users, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
 end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


private
  def admin_user?
   redirect_to root_path, :alert => 'This page is allowed for admin' unless current_user.admin
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:email,:admin)
    end

end
