class AddUpvoteAndDownvoteToComments < ActiveRecord::Migration
  def change
    add_column :comments, :upvote, :integer
    add_column :comments, :downvote, :integer
  end
end
