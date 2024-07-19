class CreateAuthorSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :author_subscribers do |t|
      t.references :author, null: false, foreign_key: true
      t.references :subscriber, null: false, foreign_key: true

      t.timestamps
    end
  end
end
