class AddBalanceAndNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :integer
    add_column :users, :name, :string
  end
end
