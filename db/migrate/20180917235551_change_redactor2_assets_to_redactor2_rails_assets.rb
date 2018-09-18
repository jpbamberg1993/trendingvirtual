class ChangeRedactor2AssetsToRedactor2RailsAssets < ActiveRecord::Migration[5.1]
  def change
    rename_table :redactor2_assets, :redactor2_rails_assets
  end
end
