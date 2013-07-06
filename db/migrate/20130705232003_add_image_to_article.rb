class AddImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :thumb_src, :string
    add_column :articles, :thumb_height, :integer
    add_column :articles, :thumb_width, :integer
    add_column :articles, :thumb_wide_src, :string
    add_column :articles, :thumb_wide_height, :integer
    add_column :articles, :thumb_wide_width, :integer
  end
end
