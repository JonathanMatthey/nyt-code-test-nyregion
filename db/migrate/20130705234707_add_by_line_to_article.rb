class AddByLineToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :by_line, :string
  end
end
