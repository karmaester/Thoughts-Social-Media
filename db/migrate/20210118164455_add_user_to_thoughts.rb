class AddUserToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_reference :thoughts, :user, null: false, foreign_key: true
  end
end
