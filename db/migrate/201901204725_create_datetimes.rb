class CreateDatetimes < ActiveRecord::Migration[5.2]
  def change
    create_table :datetimes do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.timestamps
    end
  end
end
