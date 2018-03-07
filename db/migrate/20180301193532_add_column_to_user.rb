class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :dob, :string
    add_column :users, :gender_id, :integer
    add_column :users, :mobile, :string
  end
end
