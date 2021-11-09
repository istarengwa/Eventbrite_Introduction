class UserController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    
    user_params = params.permit(:first_name, :last_name, :description)
    # Pour valider les infos (sinon pas permis par Ruby)
    # require : permet de vérifier qu'une info est présente et la renvoie
    #permit: autoriser les informations pour qu'elles passent

    if @user.update(first_name: user_params["first_name"], last_name: user_params["last_name"], description: user_params["description"])
      redirect_to user_path, notice: "Your resume is saved!"
    else
      render 'edit', alert: "Oops! There was a problem, please try again"
    end
  end
end
