class UsersController  < ApplicationController 
  respond_to :json
  
  def create
    amount = params[:amount]
    password = params[:password]
    
    if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json"}
        return
    end
    
    if email.nil? or password.nil? 
      render :status=>400, :json=>{:message=>"The request must contain the user email and password."}
      return
    end

    @user=User.find_by_email(email.downcase)
    
    if @user.nil?
      logger.info("User #{email} already exists.")
      render :status=>401, :json=>{:message=>"User #{email} already exists."}
      return
    end

    @user= User.create! :email => 'user2@example.com', :password => 'password', :password_confirmation => 'password', :name => 'Bob', :balance => 200000

    redirect_to '/tokens.json'

  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end  

