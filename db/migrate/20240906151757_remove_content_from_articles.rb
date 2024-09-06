class RemoveContentFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :content, :text
  end
end
