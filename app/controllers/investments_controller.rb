class InvestmentsController  < ApplicationController 
  respond_to :json

def create
    @investor = User.find_by_authentication_token(params[:auth_token])
    @investment = @investor.investments.build(params[:investment])

    if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json"}
        return
    end
    
    if @investment.amount.nil?
      render :status=>400, :json=>{:message=>"The request must contain an investment amount."}
      return
    end

    if @investor.balance < @investment.amount
      render :status=>400, :json=>{:message=>"Not enough money"}
      return
    end

    @investment.save!
    newBalance = @investor.balance - @investment.amount
    @investor.update_attributes!(balance:newBalance)
    render :status=>200, :json=>{:message=>"Investment Created"}
    return

    #current_user.save!
  end

  def index
    @investments = Investment.all
#    @user = User.find_by_id(@investment.user_id)
#    @investments.each {|i| @users << User.find_by_id(i.user_id) }
  end

  def show
    @investment = Investment.find(params[:id])
    @user = User.find_by_id(@investment.user_id)
  end

end  

