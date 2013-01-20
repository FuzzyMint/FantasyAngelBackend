class Api::V1::UsersController  < ApplicationController 
  respond_to :json
  
  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
#    Rabl.render(@user, show.rabl, :view_path => '', :format => :json)
    Rabl::Renderer.json(@user, 'app/views/users/show.rabl')
  end

end  

