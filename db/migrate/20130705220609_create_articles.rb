class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :url
      t.string :summary

      t.timestamps
    end
  end
end
