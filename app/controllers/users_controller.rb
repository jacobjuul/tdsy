class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    user = User.find_by(email: params[:user][:email].downcase)
    
    # Skip validation if the email already exsists AND
    # has a sales_manager connected
    if user && user.sales_manager_email
      user.assign_attributes(position: user_params["position"],
                             telephone: user_params["telephone"],
                             os: user_params["os"], 
                             communication: user_params["communication"])
      user.save(validate: false)
      flash[:success] = "Du deltager nu i konkurrencen222"
      redirect_to users_path

      # Finally send an email to the sales_manager
      user.send_manager_email if user.persisted?
    else
      
      # If the entered email is not already in the system
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
    redirect_to admin_path, notice: "Clients imported."
  end

  def admin
    @users = User.all
    @contestants = User.where("communication is not null")
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
      format.xls #{ send_data @users.to_csv(col_sep: "\t"), filename: "users-#{Date.today}.xls" }
    end


  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :position,
     :email, :telephone, :os, :communication, :company)
  end


end
