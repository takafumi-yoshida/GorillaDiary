class CreateDatetimes < ActiveRecord::Migration[5.2]
  def change
    create_table :datetimes do |t|
      t.integer :year ,null: false
      t.integer :month ,null: false
      t.integer :day ,null: false
      t.timestamps
    end
  end
end
