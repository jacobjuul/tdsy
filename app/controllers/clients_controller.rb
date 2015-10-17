class ClientsController < ApplicationController
  def import
    Client.import(params[:file])
    redirect_to admin_path, notice: "Products imported."
  end
end
