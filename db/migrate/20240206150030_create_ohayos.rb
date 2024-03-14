class CreateOhayos < ActiveRecord::Migration[6.1]
  def change
    create_table :ohayos do |t|
      t.time :wake
      t.time :sleep
      t.integer :time
      t.string :feel
      t.text :what
      t.datetime :start_time

      t.timestamps
    end
  end
end
