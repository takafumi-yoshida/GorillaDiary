class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title, presences: true
      t.text :content, presences: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
