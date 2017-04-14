class AddColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :subject, :string
  end
end
