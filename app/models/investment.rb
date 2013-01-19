class Investment < ActiveRecord::Base
  attr_accessible :amount, :startup_id, :user_id
  belongs_to :user
  belongs_to :startup, :primary_key => 'startup_id'
end
