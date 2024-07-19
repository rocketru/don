class CreateAuthorPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :author_posts do |t|
      t.references :author, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
