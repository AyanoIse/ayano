class AddUserToOhayos < ActiveRecord::Migration[6.1]
  def change
    add_column :ohayos, :user_id, :integer
  end
end
