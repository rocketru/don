class AddUsernameToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :username, :string
  end
end
