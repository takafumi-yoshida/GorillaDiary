class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title, presences: true, null: false
      t.text :content, presences: true, null: false
      t.references :user, foreign_key: true
      t.references :datetime, foreign_key: true
      t.timestamps
    end
  end
end
