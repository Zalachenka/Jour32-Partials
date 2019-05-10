class AddValidatedUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :validated, :boolean
  end
end
