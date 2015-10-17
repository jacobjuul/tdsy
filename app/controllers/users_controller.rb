class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    
    if user
      user.assign_attributes(user_params)
      user.save(validate: false)
      flash[:success] = "Du deltager nu i konkurrencen222"
      redirect_to users_path
    else
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Du deltager nu i konkurrencen"
        redirect_to users_path
      else
        render 'new'
      end
    end

  end

  def import
    User.import(params[:file])
    redirect_to admin_path, notice: "Products imported."
  end

  def admin
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      format.xls #{ send_data @users.to_csv(col_sep: "\t"), filename: "users-#{Date.today}.xls" }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :position,
     :email, :telephone, :os, :communication)
  end
end
