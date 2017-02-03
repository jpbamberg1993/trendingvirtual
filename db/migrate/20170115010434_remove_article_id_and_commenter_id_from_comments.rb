class RemoveArticleIdAndCommenterIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :article_id, :integer
    remove_column :comments, :commenter_id, :integer
    remove_column :comments, :voter_id, :integer
  end
end
