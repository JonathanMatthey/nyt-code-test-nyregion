class AddLastPublishedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :last_published, :time
  end
end
