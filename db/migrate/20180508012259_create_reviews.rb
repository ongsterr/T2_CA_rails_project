class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :booking, foreign_key: true
      t.references :reviewer, index: true
      t.references :reviewed, index: true
      t.text :review
      t.decimal :rating

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :reviewer_id
    add_foreign_key :reviews, :users, column: :reviewed_id
  end
end
