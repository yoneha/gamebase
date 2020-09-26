class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.string :title
      t.string :content
      t.integer :score
      t.integer :playtime

      t.timestamps
      
      t.index [:user_id, :game_id], unique: true
    end
  end
end
