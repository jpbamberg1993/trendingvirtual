class ChangeRedactor2RailsAssetsToRedactor2Assets < ActiveRecord::Migration[5.1]
  def change
    rename_table :redactor2_rails_assets, :redactor2_assets
  end
end
