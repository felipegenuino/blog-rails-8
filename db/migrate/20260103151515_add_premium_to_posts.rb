class AddPremiumToPosts < ActiveRecord::Migration[8.0]
  def change
     add_column :posts, :premium, :boolean, default: false, null: false
  end
end
