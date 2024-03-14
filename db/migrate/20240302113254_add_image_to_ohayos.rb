class AddImageToOhayos < ActiveRecord::Migration[6.1]
  def change
    add_column :ohayos, :image, :string
  end
end
