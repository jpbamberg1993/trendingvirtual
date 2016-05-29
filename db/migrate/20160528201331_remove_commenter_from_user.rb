class RemoveCommenterFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :commenter, :string
  end
end
