class User < ActiveRecord::Base
  before_save :default_values

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :token_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :investments, :dependent => :destroy
  has_many :startups, :through => :investments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :balance, :name
  # attr_accessible :title, :body

  def default_values
    if self.balance.nil?
      self.balance = 200000
    end
  end

end
